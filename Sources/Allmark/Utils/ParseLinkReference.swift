import Foundation

func parseLinkReference(
	state: inout BlockParserState,
	start: Int
) -> LinkReference? {
	let blankLineRegex = try! NSRegularExpression(pattern: "(\\r?\\n|\\r)[ \\t]*\\1", options: [])

	var currentStart = start

	// Consume spaces
	let firstSpacesLen = consumeSpaces(text: state.src, i: currentStart)
	let firstSpaces = String(decoding: state.src[currentStart ..< currentStart + firstSpacesLen], as: UTF8.self)
	let spacesRange = NSRange(location: 0, length: firstSpaces.utf16.count)
	if blankLineRegex.firstMatch(in: firstSpaces, options: [], range: spacesRange) != nil {
		return nil
	}
	currentStart += firstSpacesLen

	// Get the url
	var url = ""
	let src = state.src
	if currentStart < src.count {
		if src[currentStart] == ANGLE_LEFT_CODE {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == ANGLE_RIGHT_CODE, !isEscaped(text: src, i: i) {
					url = charToString(src, from: currentStart, to: i)
					currentStart = i + 1
					break
				}
			}
		} else {
			for i in currentStart ... src.count {
				if i == src.count || isSpace(code: src[i]) {
					url = charToString(src, from: currentStart, to: i)
					currentStart = i
					break
				}
			}
		}
	}

	if !url.isEmpty {
		url = decodeEntities(text: url)
		url = escapeBackslashes(text: url)
		// HACK:
		let allowedChars = CharacterSet.urlHostAllowed.union(CharacterSet.urlPathAllowed).union(CharacterSet.urlUserAllowed).union(CharacterSet.urlPasswordAllowed).union(CharacterSet.urlQueryAllowed).union(CharacterSet.urlFragmentAllowed).union(CharacterSet(charactersIn: "#"))
		if let encoded = url.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: allowedChars) {
			url = encoded
		}
	}

	let urlEnd = currentStart

	// Consume spaces
	let titleSpacesLen = consumeSpaces(text: src, i: currentStart)
	let spaces = String(decoding: src[currentStart ..< currentStart + titleSpacesLen], as: UTF8.self)
	currentStart += titleSpacesLen

	// Get the title
	var title = ""
	if currentStart < src.count {
		let delimiter = src[currentStart]

		if delimiter == QUOTE_SINGLE_CODE || delimiter == QUOTE_DOUBLE_CODE {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == delimiter, !isEscaped(text: src, i: i) {
					title = charToString(src, from: currentStart, to: i)
					currentStart = i + 1
					break
				}
			}
		} else if delimiter == PAREN_OPEN_CODE {
			currentStart += 1
			var level = 1
			for i in currentStart ..< src.count {
				if !isEscaped(text: src, i: i) {
					if src[i] == PAREN_CLOSE_CODE {
						level -= 1
						if level == 0 {
							title = charToString(src, from: currentStart, to: i)
							currentStart = i + 1
							break
						}
					} else if src[i] == PAREN_OPEN_CODE {
						level += 1
					}
				}
			}
		}
	}

	if !title.isEmpty {
		if spaces.isEmpty {
			return nil
		}

		let titleRange = NSRange(location: 0, length: title.utf16.count)
		if blankLineRegex.firstMatch(in: title, options: [], range: titleRange) != nil {
			return nil
		}

		title = decodeEntities(text: title)
		title = escapeBackslashes(text: title)
		title = escapeHtml(text: title)
	}

	// Check for non-whitespace after title
	if currentStart > 0 {
		if !isNewLine(code: src[currentStart - 1]) {
			while currentStart < src.count {
				if isNewLine(code: src[currentStart]) {
					currentStart += 1
					break
				} else if isSpace(code: src[currentStart]) {
					currentStart += 1
				} else {
					if spaces.contains("\r\n") || spaces.contains("\n") || spaces.contains("\r") {
						title = ""
						currentStart = urlEnd
						break
					} else {
						return nil
					}
				}
			}
		}
	}

	state.i = currentStart
	return LinkReference(url: url, title: title)
}

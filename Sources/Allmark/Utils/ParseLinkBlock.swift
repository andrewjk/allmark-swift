import Foundation

func parseLinkBlock(
	state: inout BlockParserState,
	start: Int,
	_end _: String
) -> LinkReference? {
	let blankLineRegex = try! NSRegularExpression(pattern: "\\n[ \\t]*\\n", options: [])

	var currentStart = start

	// Consume spaces
	var spaces = consumeSpaces(text: state.src, i: currentStart)
	let spacesRange = NSRange(location: 0, length: spaces.utf16.count)
	if blankLineRegex.firstMatch(in: spaces, options: [], range: spacesRange) != nil {
		return nil
	}
	currentStart += spaces.count

	// Get the url
	var url = ""
	let src = state.src
	if currentStart < src.count {
		if src[currentStart] == 0x3C /* < */ {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == 0x3E /* > */, !isEscaped(text: src, i: i) {
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
		if url.contains("\r") || url.contains("\n") {
			return nil
		}
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
	spaces = consumeSpaces(text: src, i: currentStart)
	currentStart += spaces.count

	// Get the title
	var title = ""
	if currentStart < src.count {
		let delimiter = src[currentStart]

		if delimiter == 0x27 /* ' */ || delimiter == 0x22 /* " */ {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == delimiter, !isEscaped(text: src, i: i) {
					title = charToString(src, from: currentStart, to: i)
					currentStart = i + 1
					break
				}
			}
		} else if delimiter == 0x28 /* ( */ {
			currentStart += 1
			var level = 1
			for i in currentStart ..< src.count {
				if !isEscaped(text: src, i: i) {
					if src[i] == 0x29 /* ) */ {
						level -= 1
						if level == 0 {
							title = charToString(src, from: currentStart, to: i)
							currentStart = i + 1
							break
						}
					} else if src[i] == 0x28 /* ( */ {
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
					if spaces.contains("\n") {
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

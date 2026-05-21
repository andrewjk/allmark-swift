import Foundation

func parseLinkReference(
	state: inout BlockParserState,
	start: Int
) -> LinkReference? {
	let blankLineRegex = try! NSRegularExpression(pattern: "\\r?\\n[ \\t]*\\r?\\n", options: [])

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
		if src[currentStart] == "<" {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == ">", !isEscaped(text: src, i: i) {
					url = charToString(src, from: currentStart, to: i)
					currentStart = i + 1
					break
				}
			}
		} else {
			for i in currentStart ... src.count {
				if i == src.count || isSpace(code: src[i].asciiValue ?? 0) {
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
	spaces = consumeSpaces(text: src, i: currentStart)
	currentStart += spaces.count

	// Get the title
	var title = ""
	if currentStart < src.count {
		let delimiter = src[currentStart]

		if delimiter == "'" || delimiter == "\"" {
			currentStart += 1
			for i in currentStart ..< src.count {
				if src[i] == delimiter, !isEscaped(text: src, i: i) {
					title = charToString(src, from: currentStart, to: i)
					currentStart = i + 1
					break
				}
			}
		} else if delimiter == "(" {
			currentStart += 1
			var level = 1
			for i in currentStart ..< src.count {
				if !isEscaped(text: src, i: i) {
					if src[i] == ")" {
						level -= 1
						if level == 0 {
							title = charToString(src, from: currentStart, to: i)
							currentStart = i + 1
							break
						}
					} else if src[i] == "(" {
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
		if !isNewLine(char: src[currentStart - 1]) {
			while currentStart < src.count {
				if isNewLine(char: src[currentStart]) {
					currentStart += 1
					break
				} else if isSpace(char: src[currentStart]) {
					currentStart += 1
				} else {
					if spaces.contains("\n") || spaces.contains("\r\n") {
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

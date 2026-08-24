import Foundation

func parseLinkInline(
	state: inout InlineParserState,
	start: Int
) -> LinkReference? {
	var currentStart = start
	let src = state.src

	// Consume spaces
	currentStart += consumeSpaces(text: src, i: currentStart)

	// Get the url
	var url = ""
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
			var level = 1
			for i in currentStart ... src.count {
				if i < src.count && !isEscaped(text: src, i: i) {
					if src[i] == PAREN_CLOSE_CODE {
						level -= 1
						if level == 0 {
							url = charToString(src, from: currentStart, to: i)
							currentStart = i
							break
						}
					} else if src[i] == PAREN_OPEN_CODE {
						level += 1
					}
				}

				if i == src.count || isSpace(code: src[i]) {
					url = charToString(src, from: currentStart, to: i)
					currentStart = i
					break
				}
			}
		}
	}

	if !url.isEmpty {
		if url.contains("\n") || url.contains("\r\n") || url.contains("\r") {
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

	// Consume spaces
	currentStart += consumeSpaces(text: src, i: currentStart)

	// Get the title
	var title = ""
	if currentStart < src.count {
		let delimiter = src[currentStart]

		if delimiter == PAREN_CLOSE_CODE {
			// No title
		} else if delimiter == QUOTE_SINGLE_CODE || delimiter == QUOTE_DOUBLE_CODE {
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
		} else {
			return nil
		}
	}

	if !title.isEmpty {
		title = decodeEntities(text: title)
		title = escapeBackslashes(text: title)
		title = escapeHtml(text: title)
	}

	currentStart += consumeSpaces(text: src, i: currentStart)

	if currentStart >= src.count {
		return nil
	}

	if src[currentStart] != PAREN_CLOSE_CODE {
		return nil
	}

	state.i = currentStart + 1
	return LinkReference(url: url, title: title)
}

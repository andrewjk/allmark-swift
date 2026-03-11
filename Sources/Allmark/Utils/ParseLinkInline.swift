import Foundation

func parseLinkInline(
	state: inout InlineParserState,
	start: Int,
	_end: String
) -> LinkReference? {
	let blankLineRegex = try! NSRegularExpression(pattern: "\\n[ \\t]*\\n", options: [])
	
	var currentStart = start
	let src = state.src
	
	// Consume spaces
	var spaces = consumeSpaces(text: src, i: currentStart)
	let spacesRange = NSRange(location: 0, length: spaces.utf16.count)
	if blankLineRegex.firstMatch(in: spaces, options: [], range: spacesRange) != nil {
		return nil
	}
	currentStart += spaces.count
	
	// Get the url
	var url = ""
	if currentStart < src.count {
		let index = src.index(src.startIndex, offsetBy: currentStart)
		if src[index] == "<" {
			currentStart += 1
			for i in currentStart..<src.count {
				let charIndex = src.index(src.startIndex, offsetBy: i)
				if src[charIndex] == ">" && !isEscaped(text: src, i: i) {
					let startIndex = src.index(src.startIndex, offsetBy: currentStart)
					let endIndex = src.index(src.startIndex, offsetBy: i)
					url = String(src[startIndex..<endIndex])
					currentStart = i + 1
					break
				}
			}
		} else {
			var level = 1
			for i in currentStart...src.count {
				if i < src.count && !isEscaped(text: src, i: i) {
					let charIndex = src.index(src.startIndex, offsetBy: i)
					if src[charIndex] == ")" {
						level -= 1
						if level == 0 {
							let startIndex = src.index(src.startIndex, offsetBy: currentStart)
							let endIndex = src.index(src.startIndex, offsetBy: i)
							url = String(src[startIndex..<endIndex])
							currentStart = i
							break
						}
					} else if src[charIndex] == "(" {
						level += 1
					}
				}
				
				if i == src.count || isSpace(code: Int(src[src.index(src.startIndex, offsetBy: i)].asciiValue ?? 0)) {
					let startIndex = src.index(src.startIndex, offsetBy: currentStart)
					let endIndex = src.index(src.startIndex, offsetBy: i)
					url = String(src[startIndex..<endIndex])
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
	
	// Consume spaces
	spaces = consumeSpaces(text: src, i: currentStart)
	currentStart += spaces.count
	
	// Get the title
	var title = ""
	if currentStart < src.count {
		let index = src.index(src.startIndex, offsetBy: currentStart)
		let delimiter = src[index]
		
		if delimiter == ")" {
			// No title
		} else if delimiter == "'" || delimiter == "\"" {
			currentStart += 1
			for i in currentStart..<src.count {
				let charIndex = src.index(src.startIndex, offsetBy: i)
				if src[charIndex] == delimiter && !isEscaped(text: src, i: i) {
					let startIndex = src.index(src.startIndex, offsetBy: currentStart)
					let endIndex = src.index(src.startIndex, offsetBy: i)
					title = String(src[startIndex..<endIndex])
					currentStart = i + 1
					break
				}
			}
		} else if delimiter == "(" {
			currentStart += 1
			var level = 1
			for i in currentStart..<src.count {
				if !isEscaped(text: src, i: i) {
					let charIndex = src.index(src.startIndex, offsetBy: i)
					if src[charIndex] == ")" {
						level -= 1
						if level == 0 {
							let startIndex = src.index(src.startIndex, offsetBy: currentStart)
							let endIndex = src.index(src.startIndex, offsetBy: i)
							title = String(src[startIndex..<endIndex])
							currentStart = i + 1
							break
						}
					} else if src[charIndex] == "(" {
						level += 1
					}
				}
			}
		} else {
			return nil
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
	
	spaces = consumeSpaces(text: src, i: currentStart)
	currentStart += spaces.count
	
	if currentStart >= src.count {
		return nil
	}
	
	let index = src.index(src.startIndex, offsetBy: currentStart)
	if src[index] != ")" {
		return nil
	}
	
	state.i = currentStart + 1
	return LinkReference(url: url, title: title)
}

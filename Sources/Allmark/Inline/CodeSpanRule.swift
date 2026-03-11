import Foundation

@MainActor
let codeSpanRule = InlineRule(
	name: "code_span",
	test: testCodeSpan
)

func testCodeSpan(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == "`" && !isEscaped(text: src, i: state.i) {
		var openMatched = 1
		var openEnd = state.i + 1
		
		while openEnd < src.count {
			let endIndex = src.index(src.startIndex, offsetBy: openEnd)
			if src[endIndex] == char {
				openMatched += 1
				openEnd += 1
			} else {
				break
			}
		}
		
		let markup = String(repeating: "`", count: openMatched)
		
		// "The contents of a code block are literal text, and do not get parsed as Markdown"
		var closeEnd = state.i + openMatched
		closeEnd = skipSpaces(text: src, start: closeEnd)
		
		var closeMatched = 0
		while closeEnd < src.count {
			let endIndex = src.index(src.startIndex, offsetBy: closeEnd)
			if src[endIndex] == char {
				closeMatched = 0
				var innerEnd = closeEnd
				while innerEnd < src.count {
					let innerIndex = src.index(src.startIndex, offsetBy: innerEnd)
					if src[innerIndex] == char {
						closeMatched += 1
						innerEnd += 1
					} else {
						break
					}
				}
				if closeMatched == openMatched {
					closeEnd = innerEnd
					break
				}
				closeEnd = innerEnd
			} else {
				closeEnd += 1
			}
		}
		
		if closeMatched == openMatched {
			state.i += openMatched
			
			let contentStart = state.i
			let contentEnd = closeEnd - closeMatched
			let contentStartIndex = src.index(src.startIndex, offsetBy: contentStart)
			let contentEndIndex = src.index(src.startIndex, offsetBy: contentEnd)
			var content = String(src[contentStartIndex..<contentEndIndex])
			
			// "[L]ine endings are converted to spaces"
			content = content.replacingOccurrences(of: "\r", with: " ")
			content = content.replacingOccurrences(of: "\n", with: " ")
			
			// "If the resulting string both begins and ends with a space
			// character, but does not consist entirely of space characters, a
			// single space character is removed from the front and back. This
			// allows you to include code that begins or ends with backtick
			// characters, which must be separated by whitespace from the
			// opening or closing backtick strings"
			//
			// "Only spaces, and not unicode whitespace in general, are stripped
			// in this way"
			let hasNonSpace = content.range(of: "[^\\s]", options: .regularExpression) != nil
			let firstChar = content.first
			let lastChar = content.last
			
			if hasNonSpace && firstChar == " " && lastChar == " " {
				content = String(content.dropFirst().dropLast())
			}
			
			let textNode = MarkdownNode(
				type: "text",
				block: false,
				index: state.i,
				line: state.line,
				column: 1,
				markup: content,
				indent: 0,
				children: nil
			)
			
			let codeNode = MarkdownNode(
				type: "code_span",
				block: false,
				index: state.i,
				line: state.line,
				column: 1,
				markup: markup,
				indent: 0,
				children: [textNode]
			)
			
			parent.children?.append(codeNode)
			state.i = closeEnd
			
			return true
		}
		
		addMarkupAsText(markup: markup, state: &state, parent: &parent)
		return true
	}
	
	return false
}

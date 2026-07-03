import Foundation

let textRule = InlineRule(
	name: "text",
	test: testText
)

/**
 * The text inline rule handles any character that hasn't been handled by a
 * previous rule
 */
func testText(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	var char = src[state.i]

	var lastNode = parent.children.last
	if lastNode == nil || lastNode?.type != "text" {
		let newTextNode = newText(
			index: state.parentIndex + state.i,
			line: state.line,
			content: "",
			indent: 0
		)
		parent.children.append(newTextNode)
		lastNode = newTextNode
	} else if isNewLine(char: char) {
		if let last = lastNode {
			var content = last.content
			while content.last?.isWhitespace == true {
				content.removeLast()
			}
			last.content = content
			last.length = content.count
		}
		if state.i + 1 < src.count, isSpace(char: src[state.i + 1]) {
			lastNode!.content += String(char)
			lastNode!.length = lastNode!.content.count
			state.i += 2
			while state.i < src.count, isSpace(char: src[state.i]) {
				state.i += 1
			}
			lastNode = newText(
				index: state.parentIndex + state.i,
				line: state.line,
				content: "",
				indent: 0
			)
			parent.children.append(lastNode!)
			if state.i < src.count {
				char = src[state.i]
			} else {
				return true
			}
		}
	}

	let currentLast = parent.children.last!
	if isAlphaNumeric(char: char) {
		let start = state.i
		state.i += 1
		while state.i < src.count {
			let nextCode = src[state.i]
			if isAlphaNumeric(char: nextCode) {
				state.i += 1
			} else {
				break
			}
		}
		currentLast.content += charToString(src, from: start, to: state.i)
	} else {
		// For non-ASCII characters, we need to handle multi-byte UTF-8 sequences
		// ASCII characters are 0-127, UTF-8 continuation bytes are 128-191
		// UTF-8 start bytes are 192-247 (2-byte: 192-223, 3-byte: 224-239, 4-byte: 240-247)
		let start = state.i
		state.i += 1

		// If this is a UTF-8 start byte (192-247), collect continuation bytes (128-191)
		let code = char.asciiValue ?? 0
		if code >= 192 && code <= 247 {
			while state.i < src.count {
				let nextByte = src[state.i].asciiValue ?? 0
				// Continuation bytes are in range 128-191 (0x80-0xBF)
				if nextByte >= 128 && nextByte <= 191 {
					state.i += 1
				} else {
					break
				}
			}
		}

		currentLast.content += charToString(src, from: start, to: state.i)
	}

	currentLast.length = currentLast.content.count

	return true
}

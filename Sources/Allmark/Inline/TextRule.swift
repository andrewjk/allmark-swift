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

	let char = src[state.i]

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
	} else if isNewLine(code: char) {
		if let last = lastNode {
			var content = last.content
			while let c = content.last, isWhitespace(code: c) {
				content.removeLast()
			}
			last.content = content
			last.length = content.count
		}
		if state.i + 1 < src.count, isSpace(code: src[state.i + 1]) {
			if char == CARRIAGE_RETURN_CODE, src[state.i + 1] == NEW_LINE_CODE {
				lastNode!.content += "\r\n"
			} else {
				lastNode!.content += byteString(char)
			}
			lastNode!.length = lastNode!.content.count
			state.i += 2
			while state.i < src.count, isSpace(code: src[state.i]) {
				state.i += 1
			}
			lastNode = newText(
				index: state.parentIndex + state.i,
				line: state.line,
				content: "",
				indent: 0
			)
			parent.children.append(lastNode!)
			return true
		}
	}

	let currentLast = parent.children.last!
	if isAlphaNumeric(code: char) {
		let start = state.i
		state.i += 1
		while state.i < src.count {
			let nextCode = src[state.i]
			if isAlphaNumeric(code: nextCode) {
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
		let code = char
		if code >= 192 && code <= 247 {
			while state.i < src.count {
				let nextByte = src[state.i]
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

	// For text nodes, content is accumulated 1:1 from the inline source, so
	// the length can be computed without re-counting the string
	currentLast.length = currentLast.type == "text"
		? state.parentIndex + state.i - currentLast.index
		: currentLast.content.count

	return true
}

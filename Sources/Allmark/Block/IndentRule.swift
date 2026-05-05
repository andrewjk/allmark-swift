import Foundation

/// Indentation handling for spaces and tabs

let indentRule = BlockRule(
	name: "indent",
	testStart: testIndentStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testIndentStart(state: inout BlockParserState, parent _: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if isSpace(char: char) {
		while state.i < src.count {
			let currentChar = src[state.i]

			if currentChar == " " {
				state.indent += 1
				state.i += 1
			} else if currentChar == "\t" {
				state.indent += 4 - (state.indent % 4)
				state.i += 1
			} else {
				break
			}
		}
	}

	return false
}

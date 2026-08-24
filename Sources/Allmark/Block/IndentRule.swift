import Foundation

/// Indentation handling for spaces and tabs

let indentRule = BlockRule(
	name: "indent",
	testStart: testIndentStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testIndentStart(state: inout BlockParserState, parent _: MarkdownNode, endOfLine _: Int) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if isSpace(code: char) {
		while state.i < src.count {
			let currentChar = src[state.i]

			if currentChar == SPACE_CODE {
				state.indent += 1
				state.i += 1
			} else if currentChar == TAB_CODE {
				state.indent += 4 - (state.indent % 4)
				state.i += 1
			} else {
				break
			}
		}
	}

	return false
}

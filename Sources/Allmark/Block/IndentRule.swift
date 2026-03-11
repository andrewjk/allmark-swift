import Foundation

/// Indentation handling for spaces and tabs
@MainActor
let indentRule = BlockRule(
	name: "indent",
	testStart: testIndentStart,
	testContinue: testIndentContinue,
	closeNode: { _, _ in }
)

// TODO: Should this be built in and not a rule??
func testIndentStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if isSpace(code: Int(char.asciiValue ?? 0)) {
		while state.i < src.count {
			let charIndex = src.index(src.startIndex, offsetBy: state.i)
			let currentChar = src[charIndex]
			
			if currentChar == " " {
				state.indent += 1
				state.i += 1
			} else if currentChar == "\t" {
				// Set spaces to the next tabstop of 4 characters
				state.indent += 4 - (state.indent % 4)
				state.i += 1
			} else {
				break
			}
		}
	}
	
	return false
}

func testIndentContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

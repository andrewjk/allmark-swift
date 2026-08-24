import Foundation

/// Parses a block by testing each rule's start condition
/// - Parameters:
///   - state: The block parser state
///   - parent: The parent markdown node
///   - endOfLine: The index of the end of the current line

func parseBlock(state: inout BlockParserState, parent: MarkdownNode, endOfLine: Int) {
	state.isEscaped = isEscaped(text: state.src, i: state.i)

	for rule in state.rules {
		let handled = rule.testStart(&state, parent, endOfLine)

		if handled {
			return
		}
	}
}

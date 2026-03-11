import Foundation

/// Parses a block by testing each rule's start condition
/// - Parameters:
///   - state: The block parser state
///   - parent: The parent markdown node
@MainActor
func parseBlock(state: inout BlockParserState, parent: MarkdownNode) {
	for (_, rule) in state.rules {
		let handled = rule.testStart(&state, parent)
		
		if handled {
			return
		}
	}
}

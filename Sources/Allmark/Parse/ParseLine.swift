import Foundation

/// Parses a single line, handling continuation of open nodes and starting new blocks
/// - Parameter state: The block parser state (modified in place)
@MainActor
func parseLine(state: inout BlockParserState) {
	state.indent = 0
	state.line += 1
	state.lineStart = state.i
	state.maybeContinue = false
	
	parseIndent(state: &state)
	
	// Skip document -- it's always going to continue
	for i in 1..<state.openNodes.count {
		let node = state.openNodes[i]
		
		guard let rule = state.rules[node.type] else {
			continue
		}
		
		if rule.testContinue(&state, node) {
			parseIndent(state: &state)
		} else {
			closeNode(state: &state, node: node)
			state.openNodes.removeSubrange(i...)
			break
		}
	}
	
	let parent = state.openNodes.last!
	parseBlock(state: &state, parent: parent)
}

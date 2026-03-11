import Foundation

@MainActor
func closeNode(state: inout BlockParserState, node: MarkdownNode) {
	var i = state.openNodes.count - 1
	while i > 0 {
		let openNode = state.openNodes[i]
		if let rule = state.rules[openNode.type] {
			rule.closeNode(&state, openNode)
		}
		// Compare nodes by index and type since we can't use ==
		if openNode.index == node.index && openNode.type == node.type {
			break
		}
		i -= 1
	}
}

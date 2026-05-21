import Foundation

func closeNode(state: inout BlockParserState, node: MarkdownNode) {
	node.length = state.i - node.index

	if let rule = state.rulesMap[node.type] {
		rule.closeNode(&state, node)
	}
}

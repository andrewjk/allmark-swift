import Foundation

func renderNode(node: MarkdownNode, state: inout RendererState, decode: Bool = true) {
	if let renderer = state.renderersMap[node.type] {
		renderer.render(node, &state, decode)
	}
}

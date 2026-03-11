import Foundation

@MainActor
func renderNode(node: MarkdownNode, state: inout RendererState, first: Bool = false, last: Bool = false, decode: Bool = true) {
	if let renderer = state.renderers[node.type] {
		renderer.render(node, &state, first, last, decode)
	}
}

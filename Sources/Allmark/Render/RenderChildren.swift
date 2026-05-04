import Foundation

func renderChildren(node: MarkdownNode, state: inout RendererState, decode: Bool = true) {
	if !node.children.isEmpty {
		for child in node.children {
			renderNode(node: child, state: &state, decode: decode)
		}
	}
}

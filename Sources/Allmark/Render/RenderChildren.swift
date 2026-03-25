import Foundation

func renderChildren(node: MarkdownNode, state: inout RendererState, decode: Bool = true) {
	if let children = node.children, !children.isEmpty {
		for child in children {
			renderNode(node: child, state: &state, decode: decode)
		}
	}
}

import Foundation

@MainActor
func renderChildren(node: MarkdownNode, state: inout RendererState, decode: Bool = true) {
	if let children = node.children, !children.isEmpty {
		let trim = node.type != "code_block" && node.type != "code_fence" && node.type != "code_span"
		for (i, child) in children.enumerated() {
			let first = i == 0
			let last = i == children.count - 1
			renderNode(node: child, state: &state, first: trim && first, last: trim && last, decode: decode)
		}
	}
}

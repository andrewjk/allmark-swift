import Foundation

let subscriptRenderer = Renderer(
	name: "subscript",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "sub") }
)

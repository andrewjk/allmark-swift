import Foundation

let subscriptRenderer = Renderer(
	name: "subscript",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "sub") }
)

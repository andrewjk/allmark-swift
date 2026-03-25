import Foundation

let strongRenderer = Renderer(
	name: "strong",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "strong") }
)

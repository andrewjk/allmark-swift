import Foundation

@MainActor
let strongRenderer = Renderer(
	name: "strong",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "strong") }
)

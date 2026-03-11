import Foundation

@MainActor
let strikethroughRenderer = Renderer(
	name: "strikethrough",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "del") }
)

import Foundation

@MainActor
let highlightRenderer = Renderer(
	name: "highlight",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "mark") }
)

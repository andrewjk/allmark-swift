import Foundation

let highlightRenderer = Renderer(
	name: "highlight",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "mark") }
)

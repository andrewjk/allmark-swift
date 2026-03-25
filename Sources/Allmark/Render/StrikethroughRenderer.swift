import Foundation

let strikethroughRenderer = Renderer(
	name: "strikethrough",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "del") }
)

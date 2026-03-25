import Foundation

let superscriptRenderer = Renderer(
	name: "superscript",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "sup") }
)

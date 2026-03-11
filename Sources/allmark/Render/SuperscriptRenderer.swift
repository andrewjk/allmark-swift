import Foundation

@MainActor
let superscriptRenderer = Renderer(
	name: "superscript",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "sup") }
)

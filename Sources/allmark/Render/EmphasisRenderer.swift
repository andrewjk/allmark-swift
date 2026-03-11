import Foundation

@MainActor
let emphasisRenderer = Renderer(
	name: "emphasis",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "em") }
)

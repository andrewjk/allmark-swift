import Foundation

let emphasisRenderer = Renderer(
	name: "emphasis",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "em") }
)

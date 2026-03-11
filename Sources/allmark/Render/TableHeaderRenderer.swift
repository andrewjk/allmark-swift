import Foundation

@MainActor
let tableHeaderRenderer = Renderer(
	name: "table_header",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "th") }
)

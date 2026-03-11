import Foundation

@MainActor
let tableRowRenderer = Renderer(
	name: "table_row",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "tr") }
)

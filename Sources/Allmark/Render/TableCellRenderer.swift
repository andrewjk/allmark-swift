import Foundation

@MainActor
let tableCellRenderer = Renderer(
	name: "table_cell",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "td") }
)

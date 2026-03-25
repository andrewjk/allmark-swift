import Foundation

let tableCellRenderer = Renderer(
	name: "table_cell",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "td") }
)

import Foundation

let tableRowRenderer = Renderer(
	name: "table_row",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "tr") }
)

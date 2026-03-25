import Foundation

let tableHeaderRenderer = Renderer(
	name: "table_header",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "th") }
)

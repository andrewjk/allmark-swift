import Foundation

let thematicBreakRenderer = Renderer(
	name: "thematic_break",
	render: { node, state, _, _, _ in renderSelfClosedTag(node: node, state: &state, tag: "hr") }
)

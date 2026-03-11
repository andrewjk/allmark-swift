import Foundation

@MainActor
let codeSpanRenderer = Renderer(
	name: "code_span",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "code", decode: false) }
)

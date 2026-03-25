import Foundation

let codeSpanRenderer = Renderer(
	name: "code_span",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "code", decode: false) }
)

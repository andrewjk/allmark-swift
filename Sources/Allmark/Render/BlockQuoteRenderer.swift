import Foundation

@MainActor
let blockQuoteRenderer = Renderer(
	name: "block_quote",
	render: { node, state, _, _, _ in renderTag(node: node, state: &state, tag: "blockquote") }
)

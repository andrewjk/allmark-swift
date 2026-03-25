import Foundation

let blockQuoteRenderer = Renderer(
	name: "block_quote",
	render: { node, state, _ in renderTag(node: node, state: &state, tag: "blockquote") }
)

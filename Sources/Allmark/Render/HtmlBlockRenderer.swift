import Foundation

let htmlBlockRenderer = Renderer(
	name: "html_block",
	render: { node, state, _ in state.output += node.content }
)

import Foundation

let htmlBlockRenderer = Renderer(
	name: "html_block",
	render: { node, state, _, _, _ in state.output += node.content }
)

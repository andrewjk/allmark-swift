import Foundation

let htmlSpanRenderer = Renderer(
	name: "html_span",
	render: { node, state, _ in state.output += node.content }
)

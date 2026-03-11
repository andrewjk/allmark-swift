import Foundation

@MainActor
let htmlSpanRenderer = Renderer(
	name: "html_span",
	render: { node, state, _, _, _ in state.output += node.content }
)

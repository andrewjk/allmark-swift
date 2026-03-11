import Foundation

@MainActor
let commentRenderer = Renderer(
	name: "comment",
	render: renderComment
)

@MainActor
func renderComment(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<span class=\"markdown-comment\">"
	renderChildren(node: node, state: &state)
	state.output += "</span>"
	endNewLine(node: node, state: &state)
}

import Foundation

let commentRenderer = Renderer(
	name: "comment",
	render: renderComment
)

func renderComment(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<span class=\"markdown-comment\">"
	renderChildren(node: node, state: &state)
	state.output += "</span>"
	endNewLine(node: node, state: &state)
}

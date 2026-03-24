import Foundation

let deletionRenderer = Renderer(
	name: "deletion",
	render: renderDeletion
)

func renderDeletion(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<del class=\"markdown-deletion\">"
	renderChildren(node: node, state: &state)
	state.output += "</del>"
	endNewLine(node: node, state: &state)
}

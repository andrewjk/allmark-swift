import Foundation

let paragraphRenderer = Renderer(
	name: "paragraph",
	render: renderParagraph
)

func renderParagraph(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<p>"
	innerNewLine(node: node, state: &state)
	renderChildren(node: node, state: &state)
	state.output += "</p>"
	endNewLine(node: node, state: &state)
}

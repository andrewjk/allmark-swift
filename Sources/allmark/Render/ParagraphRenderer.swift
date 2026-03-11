import Foundation

@MainActor
let paragraphRenderer = Renderer(
	name: "paragraph",
	render: renderParagraph
)

@MainActor
func renderParagraph(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<p>"
	innerNewLine(node: node, state: &state)
	renderChildren(node: node, state: &state)
	state.output += "</p>"
	endNewLine(node: node, state: &state)
}

import Foundation

let insertionRenderer = Renderer(
	name: "insertion",
	render: renderInsertion
)

func renderInsertion(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<ins class=\"markdown-insertion\">"
	renderChildren(node: node, state: &state)
	state.output += "</ins>"
	endNewLine(node: node, state: &state)
}

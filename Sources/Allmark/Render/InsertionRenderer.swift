import Foundation

@MainActor
let insertionRenderer = Renderer(
	name: "insertion",
	render: renderInsertion
)

@MainActor
func renderInsertion(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<ins class=\"markdown-insertion\">"
	renderChildren(node: node, state: &state)
	state.output += "</ins>"
	endNewLine(node: node, state: &state)
}

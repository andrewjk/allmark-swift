import Foundation

func renderSelfClosedTag(node: MarkdownNode, state: inout RendererState, tag: String) {
	startNewLine(node: node, state: &state)
	state.output += "<"
	state.output += tag
	state.output += " />"
	endNewLine(node: node, state: &state)
}

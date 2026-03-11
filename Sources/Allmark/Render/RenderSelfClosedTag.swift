import Foundation

func renderSelfClosedTag(node: MarkdownNode, state: inout RendererState, tag: String) {
	startNewLine(node: node, state: &state)
	state.output += "<\(tag) />"
	endNewLine(node: node, state: &state)
}

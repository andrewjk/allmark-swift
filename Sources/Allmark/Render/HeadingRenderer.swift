import Foundation

@MainActor
let headingRenderer = Renderer(
	name: "heading",
	render: renderHeading
)

@MainActor
func renderHeading(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	var level = 0
	if node.markup.hasPrefix("#") {
		level = node.markup.count
	} else if node.markup.contains("=") {
		level = 1
	} else if node.markup.contains("-") {
		level = 2
	}
	state.output += "<h\(level)>"
	innerNewLine(node: node, state: &state)
	renderChildren(node: node, state: &state)
	state.output += "</h\(level)>"
	endNewLine(node: node, state: &state)
}

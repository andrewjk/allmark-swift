import Foundation

let headingUnderlineRenderer = Renderer(
	name: "heading_underline",
	render: renderHeadingUnderline
)

func renderHeadingUnderline(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	startNewLine(node: node, state: &state)
	var level = 0
	if node.markup.contains("=") {
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

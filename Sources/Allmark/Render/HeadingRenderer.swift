import Foundation

let headingRenderer = Renderer(
	name: "heading",
	render: renderHeading
)

func renderHeading(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
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
	// Render the children of the dummy paragraph directly (not the paragraph itself)
	if let children = node.children, children.count > 0 {
		renderChildren(node: children[0], state: &state)
	}
	state.output += "</h\(level)>"
	endNewLine(node: node, state: &state)
}

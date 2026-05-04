import Foundation

let imageRenderer = Renderer(
	name: "image",
	render: renderImage
)

func renderImage(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	startNewLine(node: node, state: &state)
	let alt = getChildText(node: node)
	var title = ""
	if let nodeTitle = node.title, !nodeTitle.isEmpty {
		title = " title=\"\(node.title!)\""
	}
	state.output += "<img src=\"\(node.info ?? "")\" alt=\"\(alt)\"\(title) />"
	endNewLine(node: node, state: &state)
}

func getChildText(node: MarkdownNode) -> String {
	var text = ""
	for child in node.children {
		if child.type == "text" {
			text += child.content
		} else {
			text += getChildText(node: child)
		}
	}
	return text
}

import Foundation

@MainActor
let linkRenderer = Renderer(
	name: "link",
	render: renderLink
)

@MainActor
func renderLink(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	var title = ""
	if let nodeTitle = node.title, !nodeTitle.isEmpty {
		title = " title=\"\(node.title!)\""
	}
	state.output += "<a href=\"\(escapeHtml(text: node.info ?? ""))\"\(title)>"
	renderChildren(node: node, state: &state)
	state.output += "</a>"
	endNewLine(node: node, state: &state)
}

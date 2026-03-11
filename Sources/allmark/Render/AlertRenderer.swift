import Foundation

@MainActor
let alertRenderer = Renderer(
	name: "alert",
	render: renderAlert
)

@MainActor
func renderAlert(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	let title = String(node.markup.prefix(1)).uppercased() + String(node.markup.dropFirst())
	state.output += "<div class=\"markdown-alert markdown-alert-\(node.markup)\">\n<p class=\"markdown-alert-title\">\(title)</p>"
	renderChildren(node: node, state: &state)
	state.output += "</div>"
	endNewLine(node: node, state: &state)
}

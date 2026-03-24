import Foundation

let consoleHtmlRenderer = Renderer(
	name: "html",
	render: renderConsoleHtml
)

func renderConsoleHtml(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	state.output += node.content
}

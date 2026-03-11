import Foundation

@MainActor
let consoleHtmlRenderer = Renderer(
	name: "html",
	render: renderConsoleHtml
)

func renderConsoleHtml(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	state.output += node.content
}

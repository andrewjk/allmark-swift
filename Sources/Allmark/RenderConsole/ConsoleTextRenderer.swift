import Foundation

let consoleTextRenderer = Renderer(
	name: "text",
	render: renderConsoleText
)

func renderConsoleText(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let text = node.content
	state.output += text
}

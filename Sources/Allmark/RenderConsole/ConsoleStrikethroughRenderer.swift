import Foundation

let consoleStrikethroughRenderer = Renderer(
	name: "strikethrough",
	render: renderConsoleStrikethrough
)

func renderConsoleStrikethrough(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	state.output += "\(ansiDim)\u{001B}[9m"
	renderChildren(node: node, state: &state)
	state.output += "\u{001B}[29m\(ansiReset)"
}

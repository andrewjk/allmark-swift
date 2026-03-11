import Foundation

@MainActor
let consoleStrikethroughRenderer = Renderer(
	name: "strikethrough",
	render: renderConsoleStrikethrough
)

@MainActor
func renderConsoleStrikethrough(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	state.output += "\(ansiDim)\u{001B}[9m"
	renderChildren(node: node, state: &state)
	state.output += "\u{001B}[29m\(ansiReset)"
}

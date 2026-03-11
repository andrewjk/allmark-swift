import Foundation

@MainActor
let consoleHighlightRenderer = Renderer(
	name: "highlight",
	render: renderConsoleHighlight
)

@MainActor
func renderConsoleHighlight(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiYellowBack + ansiBlack
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

import Foundation

let consoleHighlightRenderer = Renderer(
	name: "highlight",
	render: renderConsoleHighlight
)

func renderConsoleHighlight(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	let style = ansiYellowBack + ansiBlack
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

import Foundation

let consoleCodeSpanRenderer = Renderer(
	name: "code_span",
	render: renderConsoleCodeSpan
)

func renderConsoleCodeSpan(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiGreen
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

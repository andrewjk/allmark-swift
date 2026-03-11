import Foundation

@MainActor
let consoleCodeSpanRenderer = Renderer(
	name: "code_span",
	render: renderConsoleCodeSpan
)

@MainActor
func renderConsoleCodeSpan(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiGreen
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

import Foundation

@MainActor
let consoleEmphasisRenderer = Renderer(
	name: "emphasis",
	render: renderConsoleEmphasis
)

@MainActor
func renderConsoleEmphasis(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiItalic + ansiYellow
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

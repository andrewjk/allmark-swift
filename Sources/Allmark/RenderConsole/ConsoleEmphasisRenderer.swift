import Foundation

let consoleEmphasisRenderer = Renderer(
	name: "emphasis",
	render: renderConsoleEmphasis
)

func renderConsoleEmphasis(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	let style = ansiItalic + ansiYellow
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

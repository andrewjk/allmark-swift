import Foundation

let consoleStrongRenderer = Renderer(
	name: "strong",
	render: renderConsoleStrong
)

func renderConsoleStrong(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	let style = ansiBold + ansiYellow
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	state.output += reset
}

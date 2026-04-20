import Foundation

let consoleInsertionRenderer = Renderer(
	name: "insertion",
	render: renderConsoleInsertion
)

func renderConsoleInsertion(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiGreen
	let reset = ansiReset
	state.output += "\(style)++"
	renderChildren(node: node, state: &state)
	state.output += "++\(reset)"
}

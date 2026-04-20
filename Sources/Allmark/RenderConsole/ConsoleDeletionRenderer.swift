import Foundation

let consoleDeletionRenderer = Renderer(
	name: "deletion",
	render: renderConsoleDeletion
)

func renderConsoleDeletion(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiRed
	let reset = ansiReset
	state.output += "\(style)--"
	renderChildren(node: node, state: &state)
	state.output += "--\(reset)"
}

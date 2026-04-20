import Foundation

let consoleParagraphRenderer = Renderer(
	name: "paragraph",
	render: renderConsoleParagraph
)

func renderConsoleParagraph(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	renderChildren(node: node, state: &state)
	state.output += "\n\n"
}

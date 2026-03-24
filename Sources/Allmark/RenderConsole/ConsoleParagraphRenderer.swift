import Foundation

let consoleParagraphRenderer = Renderer(
	name: "paragraph",
	render: renderConsoleParagraph
)

func renderConsoleParagraph(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	if !state.output.isEmpty, !state.output.hasSuffix("\n") {
		state.output += "\n"
	}
	let hasDoubleNewline = state.output.count >= 2 && state.output.suffix(2) == "\n\n"
	if !state.output.isEmpty, !hasDoubleNewline {
		state.output += "\n"
	}
	renderChildren(node: node, state: &state)
	state.output += "\n\n"
}

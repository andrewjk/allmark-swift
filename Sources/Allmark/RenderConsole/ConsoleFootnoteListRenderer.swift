import Foundation

let consoleFootnoteListRenderer = Renderer(
	name: "footnote_list",
	render: renderConsoleFootnoteList
)

func renderConsoleFootnoteList(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	if state.footnotes.isEmpty {
		return
	}
	state.output += "\n\(ansiDim)---\(ansiReset)\n"
	var number = 1
	for node in state.footnotes {
		let label = number
		number += 1
		state.output += "\(ansiDim)[\(label)]\(ansiReset) "
		if let info = node.info, let refNode = state.footnoteRefs[info] {
			renderChildren(node: refNode, state: &state)
		}
		if state.output.hasSuffix("\n") {
			state.output.removeLast()
		}
		if state.output.hasSuffix("\r\n") {
			state.output.removeLast()
		}
		if state.output.hasSuffix("\r") {
			state.output.removeLast()
		}
		state.output += "\n"
	}
}

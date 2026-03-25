import Foundation

let consoleFootnoteRenderer = Renderer(
	name: "footnote",
	render: renderConsoleFootnote
)

func renderConsoleFootnote(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	if state.footnotes.first(where: { $0.info == node.info }) == nil {
		state.footnotes.append(node)
	}
	let label = state.footnotes.count
	state.output += "\(ansiDim)[\(label)]\(ansiReset)"
}

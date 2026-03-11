import Foundation

@MainActor
let footnoteRenderer = Renderer(
	name: "footnote",
	render: renderFootnote
)

func renderFootnote(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	if state.footnotes.first(where: { $0.info == node.info }) == nil {
		state.footnotes.append(node)
	}
	let label = state.footnotes.count
	let id = "fnref\(label)"
	let href = "#fn\(label)"
	state.output += "<sup class=\"footnote-ref\"><a href=\"\(href)\" id=\"\(id)\">\(label)</a></sup>"
}

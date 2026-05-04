import Foundation

let consoleFootnoteRefRenderer = Renderer(
	name: "footnote_ref",
	render: renderConsoleFootnoteRef
)

func renderConsoleFootnoteRef(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	if let info = node.info {
		state.footnoteRefs[info] = node
	}
}

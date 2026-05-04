import Foundation

let footnoteRefRenderer = Renderer(
	name: "footnote_ref",
	render: renderFootnoteRef
)

func renderFootnoteRef(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	if let info = node.info {
		state.footnoteRefs[info] = node
	}
}

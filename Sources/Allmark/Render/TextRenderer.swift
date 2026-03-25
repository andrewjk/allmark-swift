import Foundation

let textRenderer = Renderer(
	name: "text",
	render: renderText
)

func renderText(_ node: MarkdownNode, _ state: inout RendererState, _ decode: Bool?) {
	var content = node.content
	if decode == true {
		content = decodeEntities(text: content)
		content = escapePunctuation(text: content)
	}
	content = escapeHtml(text: content)
	state.output += content
}

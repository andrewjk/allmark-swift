import Foundation

@MainActor
let textRenderer = Renderer(
	name: "text",
	render: renderText
)

func renderText(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	var markup = node.markup
	if first == true {
		while !markup.isEmpty && markup.first?.isWhitespace ?? false {
			markup.removeFirst()
		}
	}
	if last == true {
		while !markup.isEmpty && markup.last?.isWhitespace ?? false {
			markup.removeLast()
		}
	}
	if decode == true {
		markup = decodeEntities(text: markup)
		markup = escapePunctuation(text: markup)
	}
	markup = escapeHtml(text: markup)
	state.output += markup
}

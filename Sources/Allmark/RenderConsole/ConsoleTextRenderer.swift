import Foundation

let consoleTextRenderer = Renderer(
	name: "text",
	render: renderConsoleText
)

func renderConsoleText(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _: Bool?) {
	var text = node.markup
	if first == true {
		text = String(text.drop(while: { $0.isWhitespace }))
	}
	if last == true {
		while !text.isEmpty, text.last?.isWhitespace == true {
			text.removeLast()
		}
	}
	state.output += text
}

import Foundation

let consoleCommentRenderer = Renderer(
	name: "comment",
	render: renderConsoleComment
)

func renderConsoleComment(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	state.output += "<!--\(node.content)-->"
}

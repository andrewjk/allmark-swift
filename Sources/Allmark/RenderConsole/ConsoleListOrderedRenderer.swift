import Foundation

let consoleListOrderedRenderer = Renderer(
	name: "list_ordered",
	render: renderConsoleListOrdered
)

func renderConsoleListOrdered(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	return renderConsoleList(node, &state, ordered: true)
}

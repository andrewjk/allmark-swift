import Foundation

@MainActor
let consoleListOrderedRenderer = Renderer(
	name: "list_ordered",
	render: renderConsoleListOrdered
)

@MainActor
func renderConsoleListOrdered(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	return renderConsoleList(node, &state, ordered: true)
}

import Foundation

@MainActor
let consoleListBulletedRenderer = Renderer(
	name: "list_bulleted",
	render: renderConsoleListBulleted
)

@MainActor
func renderConsoleListBulleted(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	return renderConsoleList(node, &state, ordered: false)
}

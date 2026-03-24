import Foundation

let consoleListBulletedRenderer = Renderer(
	name: "list_bulleted",
	render: renderConsoleListBulleted
)

func renderConsoleListBulleted(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	return renderConsoleList(node, &state, ordered: false)
}

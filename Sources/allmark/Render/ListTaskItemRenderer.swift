import Foundation

@MainActor
let listTaskItemRenderer = Renderer(
	name: "list_task_item",
	render: renderListTaskItem
)

func renderListTaskItem(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let checked = node.markup.count > 1 && node.markup[node.markup.index(node.markup.startIndex, offsetBy: 1)] != " " ? " checked=\"\"" : ""
	state.output += "<input type=\"checkbox\"\(checked) disabled=\"\" /> "
}

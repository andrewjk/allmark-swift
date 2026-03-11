import Foundation

@MainActor
let consoleListTaskItemRenderer = Renderer(
	name: "list_task_item",
	render: renderConsoleListTaskItem
)

@MainActor
func renderConsoleListTaskItem(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let isChecked = node.markup.count > 1 && node.markup[node.markup.index(node.markup.startIndex, offsetBy: 1)] != " "
	let emoji = isChecked ? "[✓]" : "[ ]"
	state.output += "\(emoji) "
}

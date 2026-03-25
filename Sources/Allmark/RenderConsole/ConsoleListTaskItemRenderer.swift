import Foundation

let consoleListTaskItemRenderer = Renderer(
	name: "list_task_item",
	render: renderConsoleListTaskItem
)

func renderConsoleListTaskItem(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let isChecked = node.markup.count > 1 && node.markup[node.markup.index(node.markup.startIndex, offsetBy: 1)] != " "
	let emoji = isChecked ? "[✓]" : "[ ]"
	state.output += "\(emoji) "
}

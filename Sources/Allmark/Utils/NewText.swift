import Foundation

func newText(
	index: Int,
	line: Int,
	content: String,
	indent: Int
) -> MarkdownNode {
	let node = MarkdownNode(
		type: "text",
		block: false,
		index: index,
		line: line,
		markup: "",
		indent: indent,
		children: []
	)
	node.content = content
	return node
}

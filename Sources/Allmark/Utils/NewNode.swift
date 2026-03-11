import Foundation

func newNode(
	type: String,
	block: Bool,
	index: Int,
	line: Int,
	column: Int,
	markup: String,
	indent: Int,
	children: [MarkdownNode]?
) -> MarkdownNode {
	return MarkdownNode(
		type: type,
		block: block,
		index: index,
		line: line,
		column: column,
		markup: markup,
		indent: indent,
		children: children
	)
}

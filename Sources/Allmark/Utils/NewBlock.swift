import Foundation

func newBlock(
	type: String,
	index: Int,
	line: Int,
	markup: String,
	indent: Int
) -> MarkdownNode {
	return MarkdownNode(
		type: type,
		block: true,
		index: index,
		line: line,
		markup: markup,
		indent: indent,
		children: []
	)
}

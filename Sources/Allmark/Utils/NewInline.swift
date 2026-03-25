import Foundation

func newInline(
	type: String,
	index: Int,
	line: Int,
	markup: String,
	indent: Int
) -> MarkdownNode {
	return MarkdownNode(
		type: type,
		block: false,
		index: index,
		line: line,
		markup: markup,
		indent: indent,
		children: nil
	)
}

import Foundation

class MarkdownNode {
	var type: String
	var block: Bool
	var index: Int
	/// The line number
	var line: Int
	/// The column number
	var column: Int
	/// The markdown-specific markup for this node as it has been entered by the user
	var markup: String
	/// The delimiter that has determined this node's type
	var delimiter: String
	/// The text content for this node
	var content: String
	/// The number of (logical, not physical) spaces this node starts after
	var indent: Int
	/// For list item nodes, the number of (logical, not physical) spaces its content starts after
	var subindent: Int
	/// Whether this node is a tight list item
	//var tight: Bool
	// TODO: booleans should be flags! Also, I'm not sure whether all combinations are needed?
	/// Whether this node is followed by a blank line
	var blankAfter: Bool
	/// Whether this node contains plain text content, rather than parsed Markdown
	var acceptsContent: Bool
	/// Whether this node ends with a paragraph that may lazily continue
	var maybeContinuing: Bool
	/// Info for a fenced code block, or the URL for a link
	var info: String?
	/// The title for a link
	var title: String?
	var children: [MarkdownNode]?

	init(
		type: String,
		block: Bool,
		index: Int,
		line: Int,
		column: Int,
		markup: String,
		indent: Int,
		children: [MarkdownNode]?
	) {
		self.type = type
		self.block = block
		self.index = index
		self.line = line
		self.column = column
		self.markup = markup
		self.delimiter = ""
		self.content = ""
		self.indent = indent
		self.subindent = 0
		self.acceptsContent = false
		self.maybeContinuing = false
		self.blankAfter = false
		self.children = children
	}
}

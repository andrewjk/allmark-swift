import Foundation

/// A node in the Markdown AST.
public class MarkdownNode {
	/// The node type (e.g., "paragraph", "heading", "emphasis").
	public var type: String
	/// Whether this is a block-level node.
	public var block: Bool
	/// The index of this node in the parent's children array.
	public var index: Int
	/// The line number where this node starts.
	public var line: Int
	/// The column number where this node starts.
	public var column: Int
	/// The markdown-specific markup for this node as it has been entered by the user.
	public var markup: String
	/// The delimiter that has determined this node's type.
	public var delimiter: String
	/// The text content for this node.
	public var content: String
	/// The number of (logical, not physical) spaces this node starts after.
	public var indent: Int
	/// For list item nodes, the number of (logical, not physical) spaces its content starts after.
	public var subindent: Int
	/// Whether this node is followed by a blank line.
	public var blankAfter: Bool
	/// Whether this node contains plain text content, rather than parsed Markdown.
	public var acceptsContent: Bool
	/// Whether this node ends with a paragraph that may lazily continue.
	public var maybeContinuing: Bool
	/// Info for a fenced code block, or the URL for a link.
	public var info: String?
	/// The title for a link.
	public var title: String?
	/// Child nodes, if any.
	public var children: [MarkdownNode]?

	/// Creates a new MarkdownNode.
	public init(
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

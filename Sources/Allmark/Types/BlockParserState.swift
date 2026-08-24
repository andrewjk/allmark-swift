import Foundation

/// State maintained during block parsing.
public struct BlockParserState {
	/// Block parsing rules.
	public var rules: [BlockRule]
	/// Block parsing rules map for fast lookup by name.
	public var rulesMap: [String: BlockRule]

	/// The source text being parsed (UTF-8 bytes).
	public var src: [UInt8]
	/// Current position in the source.
	public var i: Int
	/// Current line number.
	public var line: Int
	/// Starting position of the current line.
	public var lineStart: Int
	/// Current indentation level.
	public var indent: Int
	/// Spaces string for source mapping.
	public var spaces: String
	/// Stack of currently open nodes.
	public var openNodes: [MarkdownNode]
	/// Whether the current character is escaped.
	public var isEscaped: Bool
	/// Whether the current node may continue lazily.
	public var maybeContinue: Bool
	/// Whether we've encountered a blank line.
	public var hasBlankLine: Bool
	/// Link reference definitions.
	public var refs: [String: LinkReference]
	/// Footnote reference definitions.
	public var footnotes: [String: FootnoteReference]

	public init(rules: [BlockRule], rulesMap: [String: BlockRule], src: [UInt8], i: Int, line: Int, lineStart: Int, indent: Int, spaces: String, openNodes: [MarkdownNode], isEscaped: Bool, maybeContinue: Bool, hasBlankLine: Bool, refs: [String: LinkReference], footnotes: [String: FootnoteReference]) {
		self.rules = rules
		self.rulesMap = rulesMap
		self.src = src
		self.i = i
		self.line = line
		self.lineStart = lineStart
		self.indent = indent
		self.spaces = spaces
		self.openNodes = openNodes
		self.isEscaped = isEscaped
		self.maybeContinue = maybeContinue
		self.hasBlankLine = hasBlankLine
		self.refs = refs
		self.footnotes = footnotes
	}
}

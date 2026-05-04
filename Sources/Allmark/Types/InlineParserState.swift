import Foundation

/// State maintained during inline parsing.
public struct InlineParserState {
	/// Inline parsing rules.
	public var rules: [InlineRule]

	/// The source text being parsed.
	public var src: [UInt8]
	/// Current position in the source.
	public var i: Int
	/// Current line number.
	public var line: Int
	/// Starting position of the current line.
	public var lineStart: Int
	/// Current indentation level.
	public var indent: Int
	/// Whether the current character is escaped.
	public var isEscaped: Bool
	/// Active delimiter characters for emphasis/links.
	public var delimiters: [Delimiter]
	/// Link reference definitions.
	public var refs: [String: LinkReference]
	/// Footnote reference definitions.
	public var footnotes: [String: FootnoteReference]
	/// The starting index of the parent node.
	public var parentIndex: Int

	public init(rules: [InlineRule], src: [UInt8], i: Int, line: Int, lineStart: Int, indent: Int, isEscaped: Bool, delimiters: [Delimiter], refs: [String: LinkReference], footnotes: [String: FootnoteReference], parentIndex: Int) {
		self.rules = rules
		self.src = src
		self.i = i
		self.line = line
		self.lineStart = lineStart
		self.indent = indent
		self.isEscaped = isEscaped
		self.delimiters = delimiters
		self.refs = refs
		self.footnotes = footnotes
		self.parentIndex = parentIndex
	}
}

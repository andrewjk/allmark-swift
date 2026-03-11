import Foundation
import Collections

/// State maintained during block parsing.
public struct BlockParserState {
	/// Block parsing rules.
	public var rules: OrderedDictionary<String, BlockRule>

	/// The source text being parsed.
	public var src: String
	/// Current position in the source.
	public var i: Int
	/// Current line number.
	public var line: Int
	/// Starting position of the current line.
	public var lineStart: Int
	/// Current indentation level.
	public var indent: Int
	/// Stack of currently open nodes.
	public var openNodes: [MarkdownNode]
	/// Whether the current node may continue lazily.
	public var maybeContinue: Bool
	/// Whether we've encountered a blank line.
	public var hasBlankLine: Bool
	/// Link reference definitions.
	public var refs: [String: LinkReference]
	/// Footnote reference definitions.
	public var footnotes: [String: FootnoteReference]
}

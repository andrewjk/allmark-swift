import Foundation
import OrderedCollections

/// State maintained during inline parsing.
public struct InlineParserState {
	/// Inline parsing rules.
	public var rules: OrderedDictionary<String, InlineRule>

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
	/// Active delimiter characters for emphasis/links.
	public var delimiters: [Delimiter]
	/// Link reference definitions.
	public var refs: [String: LinkReference]
	/// Footnote reference definitions.
	public var footnotes: [String: FootnoteReference]

	// HACK:
	public var debug: Bool?
}

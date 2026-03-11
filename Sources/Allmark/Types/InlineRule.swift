import Foundation

/// A rule for parsing inline Markdown elements.
@MainActor
public struct InlineRule {
	/// The name for this rule.
	public var name: String
	/// Tests whether this rule matches at the current position.
	public var test: @MainActor (inout InlineParserState, inout MarkdownNode) -> Bool
}

import Foundation

/// A rule for parsing inline Markdown elements.
public struct InlineRule: Sendable {
	/// The name for this rule.
	public var name: String
	/// Tests whether this rule matches at the current position.
	public var test: @Sendable (inout InlineParserState, inout MarkdownNode) -> Bool
	/// Precedence for delimiter matching (higher = takes precedence).
	public var precedence: Int?

	public init(name: String, test: @escaping @Sendable (inout InlineParserState, inout MarkdownNode) -> Bool, precedence: Int? = nil) {
		self.name = name
		self.test = test
		self.precedence = precedence
	}
}

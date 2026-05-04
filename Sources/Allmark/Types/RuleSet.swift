import Foundation

/// A collection of block and inline parsing rules.
public struct RuleSet: Sendable {
	/// Block parsing rules.
	public var blocks: [BlockRule]
	/// Inline parsing rules.
	public var inlines: [InlineRule]

	public init(blocks: [BlockRule], inlines: [InlineRule]) {
		self.blocks = blocks
		self.inlines = inlines
	}
}

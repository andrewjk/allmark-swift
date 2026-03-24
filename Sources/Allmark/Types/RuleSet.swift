import Foundation
import OrderedCollections

/// A collection of block and inline parsing rules.
public struct RuleSet: Sendable {
	/// Block parsing rules keyed by rule name.
	public var blocks: OrderedDictionary<String, BlockRule>
	/// Inline parsing rules keyed by rule name.
	public var inlines: OrderedDictionary<String, InlineRule>

	public init(blocks: OrderedDictionary<String, BlockRule>, inlines: OrderedDictionary<String, InlineRule>) {
		self.blocks = blocks
		self.inlines = inlines
	}
}

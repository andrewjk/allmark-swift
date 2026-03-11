import Foundation
import Collections

/// A collection of block and inline parsing rules.
public struct RuleSet {
	/// Block parsing rules keyed by rule name.
	public var blocks: OrderedDictionary<String, BlockRule>
	/// Inline parsing rules keyed by rule name.
	public var inlines: OrderedDictionary<String, InlineRule>
}

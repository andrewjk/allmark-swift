import Foundation
import Collections

struct RuleSet {
	var blocks: OrderedDictionary<String, BlockRule>
	var inlines: OrderedDictionary<String, InlineRule>
}

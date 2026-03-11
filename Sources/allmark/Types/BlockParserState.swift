import Foundation
import Collections

struct BlockParserState {
	var rules: OrderedDictionary<String, BlockRule>
	
	var src: String
	var i: Int
	var line: Int
	var lineStart: Int
	var indent: Int
	var openNodes: [MarkdownNode]
	var maybeContinue: Bool
	var hasBlankLine: Bool
	var refs: [String: LinkReference]
	var footnotes: [String: FootnoteReference]
}

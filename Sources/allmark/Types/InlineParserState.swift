import Foundation
import Collections

struct InlineParserState {
	var rules: OrderedDictionary<String, InlineRule>
	
	var src: String
	var i: Int
	var line: Int
	var lineStart: Int
	var indent: Int
	var delimiters: [Delimiter]
	var refs: [String: LinkReference]
	var footnotes: [String: FootnoteReference]
	
	// HACK:
	var debug: Bool?
}

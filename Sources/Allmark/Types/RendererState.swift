import Foundation
import Collections

struct RendererState {
	var renderers: OrderedDictionary<String, Renderer>
	var output: String
	var footnotes: [MarkdownNode]
	var depth: Int
	var quoteDepth: Int
}

import Foundation
import OrderedCollections

/// State maintained during rendering.
public struct RendererState {
	/// The renderers being used.
	public var renderers: OrderedDictionary<String, Renderer>
	/// The accumulated output string.
	public var output: String
	/// Footnote nodes to render at the end.
	public var footnotes: [MarkdownNode]
	/// Current nesting depth.
	public var depth: Int
	/// Current quote nesting depth.
	public var quoteDepth: Int

	public init(renderers: OrderedDictionary<String, Renderer>, output: String, footnotes: [MarkdownNode], depth: Int, quoteDepth: Int) {
		self.renderers = renderers
		self.output = output
		self.footnotes = footnotes
		self.depth = depth
		self.quoteDepth = quoteDepth
	}
}

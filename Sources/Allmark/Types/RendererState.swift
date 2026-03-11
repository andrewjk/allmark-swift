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
}

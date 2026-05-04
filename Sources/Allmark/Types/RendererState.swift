import Foundation

/// State maintained during rendering.
public struct RendererState {
	/// The renderers being used, mapped by name for fast lookup.
	public var renderersMap: [String: Renderer]
	/// The accumulated output string.
	public var output: String
	/// Footnote nodes to render at the end.
	public var footnotes: [MarkdownNode]
	/// Footnote reference definitions, keyed by label.
	public var footnoteRefs: [String: MarkdownNode]
	/// Current list nesting depth.
	public var listDepth: Int

	public init(renderersMap: [String: Renderer], output: String, footnotes: [MarkdownNode], listDepth: Int = 0) {
		self.renderersMap = renderersMap
		self.output = output
		self.footnotes = footnotes
		footnoteRefs = [:]
		self.listDepth = listDepth
	}
}

import Foundation

/// A renderer that converts an AST node to output.
public struct Renderer: Sendable {
	/// The renderer name (matches the node type it renders).
	public var name: String
	/// The render function.
	public var render: @Sendable (MarkdownNode, inout RendererState, Bool?, Bool?, Bool?) -> Void

	public init(name: String, render: @escaping @Sendable (MarkdownNode, inout RendererState, Bool?, Bool?, Bool?) -> Void) {
		self.name = name
		self.render = render
	}
}

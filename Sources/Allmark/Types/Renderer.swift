import Foundation

/// A renderer that converts an AST node to output.
@MainActor
public struct Renderer {
	/// The renderer name (matches the node type it renders).
	public var name: String
	/// The render function.
	public var render: @MainActor (MarkdownNode, inout RendererState, Bool?, Bool?, Bool?) -> Void
}

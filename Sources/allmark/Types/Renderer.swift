import Foundation

@MainActor
struct Renderer {
	var name: String
	var render: @MainActor (MarkdownNode, inout RendererState, Bool?, Bool?, Bool?) -> Void
}

import Foundation

@MainActor
let consoleHardBreakRenderer = Renderer(
	name: "hard_break",
	render: renderConsoleHardBreak
)

func renderConsoleHardBreak(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	state.output += "\n"
}

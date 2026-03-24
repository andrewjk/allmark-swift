import Foundation

let consoleHardBreakRenderer = Renderer(
	name: "hard_break",
	render: renderConsoleHardBreak
)

func renderConsoleHardBreak(_: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	state.output += "\n"
}

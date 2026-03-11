import Foundation

@MainActor
let consoleThematicBreakRenderer = Renderer(
	name: "thematic_break",
	render: renderConsoleThematicBreak
)

@MainActor
func renderConsoleThematicBreak(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiDim
	let reset = ansiReset
	if !state.output.isEmpty && !state.output.hasSuffix("\n") {
		state.output += "\n"
	}
	let count = max(3, node.markup.count)
	state.output += "\(style)\(String(repeating: "─", count: count))\(reset)\n"
}

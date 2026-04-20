import Foundation

let consoleThematicBreakRenderer = Renderer(
	name: "thematic_break",
	render: renderConsoleThematicBreak
)

func renderConsoleThematicBreak(_: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiDim
	let reset = ansiReset
	state.output += "\(style)───\(reset)\n\n"
}

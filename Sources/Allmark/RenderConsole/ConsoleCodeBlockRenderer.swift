import Foundation

let consoleCodeBlockRenderer = Renderer(
	name: "code_block",
	render: renderConsoleCodeBlock
)

func renderConsoleCodeBlock(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiDim
	let reset = ansiReset
	state.output += "\(style)┌─\(reset)\n"
	let lines = node.content.split(separator: "\n", omittingEmptySubsequences: false)
	if !lines.isEmpty, let lastLine = lines.last, lastLine.isEmpty {
		for line in lines.dropLast() {
			state.output += "\(style)│\(reset) \(line)\n"
		}
	} else {
		for line in lines {
			state.output += "\(style)│\(reset) \(line)\n"
		}
	}
	state.output += "\(style)└─\(reset)\n\n"
}

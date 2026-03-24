import Foundation

let consoleCodeBlockRenderer = Renderer(
	name: "code_block",
	render: renderConsoleCodeBlock
)

func renderConsoleCodeBlock(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	let style = ansiDim
	let reset = ansiReset
	if !state.output.isEmpty, !state.output.hasSuffix("\n") {
		state.output += "\n"
	}
	state.output += "\(style)┌─\(reset)\n"
	for line in node.content.split(separator: "\n", omittingEmptySubsequences: false) {
		state.output += "\(style)│\(reset) \(line)\n"
	}
	state.output += "\(style)└─\(reset)\n"
}

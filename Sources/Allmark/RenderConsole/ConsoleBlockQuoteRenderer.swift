import Foundation

@MainActor
let consoleBlockQuoteRenderer = Renderer(
	name: "block_quote",
	render: renderConsoleBlockQuote
)

@MainActor
func renderConsoleBlockQuote(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiDim
	let reset = ansiReset
	state.quoteDepth += 1
	if !state.output.isEmpty && !state.output.hasSuffix("\n") {
		state.output += "\n"
	}
	for line in node.content.split(separator: "\n", omittingEmptySubsequences: false) {
		if !line.isEmpty {
			state.output += "\(style)┃\(reset) \(line)\n"
		}
	}
	if let children = node.children {
		for child in children {
			let lines = renderNodeToStringConsole(node: child, state: &state)
			for line in lines.split(separator: "\n", omittingEmptySubsequences: false) {
				if !line.isEmpty {
					state.output += "\(style)┃\(reset) \(line)\n"
				}
			}
		}
	}
	state.quoteDepth -= 1
}

@MainActor
func renderNodeToStringConsole(node: MarkdownNode, state: inout RendererState) -> String {
	let output = state.output
	state.output = ""
	if let renderer = state.renderers[node.type] {
		renderer.render(node, &state, false, false, true)
	}
	let result = state.output
	state.output = output
	return result
}

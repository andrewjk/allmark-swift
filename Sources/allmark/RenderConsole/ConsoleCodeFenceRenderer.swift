import Foundation

@MainActor
let consoleCodeFenceRenderer = Renderer(
	name: "code_fence",
	render: renderConsoleCodeFence
)

@MainActor
func renderConsoleCodeFence(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let content = node.content
	let lines = content.split(separator: "\n", omittingEmptySubsequences: false)

	if lines.isEmpty {
		state.output += "\u{001B}[2m┌─\u{001B}[0m\n\u{001B}[2m└─\u{001B}[0m"
	} else {
		state.output += "\u{001B}[2m┌─\u{001B}[0m\n"
		for (index, line) in lines.enumerated() {
			if index == lines.count - 1 && line.isEmpty {
				continue
			}
			state.output += "\u{001B}[2m│\u{001B}[0m \(line)\n"
		}
		state.output += "\u{001B}[2m└─\u{001B}[0m"
	}
}

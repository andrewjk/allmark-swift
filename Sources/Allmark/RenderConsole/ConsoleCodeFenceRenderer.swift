import Foundation

let consoleCodeFenceRenderer = Renderer(
	name: "code_fence",
	render: renderConsoleCodeFence
)

func renderConsoleCodeFence(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let content = node.content
	let lines = content.split(separator: "\n", omittingEmptySubsequences: false)

	state.output += "\u{001B}[2m┌─\u{001B}[0m\n"
	for (index, line) in lines.enumerated() {
		if index == lines.count - 1, line.isEmpty {
			continue
		}
		state.output += "\u{001B}[2m│\u{001B}[0m \(line)\n"
	}
	state.output += "\u{001B}[2m└─\u{001B}[0m\n\n"
}

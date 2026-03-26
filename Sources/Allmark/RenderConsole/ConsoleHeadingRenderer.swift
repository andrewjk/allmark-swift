import Foundation

let consoleHeadingRenderer = Renderer(
	name: "heading",
	render: renderConsoleHeading
)

func renderConsoleHeading(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let level = node.markup.count

	let style = ansiBold + ansiMagenta
	if !state.output.isEmpty, !state.output.hasSuffix("\n") {
		state.output += "\n"
	}

	state.output += "\(ansiDim)\(String(repeating: "#", count: level))\(ansiReset) \(style)"
	// Render the children of the dummy paragraph directly (not the paragraph itself)
	if let children = node.children, children.count > 0 {
		renderChildren(node: children[0], state: &state)
	}
	state.output += "\(ansiReset)\n"
}

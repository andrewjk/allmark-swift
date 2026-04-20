import Foundation

let consoleHeadingRenderer = Renderer(
	name: "heading",
	render: renderConsoleHeading
)

func renderConsoleHeading(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let level = node.markup.count
	let style = ansiBold + ansiMagenta
	state.output += "\(ansiDim)\(String(repeating: "#", count: level))\(ansiReset) \(style)"
	if let children = node.children, children.count > 0 {
		renderChildren(node: children[0], state: &state)
	}
	state.output += "\(ansiReset)\n\n"
}

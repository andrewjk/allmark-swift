import Foundation

let consoleLinkRenderer = Renderer(
	name: "link",
	render: renderConsoleLink
)

func renderConsoleLink(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	let style = ansiBlue + ansiUnderline
	let reset = ansiReset
	state.output += style
	renderChildren(node: node, state: &state)
	if let info = node.info {
		state.output += "\(reset) \(ansiDim)(\(info))\(ansiReset)"
	} else {
		state.output += reset
	}
}

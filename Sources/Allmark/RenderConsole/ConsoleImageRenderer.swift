import Foundation

let consoleImageRenderer = Renderer(
	name: "image",
	render: renderConsoleImage
)

func renderConsoleImage(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiGray
	let reset = ansiReset
	var alt = ""
	if let children = node.children {
		for child in children {
			if child.type == "text" {
				alt += child.content
			}
		}
	}
	state.output += "\(style)[Image: \(alt.isEmpty ? (node.info ?? "") : alt)]\(reset)"
}

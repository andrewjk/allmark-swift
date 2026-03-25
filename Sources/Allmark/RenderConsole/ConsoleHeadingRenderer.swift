import Foundation

let consoleHeadingRenderer = Renderer(
	name: "heading",
	render: renderConsoleHeading
)

func renderConsoleHeading(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	var level = 0
	var isUnderline = false
	if node.markup.hasPrefix("#") {
		level = node.markup.count
	} else if node.markup.contains("=") {
		level = 1
		isUnderline = true
	} else if node.markup.contains("-") {
		level = 2
		isUnderline = true
	}

	let style = ansiBold + ansiMagenta
	if !state.output.isEmpty, !state.output.hasSuffix("\n") {
		state.output += "\n"
	}

	if isUnderline {
		state.output += "\(style)"

		var headingText = ""
		for child in node.children ?? [] {
			if child.type == "text" {
				headingText += child.content
			} else {
				var childState = RendererState(
					renderers: state.renderers,
					output: "",
					footnotes: state.footnotes,
					depth: state.depth,
					quoteDepth: state.quoteDepth
				)
				renderChildren(node: child, state: &childState)
				headingText += childState.output
			}
		}

		let plainText = headingText.replacingOccurrences(of: "\u{001B}[0m", with: "")
			.replacingOccurrences(of: "\u{001B}[1m", with: "")
			.replacingOccurrences(of: "\u{001B}[2m", with: "")
			.replacingOccurrences(of: "\u{001B}[3m", with: "")
			.replacingOccurrences(of: "\u{001B}[4m", with: "")
			.replacingOccurrences(of: "\u{001B}[30m", with: "")
			.replacingOccurrences(of: "\u{001B}[31m", with: "")
			.replacingOccurrences(of: "\u{001B}[32m", with: "")
			.replacingOccurrences(of: "\u{001B}[33m", with: "")
			.replacingOccurrences(of: "\u{001B}[34m", with: "")
			.replacingOccurrences(of: "\u{001B}[35m", with: "")
			.replacingOccurrences(of: "\u{001B}[36m", with: "")
			.replacingOccurrences(of: "\u{001B}[38;5;208m", with: "")
			.replacingOccurrences(of: "\u{001B}[43m", with: "")
			.replacingOccurrences(of: "\u{001B}[9m", with: "")
			.replacingOccurrences(of: "\u{001B}[29m", with: "")

		state.output += headingText
		let underline = level == 1 ? String(repeating: "=", count: plainText.count) : String(repeating: "-", count: plainText.count)
		state.output += "\n\(ansiReset)\(ansiDim)\(underline)\(ansiReset)\n"
	} else {
		state.output += "\(ansiDim)\(String(repeating: "#", count: level))\(ansiReset) \(style)"
		renderChildren(node: node, state: &state)
		state.output += "\(ansiReset)\n"
	}
}

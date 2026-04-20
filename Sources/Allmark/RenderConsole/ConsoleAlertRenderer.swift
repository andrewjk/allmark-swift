import Foundation

let consoleAlertRenderer = Renderer(
	name: "alert",
	render: renderConsoleAlert
)

func renderConsoleAlert(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let reset = ansiReset
	let type = node.markup.lowercased()
	let styles: [String: String] = [
		"note": ansiBlue,
		"tip": ansiGreen,
		"important": ansiMagenta,
		"warning": ansiYellow,
		"caution": ansiRed,
	]
	let style = styles[type] ?? ansiBlue
	let icons: [String: String] = [
		"note": "📝",
		"tip": "💡",
		"important": "❗",
		"warning": "⚠️",
		"caution": "🚨",
	]
	let icon = icons[type] ?? "📝"
	state.output += "\(style)\(icon) \(type.capitalized):\(reset)\n\n"
	renderChildren(node: node, state: &state)
}

import Foundation

@MainActor
let consoleAlertRenderer = Renderer(
	name: "alert",
	render: renderConsoleAlert
)

@MainActor
func renderConsoleAlert(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
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
	if !state.output.isEmpty && !state.output.hasSuffix("\n") {
		state.output += "\n"
	}
	state.output += "\(style)\(icon) \(type.capitalized):\(reset)\n"
	renderChildren(node: node, state: &state)
}

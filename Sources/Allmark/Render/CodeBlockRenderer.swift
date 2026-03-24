import Foundation

let codeBlockRenderer = Renderer(
	name: "code_block",
	render: renderCodeBlock
)

func renderCodeBlock(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
	if node.type == "code_block", node.content.isEmpty {
		return
	}

	startNewLine(node: node, state: &state)
	var lang = ""
	if let info = node.info {
		let langParts = info.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ", maxSplits: 1)
		if !langParts.isEmpty, !langParts[0].isEmpty {
			lang = " class=\"language-\(escapeHtml(text: String(langParts[0])))\""
		}
	}
	state.output += "<pre><code\(lang)>"
	renderChildren(node: node, state: &state, decode: false)
	state.output += "</code></pre>"
	endNewLine(node: node, state: &state)
}

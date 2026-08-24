import Foundation

let textRenderer = Renderer(
	name: "text",
	render: renderText
)

func renderText(_ node: MarkdownNode, _ state: inout RendererState, _ decode: Bool?) {
	let content = node.content
	let scanDecode = decode == true

	// Fast path: if none of the special characters are present, output as-is
	let needsProcessing = content.utf8.contains { byte in
		byte == AMPERSAND_CODE || byte == ANGLE_LEFT_CODE || byte == ANGLE_RIGHT_CODE || byte == QUOTE_DOUBLE_CODE
			|| (scanDecode && byte == BACKSLASH_CODE)
	}
	if !needsProcessing {
		state.output += content
		return
	}

	var processed = content
	if scanDecode {
		processed = decodeEntities(text: processed)
		processed = escapePunctuation(text: processed)
	}
	processed = escapeHtml(text: processed)
	state.output += processed
}

import Foundation

func _render(doc: MarkdownNode, renderers: [Renderer] = htmlRenderers, options: RenderOptions? = nil) -> String {
	let renderersMap = Dictionary(uniqueKeysWithValues: renderers.map { ($0.name, $0) })

	var state = RendererState(
		renderersMap: renderersMap,
		output: "",
		footnotes: [],
		listDepth: 0,
		lineWidth: options?.lineWidth
	)

	// Reserve output capacity up-front to avoid repeated reallocations
	var estimate = 0
	func measure(_ node: MarkdownNode) {
		if node.type == "text" {
			estimate += node.content.utf8.count
		}
		for child in node.children {
			measure(child)
		}
	}
	measure(doc)
	state.output.reserveCapacity(estimate + estimate / 2 + 1024)

	renderChildren(node: doc, state: &state)

	if !state.footnotes.isEmpty && renderersMap["footnote_list"] != nil {
		let footnoteListRenderer = renderersMap["footnote_list"]
		footnoteListRenderer?.render(doc, &state, false)
	}

	if !state.output.isEmpty {
		state.output = state.output.trimmingCharacters(in: .newlines)
		state.output += "\n"
	}

	return state.output
}

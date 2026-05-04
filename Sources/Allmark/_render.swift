import Foundation

func _render(doc: MarkdownNode, renderers: [Renderer] = htmlRenderers) -> String {
	let renderersMap = Dictionary(uniqueKeysWithValues: renderers.map { ($0.name, $0) })

	var state = RendererState(
		renderersMap: renderersMap,
		output: "",
		footnotes: [],
		listDepth: 0
	)

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

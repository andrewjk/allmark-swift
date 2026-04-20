import Foundation
import OrderedCollections

func _render(doc: MarkdownNode, renderers: OrderedDictionary<String, Renderer> = htmlRenderers) -> String {
	var state = RendererState(
		renderers: renderers,
		output: "",
		footnotes: [],
		listDepth: 0
	)

	renderChildren(node: doc, state: &state)

	if !state.footnotes.isEmpty && renderers["footnote_list"] != nil {
		let footnoteListRenderer = renderers["footnote_list"]
		footnoteListRenderer?.render(doc, &state, false)
	}

	if !state.output.isEmpty {
		state.output = state.output.trimmingCharacters(in: .newlines)
		state.output += "\n"
	}

	return state.output
}

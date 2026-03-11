import Foundation
import Collections

@MainActor
func render(doc: MarkdownNode, renderers: OrderedDictionary<String, Renderer> = htmlRenderers) -> String {
	var state = RendererState(
		renderers: renderers,
		output: "",
		footnotes: [],
		depth: 0,
		quoteDepth: 0
	)

	renderChildren(node: doc, state: &state)

	if !state.footnotes.isEmpty && renderers["footnote_list"] != nil {
		let footnoteListRenderer = renderers["footnote_list"]
		footnoteListRenderer?.render(doc, &state, false, false, false)
	}

	if !state.output.isEmpty {
        state.output = state.output.trimmingCharacters(in: .newlines)
        state.output += "\n"
	}

	return state.output
}

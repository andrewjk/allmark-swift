import Foundation

func addMarkupAsText(
	markup: String,
	state: inout InlineParserState,
	parent: inout MarkdownNode
) {
	let lastNode = parent.children?.last
	let haveText = lastNode?.type == "text"
	let text = haveText ? lastNode! : MarkdownNode(
		type: "text",
		block: false,
		index: state.i,
		line: state.line,
		column: 1,
		markup: "",
		indent: 0,
		children: nil
	)
	text.markup += markup
	if !haveText {
		parent.children?.append(text)
	}
	state.i += markup.count
}

import Foundation

func addMarkupAsText(
	markup: String,
	state: inout InlineParserState,
	parent: inout MarkdownNode
) {
	let lastNode = parent.children?.last
	let haveText = lastNode?.type == "text"
	let text = haveText ? lastNode! : newText(
		index: state.i,
		line: state.line,
		content: "",
		indent: 0
	)
	text.content += markup
	if !haveText {
		parent.children?.append(text)
	}
	state.i += markup.count
}

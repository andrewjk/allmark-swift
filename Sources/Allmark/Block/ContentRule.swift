import Foundation

/// Raw content capture for blocks that accept content

let contentRule = BlockRule(
	name: "content",
	testStart: testContentStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testContentStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine: Int) -> Bool {
	let src = state.src

	let content = charToString(src, from: state.i, to: endOfLine) + getLineEnding(state: state, endOfLine: endOfLine)

	if parent.acceptsContent {
		if state.hasBlankLine {
			state.hasBlankLine = false
		} else {
			parent.content += String(repeating: " ", count: state.indent)
		}
	} else {
		parent.content += state.spaces
		state.spaces = ""
	}
	parent.content += content

	return true
}

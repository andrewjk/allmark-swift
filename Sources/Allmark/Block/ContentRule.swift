import Foundation

/// Raw content capture for blocks that accept content

let contentRule = BlockRule(
	name: "content",
	testStart: testContentStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testContentStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let endOfLine = getEndOfLine(state: &state)
	let src = state.src

	let content = charToString(src, from: state.i, to: endOfLine)

	if parent.acceptsContent {
		if !state.hasBlankLine {
			parent.content += String(repeating: " ", count: state.indent)
		}
		parent.content += content
		state.hasBlankLine = false
	} else {
		parent.content += content
	}

	state.i = endOfLine
	return true
}

import Foundation

/// Raw content capture for blocks that accept content
@MainActor
let contentRule = BlockRule(
	name: "content",
	testStart: testContentStart,
	testContinue: testContentContinue,
	closeNode: { _, _ in }
)

func testContentStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let endOfLine = getEndOfLine(state: &state)
	let src = state.src
	
	let startIndex = src.index(src.startIndex, offsetBy: state.i)
	let endIndex = src.index(src.startIndex, offsetBy: endOfLine)
	let content = String(src[startIndex..<endIndex])
	
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

func testContentContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

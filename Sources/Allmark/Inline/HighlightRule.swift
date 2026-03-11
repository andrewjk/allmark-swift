import Foundation

@MainActor
let highlightRule = InlineRule(
	name: "highlight",
	test: testHighlight
)

func testHighlight(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == "=" && !isEscaped(text: src, i: state.i) {
		return testTagMarks(name: "highlight", char: "=", state: &state, parent: &parent)
	}
	
	return false
}

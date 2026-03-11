import Foundation

@MainActor
let strikethroughRule = InlineRule(
	name: "strikethrough",
	test: testStrikethrough
)

/**
 * "Strikethrough text is any text wrapped in a matching pair of one or two
 * tildes (~).
 */
func testStrikethrough(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == "~" && !isEscaped(text: src, i: state.i) {
		return testTagMarks(name: "strikethrough", char: "~", state: &state, parent: &parent)
	}
	
	return false
}

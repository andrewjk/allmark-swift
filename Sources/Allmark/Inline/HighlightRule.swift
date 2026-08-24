import Foundation

let highlightRule = InlineRule(
	name: "highlight",
	test: testHighlight,
	precedence: 5
)

func testHighlight(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	let char = src[state.i]

	if !state.isEscaped && char == EQUALS_CODE {
		return testTagMarks(name: "highlight", char: char, state: &state, parent: &parent, precedence: highlightRule.precedence!)
	}

	return false
}

import Foundation

let strikethroughRule = InlineRule(
	name: "strikethrough",
	test: testStrikethrough,
	precedence: 5
)

/**
 * "Strikethrough text is any text wrapped in a matching pair of one or two
 * tildes (~).
 */
func testStrikethrough(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	let char = src[state.i]

	if !state.isEscaped && char == TILDE_CODE {
		return testTagMarks(name: "strikethrough", char: char, state: &state, parent: &parent, precedence: strikethroughRule.precedence!)
	}

	return false
}

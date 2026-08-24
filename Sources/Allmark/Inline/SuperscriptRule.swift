import Foundation

let superscriptRule = InlineRule(
	name: "superscript",
	test: testSuperscript,
	precedence: 5
)

func testSuperscript(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	let char = src[state.i]

	if !state.isEscaped && char == CARET_CODE {
		return testTagMarks(name: "superscript", char: char, state: &state, parent: &parent, precedence: superscriptRule.precedence!)
	}

	return false
}

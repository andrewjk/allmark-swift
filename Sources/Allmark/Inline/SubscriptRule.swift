import Foundation

let subscriptRule = InlineRule(
	name: "subscript",
	test: testSubscript,
	precedence: 5
)

func testSubscript(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	let char = src[state.i]

	if !state.isEscaped && char == 0x7E /* ~ */ {
		// Subscripts can only be one character long, otherwise they are a GFM strikethrough
		if state.i + 1 < src.count {
			if src[state.i + 1] == 0x7E /* ~ */ {
				return false
			}
		}
		return testTagMarks(name: "subscript", char: char, state: &state, parent: &parent, precedence: subscriptRule.precedence!)
	}

	return false
}

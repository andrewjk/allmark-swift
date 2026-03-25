import Foundation

let insertionRule = InlineRule(
	name: "insertion",
	test: testInsertion,
	precedence: 20
)

func testInsertion(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "insertion", delimiter: "+", state: &state, parent: &parent, precedence: insertionRule.precedence!)
}

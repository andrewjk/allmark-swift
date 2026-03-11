import Foundation

@MainActor
let insertionRule = InlineRule(
	name: "insertion",
	test: testInsertion
)

func testInsertion(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "insertion", delimiter: "+", state: &state, parent: &parent)
}

import Foundation

@MainActor
let deletionRule = InlineRule(
	name: "deletion",
	test: testDeletion
)

func testDeletion(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "deletion", delimiter: "-", state: &state, parent: &parent)
}

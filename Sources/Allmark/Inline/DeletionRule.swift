import Foundation

let deletionRule = InlineRule(
	name: "deletion",
	test: testDeletion,
	precedence: 20
)

func testDeletion(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "deletion", delimiter: "-", state: &state, parent: &parent, precedence: deletionRule.precedence!)
}

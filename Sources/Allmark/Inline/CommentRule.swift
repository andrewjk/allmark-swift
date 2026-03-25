import Foundation

let commentRule = InlineRule(
	name: "comment",
	test: testComment,
	precedence: 20
)

func testComment(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "comment", delimiter: ">", state: &state, parent: &parent, precedence: commentRule.precedence!, closingDelimiter: "<")
}

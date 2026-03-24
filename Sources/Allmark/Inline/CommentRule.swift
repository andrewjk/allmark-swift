import Foundation

let commentRule = InlineRule(
	name: "comment",
	test: testComment
)

func testComment(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	return testCriticMarks(name: "comment", delimiter: ">", state: &state, parent: &parent, closingDelimiter: "<")
}

import Foundation

@MainActor
struct InlineRule {
	var name: String
	var test: @MainActor (inout InlineParserState, inout MarkdownNode) -> Bool
}

import Foundation

@MainActor
let subscriptRule = InlineRule(
	name: "subscript",
	test: testSubscript
)

func testSubscript(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == "~" && !isEscaped(text: src, i: state.i) {
		// Subscripts can only be one character long, otherwise they are a GFM strikethrough
		if state.i + 1 < src.count {
			let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
			if src[nextIndex] == "~" {
				return false
			}
		}
		return testTagMarks(name: "subscript", char: "~", state: &state, parent: &parent)
	}
	
	return false
}

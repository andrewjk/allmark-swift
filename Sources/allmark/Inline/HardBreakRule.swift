import Foundation

@MainActor
let hardBreakRule = InlineRule(
	name: "hard_break",
	test: testHardBreak
)

func testHardBreak(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	
	if src[index] == "\\" && state.i + 1 < src.count {
		let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
		if isNewLine(char: String(src[nextIndex])) {
			let hb = MarkdownNode(
				type: "hard_break",
				block: false,
				index: state.i,
				line: state.line,
				column: 1,
				markup: "\\",
				indent: 0,
				children: nil
			)
			state.i += 2
			parent.children?.append(hb)
			return true
		}
	}
	
	return false
}

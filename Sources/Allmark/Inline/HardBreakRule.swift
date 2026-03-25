import Foundation

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
			let hb = newInline(
				type: "hard_break",
				index: state.parentIndex + state.i,
				line: state.line,
				markup: "\\",
				indent: 0
			)
			hb.length = 2
			state.i += 2
			parent.children?.append(hb)
			return true
		}
	} else if src[index] == " " {
		var end = state.i
		for i in (state.i + 1) ..< src.count {
			let iIndex = src.index(src.startIndex, offsetBy: i)
			if isNewLine(char: String(src[iIndex])) {
				end = i
				break
			} else if src[iIndex] == " " {
				continue
			} else {
				return false
			}
		}

		if end - state.i >= 2 {
			let hb = newInline(
				type: "hard_break",
				index: state.parentIndex + state.i,
				line: state.line,
				markup: "\\",
				indent: 0
			)
			hb.length = end - state.i
			state.i = end + 1
			parent.children?.append(hb)
			return true
		}
	}

	return false
}

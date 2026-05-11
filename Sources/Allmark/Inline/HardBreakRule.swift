import Foundation

let hardBreakRule = InlineRule(
	name: "hard_break",
	test: testHardBreak
)

func testHardBreak(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	if src[state.i] == "\\" && state.i + 1 < src.count {
		if isNewLine(char: src[state.i + 1]) {
			let hb = newInline(
				type: "hard_break",
				index: state.parentIndex + state.i,
				line: state.line,
				markup: "\\",
				indent: 0
			)
			hb.length = 2
			parent.children.append(hb)
			state.i += 2
			return true
		}
	} else if src[state.i] == " " {
		var spaces = 1
		var end = src.count
		for i in (state.i + 1) ..< src.count {
			let nextChar = src[i]
			if isNewLine(char: nextChar) {
				end = i
				break
			} else if nextChar == " " {
				spaces += 1
			} else {
				return false
			}
		}

		if spaces >= 2 {
			let hb = newInline(
				type: "hard_break",
				index: state.parentIndex + state.i,
				line: state.line,
				markup: "  ",
				indent: 0
			)
			hb.length = spaces
			parent.children.append(hb)
			state.i = end + 1
			return true
		}
	}

	return false
}

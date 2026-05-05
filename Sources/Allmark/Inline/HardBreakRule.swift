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
			state.i += 2
			parent.children.append(hb)
			return true
		}
	} else if src[state.i] == " " {
		var end = state.i
		for i in (state.i + 1) ..< src.count {
			if isNewLine(char: src[i]) {
				end = i
				break
			} else if src[i] == " " {
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
			parent.children.append(hb)
			return true
		}
	}

	return false
}

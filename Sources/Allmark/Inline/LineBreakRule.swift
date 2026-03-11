import Foundation

@MainActor
let lineBreakRule = InlineRule(
	name: "line_break",
	test: testLineBreak
)

/**
 * "A line break (not in a code span or HTML tag) that is preceded by two or
 * more spaces and does not occur at the end of a block is parsed as a hard line
 * break (rendered in HTML as a <br /> tag)"
 */
func testLineBreak(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == " " {
		var end = state.i
		for i in (state.i + 1)..<src.count {
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
			let html = MarkdownNode(
				type: "html_span",
				block: false,
				index: state.i,
				line: state.line,
				column: 1,
				markup: "",
				indent: state.indent,
				children: nil
			)
			html.content = "<br />\n"
			parent.children?.append(html)
			state.i = end + 1
			return true
		}
	}
	
	return false
}

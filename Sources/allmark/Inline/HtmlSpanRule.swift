import Foundation

@MainActor
let htmlSpanRule = InlineRule(
	name: "html_span",
	test: testHtmlSpan
)

// An HTML tag consists of an open tag, a closing tag, an HTML comment, a
// processing instruction, a declaration, or a CDATA section.
let htmlTagRegex = try! NSRegularExpression(
	pattern: "^(?:\(openTag)|\(closeTag)|\(comment)|\(instruction)|\(declaration)|\(cdata))",
	options: []
)

func testHtmlSpan(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	// Don't try to extract HTML for HTML blocks
	if parent.type == "html_block" {
		return false
	}
	
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if char == "<" && !isEscaped(text: src, i: state.i) {
		let tail = String(src[index...])
		let range = NSRange(location: 0, length: tail.utf16.count)
		
		if let match = htmlTagRegex.firstMatch(in: tail, options: [], range: range) {
			let matchRange = match.range(at: 0)
			if let swiftRange = Range(matchRange, in: tail) {
				let content = String(tail[swiftRange])
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
				html.content = content
				parent.children?.append(html)
				state.i += content.count
				return true
			}
		}
	}
	
	return false
}

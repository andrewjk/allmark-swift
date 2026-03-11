import Foundation

@MainActor
let autolinkRule = InlineRule(
	name: "autolink",
	test: testAutolink
)

// An HTML tag consists of an open tag, a closing tag, an HTML comment, a
// processing instruction, a declaration, or a CDATA section.
let spaceRegex = try! NSRegularExpression(pattern: "\\s")
let linkRegex = try! NSRegularExpression(pattern: "^<(\\s*[a-z][a-z0-9+.-]{1,31}:[^<>]*)>", options: .caseInsensitive)
let emailRegex = try! NSRegularExpression(
	pattern: "^<(\\s*[a-z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?(?:\\.[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?)*\\s*)>",
	options: .caseInsensitive
)

func testAutolink(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
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
		
		// Try link match
		let linkRange = NSRange(location: 0, length: tail.utf16.count)
		if let linkMatch = linkRegex.firstMatch(in: tail, options: [], range: linkRange) {
			let matchRange = linkMatch.range(at: 1)
			if let range = Range(matchRange, in: tail) {
				let url = escapeHtml(text: String(tail[range]))
				
				// Check if URL contains spaces
				let spaceRange = NSRange(location: 0, length: url.utf16.count)
				if spaceRegex.firstMatch(in: url, options: [], range: spaceRange) != nil {
					let fullMatchRange = linkMatch.range(at: 0)
					if let fullRange = Range(fullMatchRange, in: tail) {
						let markup = escapeHtml(text: String(tail[fullRange]))
						let text = MarkdownNode(
							type: "text",
							block: false,
							index: state.i,
							line: state.line,
							column: 1,
							markup: "",
							indent: state.indent,
							children: nil
						)
						text.markup = markup
						parent.children?.append(text)
						state.i += tail[fullRange].count
						return true
					}
				}
				
				let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url
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
				html.content = "<a href=\"\(encodedUrl)\">\(url)</a>"
				parent.children?.append(html)
				
				let fullMatchRange = linkMatch.range(at: 0)
				if let fullRange = Range(fullMatchRange, in: tail) {
					state.i += tail[fullRange].count
				}
				return true
			}
		}
		
		// Try email match
		let emailMatchRange = NSRange(location: 0, length: tail.utf16.count)
		if let emailMatch = emailRegex.firstMatch(in: tail, options: [], range: emailMatchRange) {
			let matchRange = emailMatch.range(at: 1)
			if let range = Range(matchRange, in: tail) {
				let url = escapeHtml(text: String(tail[range]))
				
				// Check if URL contains spaces
				let spaceRange = NSRange(location: 0, length: url.utf16.count)
				if spaceRegex.firstMatch(in: url, options: [], range: spaceRange) != nil {
					let fullMatchRange = emailMatch.range(at: 0)
					if let fullRange = Range(fullMatchRange, in: tail) {
						let markup = escapeHtml(text: String(tail[fullRange]))
						let text = MarkdownNode(
							type: "text",
							block: false,
							index: state.i,
							line: state.line,
							column: 1,
							markup: "",
							indent: state.indent,
							children: nil
						)
						text.markup = markup
						parent.children?.append(text)
						state.i += tail[fullRange].count
						return true
					}
				}
				
				let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url
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
				html.content = "<a href=\"mailto:\(encodedUrl)\">\(url)</a>"
				parent.children?.append(html)
				
				let fullMatchRange = emailMatch.range(at: 0)
				if let fullRange = Range(fullMatchRange, in: tail) {
					state.i += tail[fullRange].count
				}
				return true
			}
		}
	}
	
	return false
}

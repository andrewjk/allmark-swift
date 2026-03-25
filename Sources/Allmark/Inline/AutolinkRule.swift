import Foundation

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
						let text = newText(
							index: state.parentIndex + state.i,
							line: state.line,
							content: markup,
							indent: state.indent
						)
						text.length = tail[fullRange].count
						parent.children?.append(text)
						state.i += tail[fullRange].count
						return true
					}
				}

				let escapedUrl = url.replacingOccurrences(of: "\\", with: "\\\\")
				let decodedUrl = decodeEntities(text: url)
				let encodedUrl = decodedUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? decodedUrl

				let text = newText(
					index: state.parentIndex + state.i,
					line: state.line,
					content: escapedUrl,
					indent: state.indent
				)

				let link = newInline(
					type: "link",
					index: state.parentIndex + state.i,
					line: state.line,
					markup: "",
					indent: state.indent
				)
				link.info = encodedUrl

				let fullMatchRange = linkMatch.range(at: 0)
				if let fullRange = Range(fullMatchRange, in: tail) {
					link.length = tail[fullRange].count
					state.i += tail[fullRange].count
				}

				link.children = [text]
				parent.children?.append(link)

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
						let text = newText(
							index: state.parentIndex + state.i,
							line: state.line,
							content: markup,
							indent: state.indent
						)
						text.length = tail[fullRange].count
						parent.children?.append(text)
						state.i += tail[fullRange].count
						return true
					}
				}

				let decodedUrl = decodeEntities(text: url)
				let encodedUrl = decodedUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? decodedUrl

				let text = newText(
					index: state.parentIndex + state.i,
					line: state.line,
					content: url,
					indent: state.indent
				)

				let link = newInline(
					type: "link",
					index: state.parentIndex + state.i,
					line: state.line,
					markup: "",
					indent: state.indent
				)
				link.info = "mailto:\(encodedUrl)"

				let fullMatchRange = emailMatch.range(at: 0)
				if let fullRange = Range(fullMatchRange, in: tail) {
					link.length = tail[fullRange].count
					state.i += tail[fullRange].count
				}

				link.children = [text]
				parent.children?.append(link)

				return true
			}
		}
	}

	return false
}

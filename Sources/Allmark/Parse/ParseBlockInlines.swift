import Foundation

/// Parses block inlines by processing inline rules for a block node's content
/// - Parameters:
///   - parent: The parent markdown node (inout since we modify its children)
///   - rules: The inline rules to apply
///   - refs: Link references
///   - footnotes: Footnote references

func parseBlockInlines(
	parent: inout MarkdownNode,
	rules: [InlineRule],
	refs: [String: LinkReference],
	footnotes: [String: FootnoteReference]
) {
	// HTML blocks don't have inlines
	if parent.type == "html_block" {
		return
	}

	// Handle code blocks specially
	if parent.type == "code_block" {
		var content = parent.content
		// If content has non-whitespace, trim blank lines
		if content.range(of: "[^\\s]", options: .regularExpression) != nil {
			// Remove leading/trailing blank lines
			content = content.replacingOccurrences(
				of: "(^(\\r?\\n|\\r)\\s+(\\r?\\n|\\r)|(\\r?\\n|\\r)\\s*(\\r?\\n|\\r)$)",
				with: "",
				options: .regularExpression
			)
			// Ensure content ends with newline
			if !content.hasSuffix("\n"), !content.hasSuffix("\r\n"), !content.hasSuffix("\r") {
				content += "\n"
			}
		}
		let text = newText(
			index: parent.index,
			line: parent.line,
			content: content,
			indent: 0
		)
		parent.children.append(text)
		return
	}

	// Handle code fence specially
	if parent.type == "code_fence" {
		var content = parent.content
		// If content has non-whitespace, process indentation
		if content.range(of: "[^\\s]", options: .regularExpression) != nil {
			// Remove equivalent opening indentation
			if parent.indent > 0 {
				let pattern = "(^|\\r?\\n|\\r) {1,\(parent.indent)}"
				content = content.replacingOccurrences(
					of: pattern,
					with: "$1",
					options: .regularExpression
				)
			}
			content = content.replacingOccurrences(
				of: "^(\\r?\\n|\\r)\\s+\\1",
				with: "",
				options: .regularExpression
			)
			// Ensure content ends with newline
			if !content.hasSuffix("\n"), !content.hasSuffix("\r\n"), !content.hasSuffix("\r") {
				content += "\n"
			}
		}
		let text = newText(
			index: parent.index,
			line: parent.line,
			content: content,
			indent: 0
		)
		parent.children.append(text)
		return
	}

	let trimmed = trimTrailingWhitespace(parent.content)
	let chars = Array(trimmed.utf8)

	var state = InlineParserState(
		rules: rules,
		src: chars,
		i: skipSpaces(text: chars, start: 0),
		line: parent.line,
		lineStart: 0,
		indent: 0,
		isEscaped: false,
		delimiters: [],
		refs: refs,
		footnotes: footnotes,
		parentIndex: parent.index
	)

	parseInline(state: &state, parent: parent)

	// Recursively parse inlines for block children
	for i in 0 ..< parent.children.count {
		if parent.children[i].block {
			parseBlockInlines(parent: &parent.children[i], rules: rules, refs: refs, footnotes: footnotes)
		}
	}
}

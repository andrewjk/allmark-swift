import Foundation
import Collections

/// Parses block inlines by processing inline rules for a block node's content
/// - Parameters:
///   - parent: The parent markdown node (inout since we modify its children)
///   - rules: The inline rules to apply
///   - refs: Link references
///   - footnotes: Footnote references
@MainActor
func parseBlockInlines(
	parent: inout MarkdownNode,
	rules: OrderedDictionary<String, InlineRule>,
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
				of: "(^\\n\\s+\\n|\\n\\s*\\n$)",
				with: "",
				options: .regularExpression
			)
			// Ensure content ends with newline
			if !content.hasSuffix("\n") {
				content += "\n"
			}
		}
		let text = MarkdownNode(
			type: "text",
			block: false,
			index: parent.index,
			line: parent.line,
			column: 1,
			markup: content,
			indent: 0,
			children: nil
		)
		text.content = content
		parent.children?.append(text)
		return
	}
	
	// Handle code fence specially
	if parent.type == "code_fence" {
		var content = parent.content
		// If content has non-whitespace, process indentation
		if content.range(of: "[^\\s]", options: .regularExpression) != nil {
			// Remove equivalent opening indentation
			if parent.indent > 0 {
				let pattern = "(^|\\n) {1,\(parent.indent)}"
				content = content.replacingOccurrences(
					of: pattern,
					with: "$1",
					options: .regularExpression
				)
			}
			// Remove leading blank lines
			content = content.replacingOccurrences(
				of: "^\\n\\s+\\n",
				with: "",
				options: .regularExpression
			)
			// Ensure content ends with newline
			if !content.hasSuffix("\n") {
				content += "\n"
			}
		}
		let text = MarkdownNode(
			type: "text",
			block: false,
			index: parent.index,
			line: parent.line,
			column: 1,
			markup: content,
			indent: 0,
			children: nil
		)
		text.content = content
		parent.children?.append(text)
		return
	}
	
	var state = InlineParserState(
		rules: rules,
		// "Final spaces are stripped before inline parsing"
        src: parent.content.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression),
		i: 0,
		line: parent.line,
		lineStart: 0,
		indent: 0,
		delimiters: [],
		refs: refs,
		footnotes: footnotes
	)
	
	parseInline(state: &state, parent: parent)
	
	// Recursively parse inlines for block children
	if var children = parent.children {
		for i in 0..<children.count {
			if children[i].block {
				parseBlockInlines(parent: &children[i], rules: rules, refs: refs, footnotes: footnotes)
			}
		}
		parent.children = children
	}
}

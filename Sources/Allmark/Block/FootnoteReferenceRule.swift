import Foundation

/// A footnote definition has a label that starts with ^, followed by a colon
/// and the footnote content.

let footnoteReferenceRule = BlockRule(
	name: "footnote_ref",
	testStart: testFootnoteReferenceStart,
	testContinue: testFootnoteReferenceContinue,
	closeNode: { _, _ in }
)

func testFootnoteReferenceStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if !state.isEscaped && state.indent <= 3 && char == "[" {
		// A footnote definition cannot interrupt a paragraph
		if parent.type == "paragraph" && !parent.blankAfter {
			return false
		}

		let originalIndex = state.i
		var start = state.i + 1

		// Check for ^ that indicates a footnote (not a regular link reference)
		if start >= src.count || src[start] != "^" {
			return false
		}
		start += 1

		// Get the label
		var label = ""
		for i in start ..< src.count {
			if !isEscaped(text: src, i: i) {
				if src[i] == "]" {
					label = charToString(src, from: start, to: i)
					start = i + 1
					break
				}

				// Labels cannot contain brackets, unless they are backslash-escaped
				if src[i] == "[" {
					return false
				}
			}
		}

		// A label must contain at least one non-whitespace character
		let labelPattern = try! NSRegularExpression(pattern: "[^\\s]")
		let labelRange = NSRange(location: 0, length: label.utf16.count)
		if label.isEmpty || labelPattern.firstMatch(in: label, options: [], range: labelRange) == nil {
			return false
		}

		if start >= src.count || src[start] != ":" {
			return false
		}
		start += 1

		// Skip whitespace after colon
		while start < src.count {
			if isSpace(char: src[start]) {
				start += 1
			} else {
				break
			}
		}

		state.i = start

		// Matching of labels is case-insensitive
		label = normalizeLabel(text: label)

		// If there are several matching definitions, the first one takes precedence
		if state.footnotes[label] != nil {
			return true
		}

		let ref = newBlock(
			type: "footnote_ref",
			index: originalIndex,
			line: state.line,
			markup: "",
			indent: 0
		)
		ref.info = label
		state.footnotes[label] = FootnoteReference(label: label, content: ref)

		if state.hasBlankLine && !parent.children.isEmpty {
			let lastChild = parent.children[parent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		parent.children.append(ref)
		state.openNodes.append(ref)

		state.hasBlankLine = false
		parseBlock(state: &state, parent: ref)

		return true
	}

	// Add another paragraph if there is an indent of at least 4 characters
	if state.hasBlankLine && state.indent >= 4 {
		let currentParent = parent
		if let lastChild = currentParent.children.last, lastChild.type == "footnote_ref" {
			state.indent = 0
			parseBlock(state: &state, parent: lastChild)
			return true
		}
	}

	return false
}

func testFootnoteReferenceContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	if state.hasBlankLine {
		return false
	}

	let openNode = state.openNodes.last!
	if openNode.type == "paragraph" {
		if state.indent >= 4 ||
			openNode.content.hasSuffix("  \n") ||
			openNode.content.hasSuffix("  \r\n") ||
			(state.i + 1 < state.src.count && state.src[state.i] == "[" &&
				state.src[state.i + 1] != "^")
		{
			state.maybeContinue = true
			node.maybeContinuing = true
			return true
		}
	}

	return false
}

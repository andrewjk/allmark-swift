import Foundation

/// A link reference definition consists of a link label, indented up to three
/// spaces, followed by a colon (:), optional whitespace, a link destination,
/// optional whitespace, and an optional link title.

let linkReferenceRule = BlockRule(
	name: "link_ref",
	testStart: testLinkReferenceStart,
	testContinue: testLinkReferenceContinue,
	closeNode: { _, _ in }
)

func testLinkReferenceStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if !state.isEscaped && state.indent <= 3 && char == "[" {
		// A link reference definition cannot interrupt a paragraph
		if parent.type == "paragraph" && !parent.blankAfter {
			return false
		}

		let originalIndex = state.i
		var start = state.i + 1

		// Get the label
		var label = ""
		for i in start ..< src.count {
			if !isEscaped(text: src, i: i) {
				if src[i] == "]" {
					label = charToString(src, from: start, to: i)
					start = i + 1
					break
				}

				// Link labels cannot contain brackets, unless they are backslash-escaped
				if src[i] == "[" {
					return false
				}
			}
		}

		// A link label must contain at least one non-whitespace character
		let labelPattern = try! NSRegularExpression(pattern: "[^\\s]")
		let labelRange = NSRange(location: 0, length: label.utf16.count)
		if label.isEmpty || labelPattern.firstMatch(in: label, options: [], range: labelRange) == nil {
			return false
		}

		if start >= src.count || src[start] != ":" {
			return false
		}

		start += 1

		guard let linkInfo = parseLinkBlock(state: &state, start: start, _end: "\n") else {
			return false
		}

		// Matching of labels is case-insensitive
		label = normalizeLabel(text: label)

		// If there are several matching definitions, the first one takes precedence
		if state.refs[label] != nil {
			return true
		}

		state.refs[label] = linkInfo

		let ref = newBlock(
			type: "link_ref",
			index: originalIndex,
			line: state.line,
			markup: "",
			indent: 0
		)

		if state.hasBlankLine && !parent.children.isEmpty {
			let lastChild = parent.children[parent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		parent.children.append(ref)

		if state.i > 0 {
			if !isNewLine(char: src[state.i - 1]) {
				state.i = getEndOfLine(state: &state)
			}
		}

		ref.length = state.i - ref.index

		return true
	}

	return false
}

func testLinkReferenceContinue(state _: inout BlockParserState, node _: MarkdownNode) -> Bool {
	return false
}

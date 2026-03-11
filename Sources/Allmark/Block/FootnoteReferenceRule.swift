import Foundation

/// A footnote definition has a label that starts with ^, followed by a colon
/// and the footnote content.
@MainActor
let footnoteReferenceRule = BlockRule(
	name: "footnote_ref",
	testStart: testFootnoteReferenceStart,
	testContinue: testFootnoteReferenceContinue,
	closeNode: { _, _ in }
)

@MainActor
func testFootnoteReferenceStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && char == "[" && !isEscaped(text: src, i: state.i) {
		// A footnote definition cannot interrupt a paragraph
		if parent.type == "paragraph" && !parent.blankAfter {
			return false
		}
		
		var start = state.i + 1
		
		// Check for ^ that indicates a footnote (not a regular link reference)
		if start >= src.count || src[src.index(src.startIndex, offsetBy: start)] != "^" {
			return false
		}
		start += 1
		
		// Get the label
		var label = ""
		for i in start..<src.count {
			if !isEscaped(text: src, i: i) {
				let iIndex = src.index(src.startIndex, offsetBy: i)
				if src[iIndex] == "]" {
					let labelStart = src.index(src.startIndex, offsetBy: start)
					let labelEnd = src.index(src.startIndex, offsetBy: i)
					label = String(src[labelStart..<labelEnd])
					start = i + 1
					break
				}
				
				// Labels cannot contain brackets, unless they are backslash-escaped
				if src[iIndex] == "[" {
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
		
		if start >= src.count || src[src.index(src.startIndex, offsetBy: start)] != ":" {
			return false
		}
		start += 1
		
		// Skip whitespace after colon
		while start < src.count {
			let startIndex = src.index(src.startIndex, offsetBy: start)
			if isSpace(code: Int(src[startIndex].asciiValue ?? 0)) {
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
		
		let ref = MarkdownNode(
			type: "footnote_ref",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 0,
			children: []
		)
		state.footnotes[label] = FootnoteReference(label: label, content: ref)
		
		if state.hasBlankLine && parent.children != nil && !parent.children!.isEmpty {
			let lastChild = parent.children![parent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		parent.children!.append(ref)
		state.openNodes.append(ref)
		
		state.hasBlankLine = false
		parseBlock(state: &state, parent: ref)
		
		return true
	}
	
	// Add another paragraph if there is an indent of at least 4 characters
	if state.hasBlankLine && state.indent >= 4 {
		let currentParent = parent
		if let lastChild = currentParent.children?.last, lastChild.type == "footnote_ref" {
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
			(state.src[state.src.index(state.src.startIndex, offsetBy: state.i)] == "[" &&
				state.src[state.src.index(state.src.startIndex, offsetBy: state.i + 1)] != "^") {
			state.maybeContinue = true
			node.maybeContinuing = true
			return true
		}
	}
	
	return false
}

// Helper for space checking (used in this file only)
func isWhitespaceSpace(code: Int) -> Bool {
	return code == 0x20 || code == 0x09
}

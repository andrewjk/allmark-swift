import Foundation

/// A link reference definition consists of a link label, indented up to three
/// spaces, followed by a colon (:), optional whitespace, a link destination,
/// optional whitespace, and an optional link title.
@MainActor
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
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && char == "[" && !isEscaped(text: src, i: state.i) {
		// A link reference definition cannot interrupt a paragraph
		if parent.type == "paragraph" && !parent.blankAfter {
			return false
		}
		
		var start = state.i + 1
		
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
				
				// Link labels cannot contain brackets, unless they are backslash-escaped
				if src[iIndex] == "[" {
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
		
		if start >= src.count || src[src.index(src.startIndex, offsetBy: start)] != ":" {
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
		
		let ref = MarkdownNode(
			type: "link_ref",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 0,
			children: []
		)
		
		if state.hasBlankLine && parent.children != nil && !parent.children!.isEmpty {
			let lastChild = parent.children![parent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		parent.children!.append(ref)
		
		if state.i > 0 {
			let prevIndex = src.index(src.startIndex, offsetBy: state.i - 1)
			if !isNewLine(char: String(src[prevIndex])) {
				state.i = getEndOfLine(state: &state)
			}
		}
		
		return true
	}
	
	return false
}

func testLinkReferenceContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

import Foundation

/// A sequence of non-blank lines that cannot be interpreted as other kinds of
/// blocks forms a paragraph.
@MainActor
let paragraphRule = BlockRule(
	name: "paragraph",
	testStart: testParagraphStart,
	testContinue: testParagraphContinue,
	closeNode: { _, _ in }
)

func testParagraphStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	// Don't start a new paragraph if we're already in one and there's no blank line
	if parent.type == "paragraph" && !parent.blankAfter {
		return false
	}
	
	let endOfLine = getEndOfLine(state: &state)
	let src = state.src
	
	let startIndex = src.index(src.startIndex, offsetBy: state.i)
	let endIndex = src.index(src.startIndex, offsetBy: endOfLine)
	let content = String(src[startIndex..<endIndex])
	
	// Check if content has at least one non-whitespace character
	let contentPattern = try! NSRegularExpression(pattern: "[^\\s]")
	let contentRange = NSRange(location: 0, length: content.utf16.count)
	if contentPattern.firstMatch(in: content, options: [], range: contentRange) == nil {
		state.i += content.count
		return true
	}
	
	let paragraph = MarkdownNode(
		type: "paragraph",
		block: true,
		index: state.i,
		line: state.line,
		column: 1,
		markup: "",
		indent: 0,
		children: []
	)
	paragraph.content = content
	state.i = endOfLine
	
	if state.hasBlankLine && parent.children != nil && !parent.children!.isEmpty {
		let lastChild = parent.children![parent.children!.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
	
	parent.children!.append(paragraph)
	state.openNodes.append(paragraph)
	
	return true
}

func testParagraphContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	if state.hasBlankLine {
		return false
	}
	
	return true
}

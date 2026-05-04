import Foundation

/// A sequence of non-blank lines that cannot be interpreted as other kinds of
/// blocks forms a paragraph.

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

	if parent.type == "paragraph" && !parent.blankAfter {
		return false
	}

	let endOfLine = getEndOfLine(state: &state)
	let src = state.src

	var hasNonWhitespace = false
	for i in state.i ..< endOfLine {
		if !isWhitespace(code: src[i]) {
			hasNonWhitespace = true
			break
		}
	}
	if !hasNonWhitespace {
		state.i = endOfLine
		return true
	}

	let content = charToString(src, from: state.i, to: endOfLine)

	let paragraph = newBlock(
		type: "paragraph",
		index: state.i,
		line: state.line,
		markup: "",
		indent: 0
	)
	paragraph.content = content
	state.i = endOfLine

	if state.hasBlankLine && !parent.children.isEmpty {
		let lastChild = parent.children[parent.children.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}

	parent.children.append(paragraph)
	state.openNodes.append(paragraph)

	return true
}

func testParagraphContinue(state: inout BlockParserState, node _: MarkdownNode) -> Bool {
	if state.hasBlankLine {
		return false
	}

	return true
}

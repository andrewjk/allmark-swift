import Foundation

/// An indented code block is composed of one or more indented chunks separated
/// by blank lines. An indented chunk is a sequence of non-blank lines, each
/// indented four or more spaces.

let codeBlockRule = BlockRule(
	name: "code_block",
	testStart: testCodeBlockStart,
	testContinue: testCodeBlockContinue,
	closeNode: { _, _ in }
)

func testCodeBlockStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	// An indented code block cannot interrupt a paragraph
	if parent.type == "paragraph" && !parent.blankAfter {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if state.indent >= 4 && !isNewLine(code: char) {
		let currentParent = parent

		let codeIndent = state.indent - 4

		let code = newBlock(
			type: "code_block",
			index: state.i - state.indent,
			line: state.line,
			markup: "    ",
			indent: codeIndent
		)
		code.acceptsContent = true
		code.content = String(repeating: " ", count: codeIndent)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(code)
		state.openNodes.append(code)

		state.indent = 0
		state.hasBlankLine = false
		parseBlock(state: &state, parent: code, endOfLine: endOfLine)

		return true
	}

	return false
}

func testCodeBlockContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	if state.hasBlankLine && state.indent >= 4 {
		// Any initial spaces beyond four will be included in the content,
		// even in interior blank lines
		node.content += String(repeating: " ", count: state.indent - 4)
	}

	if state.indent >= 4 {
		state.indent -= 4
		return true
	}

	if state.hasBlankLine {
		return true
	}

	return false
}

import Foundation

/// An indented code block is composed of one or more indented chunks separated
/// by blank lines. An indented chunk is a sequence of non-blank lines, each
/// indented four or more spaces.
@MainActor
let codeBlockRule = BlockRule(
	name: "code_block",
	testStart: testCodeBlockStart,
	testContinue: testCodeBlockContinue,
	closeNode: { _, _ in }
)

@MainActor
func testCodeBlockStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
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
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent >= 4 && !isNewLine(char: String(char)) {
		var closedNode: MarkdownNode? = nil
		var currentParent = parent
		
		// TODO: rule.canContain?? e.g. list_ordered.canContain = ["list_item"] etc
		if currentParent.type == "list_ordered" || currentParent.type == "list_bulleted" {
			closedNode = state.openNodes.popLast()
			currentParent = state.openNodes.last!
		}
		
		if state.maybeContinue {
			state.maybeContinue = false
			var i = state.openNodes.count - 1
			while i > 0 {
				let node = state.openNodes[i]
				if node.maybeContinuing {
					node.maybeContinuing = false
					closedNode = node
					state.openNodes.removeSubrange(i...)
					break
				}
				i -= 1
			}
			currentParent = state.openNodes.last!
		}
		
		if closedNode != nil {
			closeNode(state: &state, node: closedNode!)
		}
		
		let codeIndent = state.indent - 4
		
		let code = MarkdownNode(
			type: "code_block",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "    ",
			indent: codeIndent,
			children: []
		)
		code.acceptsContent = true
		code.content = String(repeating: " ", count: codeIndent)
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(code)
		state.openNodes.append(code)
		
		state.indent = 0
		state.hasBlankLine = false
		parseBlock(state: &state, parent: code)
		
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

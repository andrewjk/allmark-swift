import Foundation

/// A line consisting of 0-3 spaces of indentation, followed by a sequence of
/// three or more matching -, _, or * characters, forms a thematic break.
@MainActor
let thematicBreakRule = BlockRule(
	name: "thematic_break",
	testStart: testThematicBreakStart,
	testContinue: testThematicBreakContinue,
	closeNode: { _, _ in }
)

@MainActor
func testThematicBreakStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && (char == "-" || char == "_" || char == "*") {
		var matched = 1
		var end = state.i + 1
		
		while end < src.count {
			let endIndex = src.index(src.startIndex, offsetBy: end)
			let nextChar = src[endIndex]

			if nextChar == char {
				matched += 1
			} else if isNewLine(char: String(nextChar)) {
				end += 1
				break
			} else if isSpace(code: Int(nextChar.asciiValue ?? 0)) {
				// continue
			} else {
				return false
			}
			end += 1
		}
		
		if matched >= 3 {
			var closedNode: MarkdownNode? = nil
			var currentParent = parent
			
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
			
			if currentParent.type == "paragraph" {
				closedNode = state.openNodes.popLast()
				currentParent = state.openNodes.last!
			}
			
			// HACK: Special case for a thematic break in a list
			if currentParent.type == "list_item" && !state.hasBlankLine && String(char) == currentParent.delimiter {
				state.openNodes.removeLast()
				state.openNodes.removeLast()
				currentParent = state.openNodes.last!
			}
			if currentParent.type == "list_bulleted" || currentParent.type == "list_ordered" {
				state.openNodes.removeLast()
				currentParent = state.openNodes.last!
			}
			
			if closedNode != nil {
				closeNode(state: &state, node: closedNode!)
			}
			
			let markupStart = src.index(src.startIndex, offsetBy: state.i)
			let markupEnd = src.index(src.startIndex, offsetBy: end)
			let markup = String(src[markupStart..<markupEnd])
			
			let tbr = MarkdownNode(
				type: "thematic_break",
				block: true,
				index: state.i,
				line: state.line,
				column: 1,
				markup: markup,
				indent: 0,
				children: []
			)
			currentParent.children?.append(tbr)
			state.i = end
			return true
		}
	}
	
	return false
}

func testThematicBreakContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

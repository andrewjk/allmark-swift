import Foundation

/// A line consisting of 0-3 spaces of indentation, followed by a sequence of
/// three or more matching -, _, or * characters, forms a thematic break.

let thematicBreakRule = BlockRule(
	name: "thematic_break",
	testStart: testThematicBreakStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testThematicBreakStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if state.indent <= 3 && (char == "-" || char == "_" || char == "*") {
		var matched = 1
		var end = state.i + 1

		while end < src.count {
			let nextChar = src[end]

			if nextChar == char {
				matched += 1
			} else if isNewLine(char: nextChar) {
				end += 1
				break
			} else if isSpace(char: nextChar) {
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

			if currentParent.type == "list_bulleted" || currentParent.type == "list_ordered" {
				closedNode = state.openNodes.removeLast()
				currentParent = state.openNodes.last!
			}

			if closedNode != nil {
				closeNode(state: &state, node: closedNode!)
			}

			let markup = charToString(src, from: state.i, to: end)

			let tbr = newBlock(
				type: "thematic_break",
				index: state.i,
				line: state.line,
				markup: markup,
				indent: 0
			)
			tbr.length = end - state.i
			currentParent.children.append(tbr)
			state.i = end
			return true
		}
	}

	return false
}

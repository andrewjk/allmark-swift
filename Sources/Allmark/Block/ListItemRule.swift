import Foundation

/// List item continuation logic

let listItemRule = BlockRule(
	name: "list_item",
	testStart: testListItemStart,
	testContinue: testListItemContinue,
	closeNode: { _, _ in }
)

func testListItemStart(state _: inout BlockParserState, parent _: MarkdownNode, endOfLine _: Int) -> Bool {
	return false
}

func testListItemContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if state.indent >= node.subindent {
		state.indent -= node.subindent
		return true
	}

	// This only applies to the lowest list_item
	var itemNode: MarkdownNode? = nil
	var i = state.openNodes.count - 1

	while i > 0 {
		let openNode = state.openNodes[i]
		if openNode.type == "list_item" {
			itemNode = openNode
		} else if openNode.type == "list_ordered" {
			var numbers: [UInt8] = []
			var end = state.i

			while end < src.count {
				if isNumeric(code: src[end]) {
					numbers.append(src[end])
					end += 1
				} else {
					break
				}
			}

			if end < src.count {
				let delimiter = src[end]

				if let item = itemNode {
					if state.indent <= 3 && state.indent < item.subindent && !numbers.isEmpty && byteString(delimiter) == node.delimiter {
						return false
					}
				}
			}
		} else if openNode.type == "list_bulleted" {
			if let item = itemNode {
				if state.indent <= 3 && state.indent < item.subindent && byteString(char) == node.delimiter {
					return false
				}
			}
		}
		i -= 1
	}

	if state.hasBlankLine {
		return true
	}

	let openNode = state.openNodes.last!
	if openNode.type == "paragraph" {
		state.maybeContinue = true
		node.maybeContinuing = true
		return true
	}

	return false
}

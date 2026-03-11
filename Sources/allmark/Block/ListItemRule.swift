import Foundation

/// List item continuation logic
@MainActor
let listItemRule = BlockRule(
	name: "list_item",
	testStart: testListItemStart,
	testContinue: testListItemContinue,
	closeNode: { _, _ in }
)

func testListItemStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	return false
}

func testListItemContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	// This only applies to the lowest list_item
	var itemNode: MarkdownNode? = nil
	var i = state.openNodes.count - 1
	
	while i > 0 {
		let openNode = state.openNodes[i]
		if openNode.type == "list_item" {
			itemNode = openNode
		} else if state.openNodes[i].type == "list_ordered" {
			var numbers = ""
			var end = state.i
			
			while end < src.count {
				let endIndex = src.index(src.startIndex, offsetBy: end)
				if isNumeric(code: Int(src[endIndex].asciiValue ?? 0)) {
					numbers.append(src[endIndex])
					end += 1
				} else {
					break
				}
			}
			
			if end < src.count {
				let delimiterIndex = src.index(src.startIndex, offsetBy: end)
				let delimiter = src[delimiterIndex]
				
				if let item = itemNode {
					if state.indent <= 3 && state.indent < item.subindent && !numbers.isEmpty && String(delimiter) == node.delimiter {
						return false
					}
				}
			}
			break
		} else if state.openNodes[i].type == "list_bulleted" {
			if let item = itemNode {
				if state.indent <= 3 && state.indent < item.subindent && char == node.delimiter.first {
					return false
				}
			}
			break
		}
		i -= 1
	}
	
	if state.indent >= node.subindent {
		state.indent -= node.subindent
		return true
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

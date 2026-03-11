import Foundation

/// A list is a sequence of one or more list items of the same type.
struct ListInfo {
	var delimiter: String
	var markup: String
	var isBlank: Bool
	var type: String
}

@MainActor
func testListStart(state: inout BlockParserState, parent: MarkdownNode, info: ListInfo?) -> Bool {
	guard let info = info else {
		return false
	}
	
	var closedNode: MarkdownNode? = nil
	var currentParent = parent
	
	// When the first list item in a list interrupts a paragraph
	if currentParent.type == "paragraph" && state.openNodes.count == 2 {
		// An empty list item cannot interrupt a paragraph
		if info.isBlank {
			return false
		}
		
		// We allow only lists starting with 1 to interrupt paragraphs
		if info.type == "list_ordered" && info.markup != "1" + info.delimiter {
			return false
		}
	}
	
	// List items may not be indented more than three spaces
	var openIndent = state.indent
	var i = state.openNodes.count - 1
	while i > 0 {
		if isListType(state.openNodes[i].type) {
			openIndent -= state.openNodes[i].indent
			break
		}
		i -= 1
	}
	if openIndent >= 4 {
		return false
	}
	
	// If this was possibly a continuation, it no longer is
	if state.maybeContinue {
		state.maybeContinue = false
		i = state.openNodes.count - 1
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
	
	// If there's an open paragraph, close it
	if currentParent.type == "paragraph" {
		closedNode = state.openNodes.popLast()
		currentParent = state.openNodes.last!
	}
	
	// If there's an open list of a different type, and this node is not nested, close it
	if isListType(currentParent.type) && currentParent.delimiter != info.delimiter {
		if let lastItem = currentParent.children?.last {
			if lastItem.type == "list_item" && state.indent < lastItem.subindent {
				closedNode = state.openNodes.popLast()
				currentParent = state.openNodes.last!
			}
		}
	}
	
	if closedNode != nil {
		closeNode(state: &state, node: closedNode!)
	}
	
	// Count spaces after the marker
	var spaces = 0
	var blank = true
	let src = state.src
	let startIdx = state.i + info.markup.count
	
	for idx in startIdx..<src.count {
		let charIndex = src.index(src.startIndex, offsetBy: idx)
		if isNewLine(char: String(src[charIndex])) {
			break
		} else if isSpace(code: Int(src[charIndex].asciiValue ?? 0)) {
			spaces += 1
		} else {
			blank = false
			break
		}
	}
	
	// If there's a newline after the marker, treat it as one space
	if blank {
		spaces = 1
	}
	
	// If the first block in the list item is an indented code block
	if spaces > 4 {
		spaces = 1
	}
	
	let haveList = currentParent.type == info.type
	
	var list: MarkdownNode
	if haveList {
		list = currentParent
	} else {
		list = MarkdownNode(
			type: info.type,
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: info.markup,
			indent: state.indent,
			children: []
		)
	}
	list.delimiter = info.delimiter
	
	let item = MarkdownNode(
		type: "list_item",
		block: true,
		index: state.i,
		line: state.line,
		column: 1,
		markup: info.markup,
		indent: state.indent,
		children: []
	)
	item.delimiter = info.delimiter
	item.subindent = state.indent + info.markup.count + spaces
	
	if !haveList {
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(list)
		state.openNodes.append(list)
	}
	
	if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
		let lastChild = currentParent.children![currentParent.children!.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
	
	list.children?.append(item)
	state.openNodes.append(item)
	
	movePastMarker(markerLength: info.markup.count, state: &state)
	
	state.hasBlankLine = false
	parseBlock(state: &state, parent: item)
	
	return true
}

func testListContinue(state: inout BlockParserState, node: MarkdownNode, info: ListInfo?) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	// If there's the same list marker and the indent is not too far, we can continue
	if let info = info {
		if state.hasBlankLine && state.indent >= 4 {
			return false
		}
		if info.delimiter == node.delimiter {
			return true
		}
	}
	
	// Can't continue if there's only one item, it's blank and there's a blank line after the list
	if state.hasBlankLine && node.children?.count == 1 && (node.children?.first?.children?.isEmpty ?? true) {
		return false
	}
	
	if isNewLine(char: String(char)) {
		return true
	}
	
	let openNode = state.openNodes.last!
	if openNode.type == "paragraph" {
		return true
	}
	
	if let lastItem = node.children?.last {
		if lastItem.type == "list_item" && state.indent >= lastItem.subindent {
			return true
		}
	}
	
	return false
}

// HACK: Not great
func isListType(_ nodeType: String) -> Bool {
	return nodeType.hasPrefix("list_") && nodeType != "list_item"
}

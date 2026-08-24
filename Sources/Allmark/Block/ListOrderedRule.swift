import Foundation

/// An ordered list is a list of items that start with a number and delimiter

let listOrderedRule = BlockRule(
	name: "list_ordered",
	testStart: testListOrderedStart,
	testContinue: testListOrderedContinue,
	closeNode: closeListOrderedNode
)

func closeListOrderedNode(_: inout BlockParserState, _ node: MarkdownNode) {
	node.loose = isLooseList(node)
}

func getOrderedListMarkup(state: BlockParserState) -> ListInfo? {
	let src = state.src
	if state.i >= src.count {
		return nil
	}

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

	if !numbers.isEmpty, numbers.count < 10, end < src.count {
		let delimiter = src[end]

		if delimiter == DOT_CODE || delimiter == PAREN_CLOSE_CODE {
			let isSpaceOrEof = end == src.count - 1 || (end + 1 < src.count && isSpace(code: src[end + 1]))

			if isSpaceOrEof || end == src.count - 1 {
				let isBlank = end == src.count - 1 || isNewLine(code: src[end + 1])

				return ListInfo(
					delimiter: byteString(delimiter),
					markup: String(decoding: numbers, as: UTF8.self) + byteString(delimiter),
					isBlank: isBlank,
					type: "list_ordered"
				)
			}
		}
	}

	return nil
}

func testListOrderedStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	guard let info = getOrderedListMarkup(state: state) else {
		return false
	}

	return testListStart(state: &state, parent: parent, endOfLine: endOfLine, info: info)
}

func testListOrderedContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let info = getOrderedListMarkup(state: state)
	return testListContinue(state: &state, node: node, info: info)
}

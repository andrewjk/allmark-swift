import Foundation

/// A bullet list is a list of items that start with a bullet marker (-, +, or *)

let listBulletedRule = BlockRule(
	name: "list_bulleted",
	testStart: testListBulletedStart,
	testContinue: testListBulletedContinue,
	closeNode: closeListBulletedNode
)

func closeListBulletedNode(_: inout BlockParserState, _ node: MarkdownNode) {
	node.loose = isLooseList(node)
}

func getBulletedListMarkup(state: BlockParserState) -> ListInfo? {
	let src = state.src
	if state.i >= src.count {
		return nil
	}

	let char = src[state.i]

	if char == DASH_CODE || char == PLUS_CODE || char == ASTERISK_CODE {
		// Check if next char is space or end of line
		if state.i == src.count - 1 {
			return ListInfo(
				delimiter: byteString(char),
				markup: byteString(char),
				isBlank: true,
				type: "list_bulleted"
			)
		}

		let nextChar = src[state.i + 1]
		// Check if next char is a space or newline
		if isSpace(code: nextChar) || isNewLine(code: nextChar) {
			// If it's a newline directly after the marker, it's blank
			let isBlank = isNewLine(code: nextChar)
			return ListInfo(
				delimiter: byteString(char),
				markup: byteString(char),
				isBlank: isBlank,
				type: "list_bulleted"
			)
		}
	}

	return nil
}

func testListBulletedStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	guard let info = getBulletedListMarkup(state: state) else {
		return false
	}

	return testListStart(state: &state, parent: parent, endOfLine: endOfLine, info: info)
}

func testListBulletedContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let info = getBulletedListMarkup(state: state)
	return testListContinue(state: &state, node: node, info: info)
}

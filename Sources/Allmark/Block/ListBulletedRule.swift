import Foundation

/// A bullet list is a list of items that start with a bullet marker (-, +, or *)

let listBulletedRule = BlockRule(
	name: "list_bulleted",
	testStart: testListBulletedStart,
	testContinue: testListBulletedContinue,
	closeNode: { _, _ in }
)

func getBulletedListMarkup(state: BlockParserState) -> ListInfo? {
	let src = state.src
	if state.i >= src.count {
		return nil
	}

	let char = src[state.i]

	if char == "-" || char == "+" || char == "*" {
		// Check if next char is space or end of line
		if state.i == src.count - 1 {
			return ListInfo(
				delimiter: String(char),
				markup: String(char),
				isBlank: true,
				type: "list_bulleted"
			)
		}

		let nextChar = src[state.i + 1]
		if isSpace(char: nextChar) {
			let isBlank = isNewLine(char: nextChar)
			return ListInfo(
				delimiter: String(char),
				markup: String(char),
				isBlank: isBlank,
				type: "list_bulleted"
			)
		}
	}

	return nil
}

func testListBulletedStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	guard let info = getBulletedListMarkup(state: state) else {
		return false
	}

	return testListStart(state: &state, parent: parent, info: info)
}

func testListBulletedContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let info = getBulletedListMarkup(state: state)
	return testListContinue(state: &state, node: node, info: info)
}

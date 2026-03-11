import Foundation

/// A bullet list is a list of items that start with a bullet marker (-, +, or *)
@MainActor
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
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
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
		
		let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
		if isSpace(code: Int(src[nextIndex].asciiValue ?? 0)) {
			let isBlank = isNewLine(char: String(src[nextIndex]))
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

@MainActor
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

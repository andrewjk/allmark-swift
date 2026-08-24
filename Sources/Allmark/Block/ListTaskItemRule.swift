import Foundation

/// GFM task list items (checkboxes in list items)

let listTaskItemRule = BlockRule(
	name: "list_task_item",
	testStart: testListTaskItemStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

/**
 * A task list item is a list item where the first block in it is a paragraph
 * which begins with a task list item marker and at least one whitespace
 * character before any other content.
 */
func testListTaskItemStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine _: Int) -> Bool {
	if parent.type == "list_item" {
		let start = state.i
		let src = state.src

		if start + 3 < src.count {
			let char1 = src[start]
			let char2 = src[start + 1]
			let char3 = src[start + 2]
			let char4 = src[start + 3]

			if char1 == BRACKET_OPEN_CODE && char3 == BRACKET_CLOSE_CODE && isSpace(code: char4) {
				// GitHub doesn't support task lists in block quotes
				let inBlockQuote = state.openNodes.contains { $0.type == "block_quote" }
				if !inBlockQuote {
					let markup = "[" + byteString(char2) + "]"

					// HACK: It should be a block, but it's not for output reasons
					let task = newInline(
						type: "list_task_item",
						index: state.i,
						line: state.line,
						markup: markup,
						indent: 0
					)
					task.length = 3

					parent.children.append(task)
					movePastMarker(markerLength: 3, state: &state)
				}
			}
		}
	}

	return false
}

import Foundation

/// GFM task list items (checkboxes in list items)
@MainActor
let listTaskItemRule = BlockRule(
	name: "list_task_item",
	testStart: testListTaskItemStart,
	testContinue: testListTaskItemContinue,
	closeNode: { _, _ in }
)

/**
 * A task list item is a list item where the first block in it is a paragraph
 * which begins with a task list item marker and at least one whitespace
 * character before any other content.
 */
func testListTaskItemStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.type == "list_item" {
		let start = state.i
		let src = state.src
		
		if start + 3 < src.count {
			let startIndex = src.index(src.startIndex, offsetBy: start)
			let char1 = src[startIndex]
			let char2 = src[src.index(src.startIndex, offsetBy: start + 1)]
			let char3 = src[src.index(src.startIndex, offsetBy: start + 2)]
			let char4 = src[src.index(src.startIndex, offsetBy: start + 3)]
			
			if char1 == "[" && char3 == "]" && isSpace(code: Int(char4.asciiValue ?? 0)) {
				// GitHub doesn't support task lists in block quotes
				let inBlockQuote = state.openNodes.contains { $0.type == "block_quote" }
				if !inBlockQuote {
					let markup = "[\(char2)]"
					
					// HACK: It should be a block, but it's not for output reasons
					let task = MarkdownNode(
						type: "list_task_item",
						block: false,
						index: state.i,
						line: state.line,
						column: 1,
						markup: markup,
						indent: 0,
						children: []
					)
					
                    parent.children?.append(task)
					state.i = start + 3
				}
			}
		}
	}
	
	return false
}

func testListTaskItemContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

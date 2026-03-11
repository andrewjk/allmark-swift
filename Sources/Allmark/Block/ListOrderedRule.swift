import Foundation

/// An ordered list is a list of items that start with a number and delimiter
@MainActor
let listOrderedRule = BlockRule(
	name: "list_ordered",
	testStart: testListOrderedStart,
	testContinue: testListOrderedContinue,
	closeNode: { _, _ in }
)

func getOrderedListMarkup(state: BlockParserState) -> ListInfo? {
	let src = state.src
	if state.i >= src.count {
		return nil
	}
	
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
	
	if !numbers.isEmpty && numbers.count < 10 && end < src.count {
		let delimiterIndex = src.index(src.startIndex, offsetBy: end)
		let delimiter = src[delimiterIndex]
		
		if delimiter == "." || delimiter == ")" {
			let isSpaceOrEof = end == src.count - 1 || (end + 1 < src.count && isSpace(code: Int(src[src.index(src.startIndex, offsetBy: end + 1)].asciiValue ?? 0)))
			
			if isSpaceOrEof || end == src.count - 1 {
				let isBlank = end == src.count - 1 || isNewLine(char: String(src[src.index(src.startIndex, offsetBy: end + 1)]))
				
				return ListInfo(
					delimiter: String(delimiter),
					markup: numbers + String(delimiter),
					isBlank: isBlank,
					type: "list_ordered"
				)
			}
		}
	}
	
	return nil
}

@MainActor
func testListOrderedStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	guard let info = getOrderedListMarkup(state: state) else {
		return false
	}
	
	return testListStart(state: &state, parent: parent, info: info)
}

func testListOrderedContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let info = getOrderedListMarkup(state: state)
	return testListContinue(state: &state, node: node, info: info)
}

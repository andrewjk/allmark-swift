import Foundation

/// Alerts, also sometimes known as callouts or admonitions, are a Markdown
/// extension based on the blockquote syntax.
@MainActor
let alertRule = BlockRule(
	name: "alert",
	testStart: testAlertStart,
	testContinue: testAlertContinue,
	closeNode: closeAlert
)

let alertRegex = try! NSRegularExpression(
	pattern: "^\\s*\\[!(note|tip|important|warning|caution)]",
	options: [.caseInsensitive]
)

func hasAlertMarkup(char: Character, state: BlockParserState) -> Bool {
	return state.indent <= 3 && char == ">"
}

@MainActor
func testAlertStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if hasAlertMarkup(char: char, state: state) {
		let tail = String(src[src.index(src.startIndex, offsetBy: state.i + 1)...])
		let range = NSRange(location: 0, length: tail.utf16.count)
		
		if let match = alertRegex.firstMatch(in: tail, options: [], range: range) {
			var closedNode: MarkdownNode? = nil
			var currentParent = parent
			
			if currentParent.type == "paragraph" {
				closedNode = state.openNodes.popLast()
				currentParent = state.openNodes.last!
			}
			
			if closedNode != nil {
				closeNode(state: &state, node: closedNode!)
			}
			
			let alertTypeRange = match.range(at: 1)
			let alertType = (tail as NSString).substring(with: alertTypeRange).lowercased()
			
			let quoteIndent = state.indent + 1
			let quote = MarkdownNode(
				type: "alert",
				block: true,
				index: state.i,
				line: state.line,
				column: 1,
				markup: alertType,
				indent: quoteIndent,
				children: []
			)
			
			currentParent.children!.append(quote)
			state.openNodes.append(quote)
			
			state.i = getEndOfLine(state: &state)
			
			return true
		}
	}
	
	return false
}

func testAlertContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if hasAlertMarkup(char: char, state: state) {
		movePastMarker(markerLength: 1, state: &state)
		return true
	}
	
	if state.hasBlankLine {
		return false
	}
	
	let openNode = state.openNodes.last!
	if openNode.type == "paragraph" {
		state.maybeContinue = true
		node.maybeContinuing = true
		return true
	}
	
	return false
}

func closeAlert(state: inout BlockParserState, node: MarkdownNode) {
	if state.hasBlankLine && node.children != nil && !node.children!.isEmpty {
		let lastChild = node.children![node.children!.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
}

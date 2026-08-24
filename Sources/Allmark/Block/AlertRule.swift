import Foundation

/// Alerts, also sometimes known as callouts or admonitions, are a Markdown
/// extension based on the blockquote syntax.

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

func hasAlertMarkup(char: UInt8, state: BlockParserState) -> Bool {
	return state.indent <= 3 && char == ANGLE_RIGHT_CODE
}

func testAlertStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine _: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if hasAlertMarkup(char: char, state: state) {
		let tail = charToString(src, from: state.i + 1, to: min(src.count, state.i + 1 + 64))
		let range = NSRange(location: 0, length: tail.utf16.count)

		if let match = alertRegex.firstMatch(in: tail, options: [], range: range) {
			let currentParent = parent

			let alertTypeRange = match.range(at: 1)
			let alertType = (tail as NSString).substring(with: alertTypeRange).lowercased()

			let quoteIndent = state.indent + 1
			let quote = newBlock(
				type: "alert",
				index: state.i,
				line: state.line,
				markup: alertType,
				indent: quoteIndent
			)

			currentParent.children.append(quote)
			state.openNodes.append(quote)

			return true
		}
	}

	return false
}

func testAlertContinue(state: inout BlockParserState, _node _: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if hasAlertMarkup(char: char, state: state) {
		movePastMarker(markerLength: 1, state: &state)
		return true
	}

	if state.hasBlankLine {
		return false
	}

	return false
}

func closeAlert(state: inout BlockParserState, node: MarkdownNode) {
	if state.hasBlankLine, !node.children.isEmpty {
		let lastChild = node.children[node.children.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
}

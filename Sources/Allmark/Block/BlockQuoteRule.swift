import Foundation

/// A block quote marker consists of 0-3 spaces of initial indent, plus (a) the
/// character > together with a following space, or (b) a single character > not
/// followed by a space.
@MainActor
let blockQuoteRule = BlockRule(
	name: "block_quote",
	testStart: testBlockQuoteStart,
	testContinue: testBlockQuoteContinue,
	closeNode: closeBlockQuote
)

func hasBlockQuoteMarkup(char: Character, state: BlockParserState) -> Bool {
	return state.indent <= 3 && char == ">"
}

@MainActor
func testBlockQuoteStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if hasBlockQuoteMarkup(char: char, state: state) {
		var closedNode: MarkdownNode? = nil
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closedNode = state.openNodes.popLast()
			currentParent = state.openNodes.last!
		}
		
		if closedNode != nil {
			closeNode(state: &state, node: closedNode!)
		}
		
		let quoteIndent = state.indent + 1
		let quote = MarkdownNode(
			type: "block_quote",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: String(char),
			indent: quoteIndent,
			children: []
		)
		
		currentParent.children!.append(quote)
		state.openNodes.append(quote)
		
		movePastMarker(markerLength: 1, state: &state)
		
		state.hasBlankLine = false
		parseBlock(state: &state, parent: quote)
		
		return true
	}
	
	return false
}

func testBlockQuoteContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if hasBlockQuoteMarkup(char: char, state: state) {
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

func closeBlockQuote(state: inout BlockParserState, node: MarkdownNode) {
	if state.hasBlankLine && node.children != nil && !node.children!.isEmpty {
		let lastChild = node.children![node.children!.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
}

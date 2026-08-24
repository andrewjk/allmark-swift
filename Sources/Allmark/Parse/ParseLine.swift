import Foundation

/// Parses a single line, handling continuation of open nodes and starting new blocks
/// - Parameter state: The block parser state (modified in place)

func parseLine(state: inout BlockParserState) {
	state.indent = 0
	state.line += 1
	state.lineStart = state.i
	state.maybeContinue = false

	parseIndent(state: &state)

	// Skip document -- it's always going to continue
	for i in 1 ..< state.openNodes.count {
		let node = state.openNodes[i]

		guard let rule = state.rulesMap[node.type] else {
			continue
		}

		if rule.testContinue(&state, node) {
			parseIndent(state: &state)
		} else {
			var j = state.openNodes.count
			while j > i {
				j -= 1
				let openNode = state.openNodes[j]
				closeNode(state: &state, node: openNode)
			}
			state.openNodes.removeSubrange(i...)
			break
		}
	}

	let parent = state.openNodes.last!

	// Get the end of the line
	var endOfLine = state.i
	var nextIndex = state.src.count
	while endOfLine < state.src.count {
		let code = state.src[endOfLine]
		if isNewLine(code: code) {
			nextIndex = endOfLine + newlineLength(state.src, endOfLine)
			break
		}
		endOfLine += 1
	}

	parseBlock(state: &state, parent: parent, endOfLine: endOfLine)

	// NOTE: a rule can move state.i past the next line
	// (e.g. for a HTML block or link reference containing a newline)
	if state.i < nextIndex {
		state.i = nextIndex
		state.lineStart = nextIndex
	}
}

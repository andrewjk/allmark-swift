import Foundation

func _parse(src: String, rules: RuleSet) -> MarkdownNode {
	var document = newBlock(
		type: "document",
		index: 0,
		line: 1,
		markup: "",
		indent: 0
	)

	// Skip empty lines at the start
	var start = 0
	var i = 0
	while i < src.count {
		let charIndex = src.index(src.startIndex, offsetBy: i)
		if !isSpace(code: Int(src[charIndex].asciiValue ?? 0)) {
			break
		} else if isNewLine(char: String(src[charIndex])) {
			start = i + 1
		}
		i += 1
	}

	var state = BlockParserState(
		rules: rules.blocks,
		src: src,
		i: start,
		line: 0,
		lineStart: 0,
		indent: 0,
		openNodes: [document],
		maybeContinue: false,
		hasBlankLine: false,
		refs: [:],
		footnotes: [:]
	)

	while state.i < state.src.count {
		parseLine(state: &state)
	}

	// Close the remaining open nodes
	var j = state.openNodes.count
	while j > 0 {
		j -= 1
		let openNode = state.openNodes[j]
		openNode.length = state.i - openNode.index
		if let rule = state.rules[openNode.type] {
			rule.closeNode(&state, openNode)
		}
	}

	parseBlockInlines(parent: &document, rules: rules.inlines, refs: state.refs, footnotes: state.footnotes)

	return document
}

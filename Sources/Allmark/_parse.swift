import Foundation

func _parse(src: String, rules: RuleSet) -> MarkdownNode {
	var document = newBlock(
		type: "document",
		index: 0,
		line: 1,
		markup: "",
		indent: 0
	)

	let chars = Array(src.utf8)

	// Skip empty lines at the start
	var start = 0
	var i = 0
	while i < chars.count {
		if !isSpace(code: chars[i]) {
			break
		} else if isNewLine(code: chars[i]) {
			start = i + 1
		}
		i += 1
	}

	let rulesMap = Dictionary(uniqueKeysWithValues: rules.blocks.map { ($0.name, $0) })

	var state = BlockParserState(
		rules: rules.blocks,
		rulesMap: rulesMap,
		src: chars,
		i: start,
		line: 0,
		lineStart: 0,
		indent: 0,
		openNodes: [document],
		isEscaped: false,
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
		if let rule = state.rulesMap[openNode.type] {
			rule.closeNode(&state, openNode)
		}
	}

	parseBlockInlines(parent: &document, rules: rules.inlines, refs: state.refs, footnotes: state.footnotes)

	return document
}

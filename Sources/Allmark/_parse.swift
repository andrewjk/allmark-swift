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
	let (lineStart, index) = skipEmptyLines(src: chars, start: 0)
	var start = lineStart

	// Process frontmatter if found (the opening delimiter must be at the
	// start of a line, so indented "---" is not frontmatter)
	var frontmatter: String? = nil
	if start == index, index < chars.count, chars[index] == DASH_CODE {
		frontmatter = extractFrontMatter(&document, chars, index)
		if let fm = frontmatter {
			// Treat whitespace after the frontmatter exactly the same as
			// whitespace at the start of the document.
			start = skipEmptyLines(src: chars, start: index + fm.utf8.count).lineStart
		}
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
		spaces: "",
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

	// Parsing tracks UTF-8 byte offsets; convert them to character offsets for consumers
	normalizeSourcePositions(document: document, src: src)

	if let fm = frontmatter {
		document.info = fm
	}

	return document
}

/// Skips whitespace-only lines starting at `start`, returning the start of the
/// first line containing content and the index of the first non-whitespace
/// character.
private func skipEmptyLines(src: [UInt8], start: Int) -> (lineStart: Int, index: Int) {
	var lineStart = start
	var index = start
	while index < src.count {
		if !isSpace(code: src[index]) {
			break
		} else if isNewLine(code: src[index]) {
			lineStart = index + 1
		}
		index += 1
	}
	return (lineStart, index)
}

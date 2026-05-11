import Foundation

/// An HTML block is a group of lines that is treated as raw HTML.

let htmlBlockRule = BlockRule(
	name: "html_block",
	testStart: testHtmlBlockStart,
	testContinue: testHtmlBlockContinue,
	closeNode: { _, _ in }
)

// Regex patterns for HTML block conditions
nonisolated(unsafe) let htmlRegex1 = /(?i)^<(script|pre|style|textarea)(\s|$|>)/
nonisolated(unsafe) let htmlRegex2 = /(?s)<!--.+?-->/
nonisolated(unsafe) let htmlRegex3 = /(?s)<\?.+?\?>/
nonisolated(unsafe) let htmlRegex4 = /(?s)<![A-Z].+>/
nonisolated(unsafe) let htmlRegex5 = /(?s)<!\[CDATA\[.+?\]\]>/
nonisolated(unsafe) let htmlRegex6 = /(?i)^<\/?(address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|nav|noframes|ol|optgroup|option|p|param|section|source|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul)(\s+|$|>|\/>)/
nonisolated(unsafe) let htmlRegex7 = try! Regex("^(?:\(openTag)|\(closeTag))(?:\\s|$)")

func testHtmlBlockStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if !state.isEscaped && state.indent <= 3 && char == "<" {
		let tail = charToString(src, from: state.i)

		if testHtmlCondition1(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition2(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition3(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition4(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition5(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition6(state: &state, parent: parent, tail: tail) { return true }
		if testHtmlCondition7(state: &state, parent: parent, tail: tail) { return true }
	}

	return false
}

func testHtmlCondition1(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex1) {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let tagName = String(match.output.1).lowercased()
		let closingTag = "</\(tagName)>"

		let start = state.i
		var end = state.i + 1 + tail.distance(from: tail.startIndex, to: match.range.upperBound) + 1

		while end < state.src.count {
			if state.src[end] == "<" {
				if state.src[end + 1] == "/" {
					let nextClosingTag = charToString(state.src, from: end, to: end + closingTag.count).lowercased()
					if nextClosingTag == closingTag {
						state.i = end
						end = getEndOfLine(state: &state)
						break
					}
				}
			}
			end += 1
		}

		let html = newBlock(
			type: "html_block",
			index: start,
			line: state.line,
			markup: "",
			indent: 1
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: end)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = end

		return true
	}

	return false
}

func testHtmlCondition2(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex2) {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let start = state.i
		state.i += tail.distance(from: tail.startIndex, to: match.range.upperBound)
		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: start,
			line: state.line,
			markup: "",
			indent: 2
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: endOfLine)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine

		return true
	}

	return false
}

func testHtmlCondition3(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex3) {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let start = state.i
		state.i += tail.distance(from: tail.startIndex, to: match.range.upperBound)
		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: start,
			line: state.line,
			markup: "",
			indent: 3
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: endOfLine)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine

		return true
	}

	return false
}

func testHtmlCondition4(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex4) {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let start = state.i
		state.i += tail.distance(from: tail.startIndex, to: match.range.upperBound)
		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: start,
			line: state.line,
			markup: "",
			indent: 4
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: endOfLine)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine

		return true
	}

	return false
}

func testHtmlCondition5(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex5) {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let start = state.i
		state.i += tail.distance(from: tail.startIndex, to: match.range.upperBound)
		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: start,
			line: state.line,
			markup: "",
			indent: 5
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: endOfLine)

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine

		return true
	}

	return false
}

func testHtmlCondition6(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if tail.firstMatch(of: htmlRegex6) != nil {
		var currentParent = parent

		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}

		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: state.i,
			line: state.line,
			markup: "",
			indent: 6
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: state.i, to: endOfLine)
		html.acceptsContent = true

		if state.hasBlankLine && !currentParent.children.isEmpty {
			let lastChild = currentParent.children[currentParent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		currentParent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine

		return true
	}

	return false
}

func testHtmlCondition7(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	if let match = tail.firstMatch(of: htmlRegex7) {
		let end = state.i + tail.distance(from: tail.startIndex, to: match.range.upperBound)

		if end < state.src.count && !isNewLine(char: state.src[end - 1]) {
			return false
		}
		for i in state.i ..< end - 1 {
			if isNewLine(char: state.src[i]) {
				return false
			}
		}

		if parent.type == "paragraph" && !parent.blankAfter {
			let content = charToString(state.src, from: state.i, to: end)
			parent.content += content
			state.i = end
			return true
		}

		let endOfLine = getEndOfLine(state: &state)

		let html = newBlock(
			type: "html_block",
			index: state.i,
			line: state.line,
			markup: "",
			indent: 7
		)
		html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: state.i, to: endOfLine)
		html.acceptsContent = true

		if state.hasBlankLine && !parent.children.isEmpty {
			let lastChild = parent.children[parent.children.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}

		parent.children.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		return true
	}

	return false
}

func testHtmlBlockContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	if node.indent == 6 || node.indent == 7 {
		let result = !state.hasBlankLine
		state.hasBlankLine = false
		return result
	}

	return false
}

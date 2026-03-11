import Foundation

/// An HTML block is a group of lines that is treated as raw HTML.
@MainActor
let htmlBlockRule = BlockRule(
	name: "html_block",
	testStart: testHtmlBlockStart,
	testContinue: testHtmlBlockContinue,
	closeNode: { _, _ in }
)

// Regex patterns for HTML block conditions
let htmlRegex1 = try! NSRegularExpression(pattern: "^<(script|pre|style|textarea)(\\s|$|>)", options: [.caseInsensitive])
let htmlRegex2 = try! NSRegularExpression(pattern: "<!--.+?-->", options: [.dotMatchesLineSeparators])
let htmlRegex3 = try! NSRegularExpression(pattern: "<\\?.+?\\?>", options: [.dotMatchesLineSeparators])
let htmlRegex4 = try! NSRegularExpression(pattern: "<![A-Z].+>", options: [.dotMatchesLineSeparators])
let htmlRegex5 = try! NSRegularExpression(pattern: "<!\\[CDATA\\[.+?\\]\\]>", options: [.dotMatchesLineSeparators])
let htmlRegex6 = try! NSRegularExpression(
	pattern: "^</?(address|article|aside|base|basefont|blockquote|body|caption|center|col|colgroup|dd|details|dialog|dir|div|dl|dt|fieldset|figcaption|figure|footer|form|frame|frameset|h1|h2|h3|h4|h5|h6|head|header|hr|html|iframe|legend|li|link|main|menu|menuitem|nav|noframes|ol|optgroup|option|p|param|section|source|summary|table|tbody|td|tfoot|th|thead|title|tr|track|ul)(\\s|\\n|$|>|/>)",
	options: [.caseInsensitive]
)
let htmlRegex7 = try! NSRegularExpression(pattern: "^(?:\(openTag)|\(closeTag))(?:\\s|$)")

@MainActor
func testHtmlBlockStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && char == "<" && !isEscaped(text: src, i: state.i) {
		let tail = String(src[src.index(src.startIndex, offsetBy: state.i)...])
		
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

@MainActor
func testHtmlCondition1(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = htmlRegex1.firstMatch(in: tail, options: [], range: range) {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let tagRange = match.range(at: 1)
		let tagName = (tail as NSString).substring(with: tagRange).lowercased()
		let closingTag = "</\(tagName)>"
		
		let start = state.i
		var end = state.i + 1 + (match.range(at: 0).length) + 1
		
		while end < state.src.count {
			let endIndex = state.src.index(state.src.startIndex, offsetBy: end)
			if state.src[endIndex] == "<" {
				let nextIndex = state.src.index(state.src.startIndex, offsetBy: end + 1)
				if state.src[nextIndex] == "/" {
					let tagStart = state.src.index(state.src.startIndex, offsetBy: end)
					let tagEnd = state.src.index(state.src.startIndex, offsetBy: end + closingTag.count)
					let nextClosingTag = String(state.src[tagStart..<tagEnd]).lowercased()
					if nextClosingTag == closingTag {
						state.i = end
						end = getEndOfLine(state: &state)
						break
					}
				}
			}
			end += 1
		}
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: start,
			line: state.line,
			column: 1,
			markup: "",
			indent: 1,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: start)..<state.src.index(state.src.startIndex, offsetBy: end)])
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = end
		
		return true
	}
	
	return false
}

@MainActor
func testHtmlCondition2(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = htmlRegex2.firstMatch(in: tail, options: [], range: range) {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let start = state.i
		state.i += match.range.length
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: start,
			line: state.line,
			column: 1,
			markup: "",
			indent: 2,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: start)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		
		return true
	}
	
	return false
}

@MainActor
func testHtmlCondition3(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = htmlRegex3.firstMatch(in: tail, options: [], range: range) {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let start = state.i
		state.i += match.range.length
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: start,
			line: state.line,
			column: 1,
			markup: "",
			indent: 3,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: start)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		
		return true
	}
	
	return false
}

@MainActor
func testHtmlCondition4(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = htmlRegex4.firstMatch(in: tail, options: [], range: range) {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let start = state.i
		state.i += match.range.length
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: start,
			line: state.line,
			column: 1,
			markup: "",
			indent: 4,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: start)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		
		return true
	}
	
	return false
}

@MainActor
func testHtmlCondition5(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = htmlRegex5.firstMatch(in: tail, options: [], range: range) {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let start = state.i
		state.i += match.range.length
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: start,
			line: state.line,
			column: 1,
			markup: "",
			indent: 5,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: start)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		
		return true
	}
	
	return false
}

@MainActor
func testHtmlCondition6(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if htmlRegex6.firstMatch(in: tail, options: [], range: range) != nil {
		var currentParent = parent
		
		if currentParent.type == "paragraph" {
			closeNode(state: &state, node: state.openNodes.popLast()!)
			currentParent = state.openNodes.last!
		}
		
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 6,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: state.i)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		html.acceptsContent = true
		
		if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
			let lastChild = currentParent.children![currentParent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		currentParent.children!.append(html)
		state.openNodes.append(html)
		state.i = endOfLine
		
		return true
	}
	
	return false
}

func testHtmlCondition7(state: inout BlockParserState, parent: MarkdownNode, tail: String) -> Bool {
	// Build regex pattern from openTag and closeTag
	let pattern = "^(?:\(openTag)|\(closeTag))(?:\\s|$)"
	let regex = try! NSRegularExpression(pattern: pattern)
	let range = NSRange(location: 0, length: tail.utf16.count)
	
	if let match = regex.firstMatch(in: tail, options: [], range: range) {
		let matchEnd = match.range.location + match.range.length
		let newlineIndex = (tail as NSString).range(of: "\n").location
		
		// Check if tag is complete and on its own line
		let tagRange = match.range(at: 0)
		let tagName = (tail as NSString).substring(with: tagRange).lowercased()
		if (newlineIndex != NSNotFound && newlineIndex < matchEnd - 1) ||
			(state.i + matchEnd < state.src.count && !tagName.hasSuffix("\n")) {
			return false
		}
		
		// All types of HTML blocks except type 7 may interrupt a paragraph
		if parent.type == "paragraph" && !parent.blankAfter {
			let end = state.i + matchEnd
			let content = String(state.src[state.src.index(state.src.startIndex, offsetBy: state.i)..<state.src.index(state.src.startIndex, offsetBy: end)])
			parent.content += content
			state.i = end
			return true
		}
		
		let endOfLine = getEndOfLine(state: &state)
		
		let html = MarkdownNode(
			type: "html_block",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 7,
			children: []
		)
		html.content = String(repeating: " ", count: state.indent) + String(state.src[state.src.index(state.src.startIndex, offsetBy: state.i)..<state.src.index(state.src.startIndex, offsetBy: endOfLine)])
		html.acceptsContent = true
		
		if state.hasBlankLine && parent.children != nil && !parent.children!.isEmpty {
			let lastChild = parent.children![parent.children!.count - 1]
			lastChild.blankAfter = true
			state.hasBlankLine = false
		}
		
		parent.children!.append(html)
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

import Foundation

/// An HTML block is a group of lines that is treated as raw HTML.

let htmlBlockRule = BlockRule(
	name: "html_block",
	testStart: testHtmlBlockStart,
	testContinue: testHtmlBlockContinue,
	closeNode: { _, _ in }
)

// Regex pattern for HTML block condition 7 (complete tags), run on a bounded tail
nonisolated(unsafe) let htmlRegex7 = try! Regex("^(?:\(openTag)|\(closeTag))(?:\\r?\\n|\\r|\\s|$)")

private let htmlBlockTags1 = ["script", "pre", "style", "textarea"]

private let htmlBlockTags6 = [
	"address", "article", "aside", "base", "basefont", "blockquote", "body", "caption",
	"center", "col", "colgroup", "dd", "details", "dialog", "dir", "div", "dl", "dt",
	"fieldset", "figcaption", "figure", "footer", "form", "frame", "frameset", "h1", "h2",
	"h3", "h4", "h5", "h6", "head", "header", "hr", "html", "iframe", "legend", "li",
	"link", "main", "menu", "menuitem", "nav", "noframes", "ol", "optgroup", "option",
	"p", "param", "section", "source", "summary", "table", "tbody", "td", "tfoot", "th",
	"thead", "title", "tr", "track", "ul",
]

@inlinable func lowerAsciiByte(_ byte: UInt8) -> UInt8 {
	return (byte >= 65 && byte <= 90) ? byte + 32 : byte
}

/// Case-insensitive ASCII literal match at `from`.
@inlinable func matchesLiteralCI(_ src: [UInt8], _ from: Int, _ literal: String) -> Bool {
	var i = from
	for byte in literal.utf8 {
		guard i < src.count else { return false }
		if lowerAsciiByte(src[i]) != byte {
			return false
		}
		i += 1
	}
	return true
}

/// Case-sensitive ASCII literal match at `from`.
@inlinable func matchesLiteral(_ src: [UInt8], _ from: Int, _ literal: String) -> Bool {
	var i = from
	for byte in literal.utf8 {
		guard i < src.count else { return false }
		if src[i] != byte {
			return false
		}
		i += 1
	}
	return true
}

@inlinable func isHtmlWhitespace(_ byte: UInt8) -> Bool {
	return byte == SPACE_CODE || byte == TAB_CODE || byte == NEW_LINE_CODE || byte == CARRIAGE_RETURN_CODE || byte == 0x0B || byte == 0x0C
}

/// Finds the first occurrence of `marker` at or after `from`, then the first
/// occurrence of `closer` strictly after it (at least one character between).
/// Returns the length in bytes from `from` to just past `closer`, or nil.
private func findMarkerAndCloser(_ src: [UInt8], _ from: Int, _ marker: String, _ closer: String) -> Int? {
	let markerBytes = Array(marker.utf8)
	let closerBytes = Array(closer.utf8)
	let m = markerBytes.count
	let c = closerBytes.count
	let markerFirst = markerBytes[0]
	let closerFirst = closerBytes[0]
	var i = from
	while i + m <= src.count {
		if src[i] == markerFirst, matchesLiteral(src, i, marker) {
			var j = i + m + 1
			while j + c <= src.count {
				if src[j] == closerFirst, matchesLiteral(src, j, closer) {
					return j + c - from
				}
				j += 1
			}
			return nil
		}
		i += 1
	}
	return nil
}

func addHtmlBlock(state: inout BlockParserState, parent: MarkdownNode, start: Int, end: Int, type: Int) {
	let html = newBlock(type: "html_block", index: start, line: state.line, markup: "", indent: type)
	html.content = String(repeating: " ", count: state.indent) + charToString(state.src, from: start, to: end)
	html.acceptsContent = (type == 6 || type == 7)
	if html.acceptsContent, state.hasBlankLine, !parent.children.isEmpty {
		let lastChild = parent.children[parent.children.count - 1]
		lastChild.blankAfter = true
		state.hasBlankLine = false
	}
	parent.children.append(html)
	state.openNodes.append(html)
	state.i = end
}

func testHtmlBlockStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine _: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if !state.isEscaped && state.indent <= 3 && char == ANGLE_LEFT_CODE {
		if testHtmlCondition1(state: &state, parent: parent) {
			return true
		}
		if testHtmlCondition2to5(state: &state, parent: parent) {
			return true
		}
		if testHtmlCondition6(state: &state, parent: parent) {
			return true
		}
		if testHtmlCondition7(state: &state, parent: parent) {
			return true
		}
	}

	return false
}

func testHtmlCondition1(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let src = state.src
	let i = state.i
	guard src[i] == ANGLE_LEFT_CODE, i + 1 < src.count else { return false }

	var tagName: String?
	for tag in htmlBlockTags1 {
		if matchesLiteralCI(src, i + 1, tag) {
			let next = i + 1 + tag.utf8.count
			if next >= src.count || isHtmlWhitespace(src[next]) || src[next] == ANGLE_RIGHT_CODE {
				tagName = tag
				break
			}
		}
	}

	guard let tag = tagName else { return false }

	let start = state.i
	// The full match is `<tag` plus either the trailing `\s`/`>` character or the
	// end of input, so the end offset matches the original regex arithmetic.
	let matchLen = 1 + tag.utf8.count + (i + 1 + tag.utf8.count < src.count ? 1 : 0)
	var end = state.i + 1 + matchLen + 1

	let closingTag = "</\(tag)>"
	let closingCount = closingTag.utf8.count

	while end < src.count {
		if src[end] == ANGLE_LEFT_CODE, end + 1 < src.count, src[end + 1] == SLASH_CODE {
			let nextClosingTag = charToString(src, from: end, to: end + closingCount).lowercased()
			if nextClosingTag == closingTag {
				state.i = end
				end = getEndOfLine(state: &state)
				break
			}
		}
		end += 1
	}

	addHtmlBlock(state: &state, parent: parent, start: start, end: end, type: 1)

	return true
}

func testHtmlCondition2to5(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let src = state.src
	let i = state.i

	// Condition 2: <!--.+?-->
	if let len = findMarkerAndCloser(src, i, "<!--", "-->") {
		handleCondition2to5(state: &state, parent: parent, matchLen: len)
		return true
	}

	// Condition 3: <?.+?>
	if let len = findMarkerAndCloser(src, i, "<?", "?>") {
		handleCondition2to5(state: &state, parent: parent, matchLen: len)
		return true
	}

	// Condition 4: <![A-Z].+>  (greedy .+ matches to the last '>')
	var p = i
	var foundDecl = false
	while p + 3 < src.count {
		if src[p] == ANGLE_LEFT_CODE, src[p + 1] == EXCLAMATION_CODE, src[p + 2] >= 65 && src[p + 2] <= 90 {
			foundDecl = true
			break
		}
		p += 1
	}
	if foundDecl {
		var lastGreater = -1
		var j = p + 3
		while j < src.count {
			if src[j] == ANGLE_RIGHT_CODE {
				lastGreater = j
			}
			j += 1
		}
		if lastGreater > p + 3 {
			handleCondition2to5(state: &state, parent: parent, matchLen: lastGreater + 1 - i)
			return true
		}
	}

	// Condition 5: <![CDATA[.+?]]>
	if let len = findMarkerAndCloser(src, i, "<![CDATA[", "]]>") {
		handleCondition2to5(state: &state, parent: parent, matchLen: len)
		return true
	}

	return false
}

private func handleCondition2to5(state: inout BlockParserState, parent: MarkdownNode, matchLen: Int) {
	let start = state.i
	state.i += matchLen
	let endOfLine = getEndOfLine(state: &state)

	addHtmlBlock(state: &state, parent: parent, start: start, end: endOfLine, type: 2)
}

func testHtmlCondition6(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let src = state.src
	let i = state.i

	// Match ^(?i)<\/?(address|...)(\s+|$|>|\/>)
	let hasClose = i + 1 < src.count && src[i + 1] == SLASH_CODE
	let tagStart = i + (hasClose ? 2 : 1)
	guard tagStart < src.count else { return false }

	var matched = false
	for tag in htmlBlockTags6 {
		if matchesLiteralCI(src, tagStart, tag) {
			let next = tagStart + tag.utf8.count
			if next >= src.count {
				matched = true
			} else {
				let c = src[next]
				if isHtmlWhitespace(c) || c == ANGLE_RIGHT_CODE {
					matched = true
				} else if c == SLASH_CODE, next + 1 < src.count, src[next + 1] == ANGLE_RIGHT_CODE {
					matched = true
				}
			}
			if matched {
				break
			}
		}
	}

	guard matched else { return false }

	var currentParent = parent

	if currentParent.type == "paragraph" {
		closeNode(state: &state, node: state.openNodes.popLast()!)
		currentParent = state.openNodes.last!
	}

	let endOfLine = getEndOfLine(state: &state)

	addHtmlBlock(state: &state, parent: currentParent, start: state.i, end: endOfLine, type: 6)

	return true
}

func testHtmlCondition7(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	let tail = charToString(state.src, from: state.i)
	if let match = tail.firstMatch(of: htmlRegex7) {
		let matchLength = String(tail[..<match.range.upperBound]).utf8.count
		var end = state.i + matchLength
		let matchStr = charToString(state.src, from: state.i, to: state.i + matchLength)
		if matchStr.hasSuffix("\r\n") {
			end -= 2
		} else {
			end -= 1
		}

		for i in state.i ..< end {
			if isNewLine(code: state.src[i]) {
				return false
			}
		}

		if parent.type == "paragraph" && !parent.blankAfter {
			let contentEnd = state.i + matchLength
			let content = charToString(state.src, from: state.i, to: contentEnd)
			parent.content += content
			state.i = contentEnd
			return true
		}

		let endOfLine = getEndOfLine(state: &state)

		addHtmlBlock(state: &state, parent: parent, start: state.i, end: endOfLine, type: 7)

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

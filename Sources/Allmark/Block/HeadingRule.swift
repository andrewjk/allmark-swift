import Foundation

/// An ATX heading consists of a string of characters, parsed as inline content,
/// between an opening sequence of 1-6 unescaped # characters and an optional
/// closing sequence of any number of unescaped # characters.

let headingRule = BlockRule(
	name: "heading",
	testStart: testHeadingStart,
	testContinue: testHeadingContinue,
	closeNode: { _, _ in }
)

func testHeadingStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if !state.isEscaped && state.indent <= 3 && char == 0x23 /* # */ {
		var level = 1
		var j = state.i + 1

		while j < src.count {
			if src[j] == 0x23 /* # */ {
				level += 1
			} else {
				break
			}
			j += 1
		}

		if level < 7 && state.i + level < src.count {
			if isSpace(code: src[state.i + level]) {
				var closedNode: MarkdownNode? = nil
				var currentParent = parent

				if currentParent.type == "paragraph" {
					closedNode = state.openNodes.popLast()
					currentParent = state.openNodes.last!
				}

				if closedNode != nil {
					closeNode(state: &state, node: closedNode!)
				}

				let heading = newBlock(
					type: "heading",
					index: state.i,
					line: state.line,
					markup: String(repeating: "#", count: level),
					indent: 0
				)

				if state.hasBlankLine && !currentParent.children.isEmpty {
					let lastChild = currentParent.children[currentParent.children.count - 1]
					lastChild.blankAfter = true
					state.hasBlankLine = false
				}

				currentParent.children.append(heading)

				movePastMarker(markerLength: level, state: &state)
				let endOfLine = getEndOfLine(state: &state)
				var end = endOfLine - 1

				while end >= state.i {
					if !isSpace(code: src[end]) {
						break
					}
					end -= 1
				}

				while end >= state.i {
					if src[end] != 0x23 /* # */ {
						if src[end] == 0x5C /* \ */ || !isSpace(code: src[end]) {
							end = endOfLine - 1
						}
						break
					}
					end -= 1
				}
				end += 1

				let content = newBlock(
					type: "heading_content",
					index: state.i,
					line: state.line,
					markup: "",
					indent: 0
				)
				content.content = charToString(src, from: state.i, to: end)
				heading.children = [content]

				if end < endOfLine {
					heading.info = charToString(src, from: end, to: endOfLine)
				}

				state.i = endOfLine
				heading.length = state.i - heading.index
				content.length = state.i - content.index

				return true
			}
		}
	}

	return false
}

func testHeadingContinue(state _: inout BlockParserState, node _: MarkdownNode) -> Bool {
	return false
}

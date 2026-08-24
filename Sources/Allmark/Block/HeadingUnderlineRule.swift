import Foundation

/// A setext heading consists of one or more lines of text, each containing at
/// least one non-whitespace character, with no more than 3 spaces indentation,
/// followed by a setext heading underline.

let headingUnderlineRule = BlockRule(
	name: "heading_underline",
	testStart: testHeadingUnderlineStart,
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

let headingUnderlineContentPattern = try! NSRegularExpression(pattern: "[^\\s]")

func testHeadingUnderlineStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine _: Int) -> Bool {
	if state.maybeContinue {
		var i = state.openNodes.count - 1
		while i > 0 {
			let node = state.openNodes[i]
			if node.maybeContinuing {
				return false
			}
			i -= 1
		}
	}

	let src = state.src
	if state.i >= src.count {
		return false
	}

	let char = src[state.i]

	if state.indent <= 3 && (char == EQUALS_CODE || char == DASH_CODE) {
		var matched = 1
		var end = state.i + 1

		while end < src.count {
			let nextChar = src[end]

			if nextChar == char {
				// The setext heading underline cannot contain internal spaces
				if matched > 0 && end > 0 {
					if isSpace(code: src[end - 1]) {
						return false
					}
				}
				matched += 1
			} else if isNewLine(code: nextChar) {
				end += 1
				break
			} else if isSpace(code: nextChar) {
				// continue
			} else {
				return false
			}
			end += 1
		}

		// NOTE: We break from the spec here and require at least two underline
		// chars to prevent things from jumping around when typing a list under
		// a paragraph
		if matched < 2 {
			return false
		}

		let contentRange = NSRange(location: 0, length: parent.content.utf16.count)
		let haveParagraph = parent.type == "paragraph" && !parent.blankAfter && headingUnderlineContentPattern.firstMatch(in: parent.content, options: [], range: contentRange) != nil

		if haveParagraph {
			parent.type = "heading_underline"
			parent.markup = charToString(src, from: state.i, to: end)
			parent.length = end - parent.index
			return true
		}
	}

	return false
}

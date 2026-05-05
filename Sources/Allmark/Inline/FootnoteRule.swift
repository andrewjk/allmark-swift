import Foundation

let footnoteRule = InlineRule(
	name: "footnote",
	test: testFootnote
)

func testFootnote(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }

	let char = src[state.i]

	if !state.isEscaped {
		if char == "[" {
			return testFootnoteOpen(state: &state, parent: &parent)
		}

		if char == "]" {
			return testFootnoteClose(state: &state, parent: &parent)
		}
	}

	return false
}

func testFootnoteOpen(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	let start = state.i

	// Check for [^ pattern which indicates a footnote reference
	if start + 1 >= src.count {
		return false
	}

	if src[start + 1] != "^" {
		return false
	}

	let markup = "[^"

	// Add a new text node which may turn into a footnote
	let text = newText(
		index: state.parentIndex + start,
		line: state.line,
		content: markup,
		indent: 0
	)
	parent.children.append(text)

	state.i += 2
	state.delimiters.append(Delimiter(markup: markup, start: start, length: 2, handled: nil))

	return true
}

func testFootnoteClose(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	// Find the matching footnote delimiter
	var startDelimiter: Delimiter?
	var startIndex = -1
	var i = state.delimiters.count - 1
	while i >= 0 {
		let prevDelimiter = state.delimiters[i]
		if prevDelimiter.handled != true {
			if prevDelimiter.markup == "[^" {
				startDelimiter = prevDelimiter
				startIndex = i
				break
			}
		}
		i -= 1
	}

	if let startDel = startDelimiter {
		// Convert the text node into a footnote node
		var i = parent.children.count - 1
		while i >= 0 {
			let lastNode = parent.children[i]
			if lastNode.index == state.parentIndex + startDel.start {
				let labelStart = startDel.start + startDel.markup.count
				let src = state.src
				var label = charToString(src, from: labelStart, to: state.i)

				// No special characters
				if label.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil {
					return false
				}

				// Check for balanced brackets
				var level = 0
				var labelIndex = 0
				while labelIndex < label.count {
					let charIndex = label.index(label.startIndex, offsetBy: labelIndex)
					if label[charIndex] == "\\" {
						labelIndex += 1
					} else if label[charIndex] == "[" {
						level += 1
					} else if label[charIndex] == "]" {
						level -= 1
					}
					labelIndex += 1
				}
				if level != 0 {
					return false
				}

				// Swallow anything in brackets afterwards
				// Unless it's a link reference, in which case it should be treated as a link instead
				if state.i + 1 < src.count {
					if src[state.i + 1] == "[" {
						let linkStart = state.i + 2
						for i in linkStart ..< src.count {
							if src[i] == "]" {
								var linkRef = charToString(src, from: linkStart, to: i)
								linkRef = normalizeLabel(text: linkRef)
								if state.refs[linkRef] != nil {
									// Change delimiter to [ for link processing
									if var del = startDelimiter {
										del.markup = "["
										state.delimiters[startIndex] = del
									}
									return false
								}
								state.i = i
								break
							}
						}
					}
				}

				// Normalize the label and look it up
				label = normalizeLabel(text: label)

				if let footnote = state.footnotes[label] {
					state.i += 1

					if var del = startDelimiter {
						del.handled = true
						state.delimiters[startIndex] = del
					}

					// Create the footnote reference node with parsed children
					lastNode.type = "footnote"
					lastNode.info = label
					lastNode.markup = "[^\(label)]"
					lastNode.length = state.parentIndex + state.i - lastNode.index
					lastNode.children = footnote.content.children
					parent.children[i] = lastNode

					// Parse the footnote content for inline elements
					var tempState = InlineParserState(
						rules: state.rules,
						src: Array(footnote.content.content),
						i: 0,
						line: lastNode.line,
						lineStart: 0,
						indent: 0,
						isEscaped: false,
						delimiters: [],
						refs: state.refs,
						footnotes: state.footnotes,
						parentIndex: lastNode.index
					)
					parseInline(state: &tempState, parent: lastNode)

					return true
				}

				if var del = startDelimiter {
					del.handled = true
					state.delimiters[startIndex] = del
				}
				break
			}
			i -= 1
		}
	}

	return false
}

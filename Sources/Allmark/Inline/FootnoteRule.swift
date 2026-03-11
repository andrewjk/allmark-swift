import Foundation

@MainActor
let footnoteRule = InlineRule(
	name: "footnote",
	test: testFootnote
)

@MainActor
func testFootnote(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if !isEscaped(text: src, i: state.i) {
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
	
	let nextIndex = src.index(src.startIndex, offsetBy: start + 1)
	if src[nextIndex] != "^" {
		return false
	}
	
	let markup = "[^"
	
	// Add a new text node which may turn into a footnote
	let text = MarkdownNode(
		type: "text",
		block: false,
		index: start,
		line: state.line,
		column: 1,
		markup: markup,
		indent: 0,
		children: nil
	)
	parent.children?.append(text)
	
	state.i += 2
	state.delimiters.append(Delimiter(markup: markup, start: start, length: 2, handled: nil))
	
	return true
}

@MainActor
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
		var i = (parent.children?.count ?? 0) - 1
		while i >= 0 {
			if let lastNode = parent.children?[i], lastNode.index == startDel.start {
				let labelStart = startDel.start + startDel.markup.count
				let src = state.src
				let labelEndIndex = src.index(src.startIndex, offsetBy: state.i)
				let labelStartIndex = src.index(src.startIndex, offsetBy: labelStart)
				var label = String(src[labelStartIndex..<labelEndIndex])
				
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
					let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
					if src[nextIndex] == "[" {
						let linkStart = state.i + 2
						for i in linkStart..<src.count {
							let iIndex = src.index(src.startIndex, offsetBy: i)
							if src[iIndex] == "]" {
								let linkStartIndex = src.index(src.startIndex, offsetBy: linkStart)
								var linkRef = String(src[linkStartIndex..<iIndex])
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
					lastNode.children = footnote.content.children
					parent.children?[i] = lastNode
					
					// Parse the footnote content for inline elements
					var tempState = InlineParserState(
						rules: state.rules,
                        src: lastNode.content.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression),
						i: 0,
						line: lastNode.line,
						lineStart: 0,
						indent: 0,
						delimiters: [],
						refs: state.refs,
						footnotes: state.footnotes,
						debug: nil
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

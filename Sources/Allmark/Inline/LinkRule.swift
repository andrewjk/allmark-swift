import Foundation

@MainActor
let linkRule = InlineRule(
	name: "link",
	test: testLink
)

func testLink(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if !isEscaped(text: src, i: state.i) {
		if char == "[" {
			return testLinkOpen(state: &state, parent: &parent)
		}
		
		if char == "!" && state.i + 1 < src.count {
			let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
			if src[nextIndex] == "[" {
				return testImageOpen(state: &state, parent: &parent)
			}
		}
		
		if char == "]" {
			return testLinkClose(state: &state, parent: &parent)
		}
	}
	
	return false
}

func testLinkOpen(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let start = state.i
	let markup = "["
	
	// Add a new text node which may turn into a link
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
	
	state.i += 1
	state.delimiters.append(Delimiter(markup: markup, start: start, length: 1, handled: nil))
	
	return true
}

func testImageOpen(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let start = state.i
	let markup = "!["
	
	// Add a new text node which may turn into an image
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
	
	state.i += markup.count
	state.delimiters.append(Delimiter(markup: markup, start: start, length: 1, handled: nil))
	
	return true
}

func testLinkClose(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let markup = "]"
	
	// TODO: Standardize precedence
	var startDelimiter: Delimiter?
	var startIndex = -1
	var i = state.delimiters.count - 1
	while i >= 0 {
		let prevDelimiter = state.delimiters[i]
		if prevDelimiter.handled != true {
			if prevDelimiter.markup == "[" || prevDelimiter.markup == "![" {
				startDelimiter = prevDelimiter
				startIndex = i
				break
			} else if prevDelimiter.markup == "*" || prevDelimiter.markup == "_" {
				i -= 1
				continue
			} else {
				break
			}
		}
		i -= 1
	}
	
	if let startDel = startDelimiter {
		// Convert the text node into a link node with a new text child
		// followed by the other children of the parent (if any)
		var i = (parent.children?.count ?? 0) - 1
		while i >= 0 {
			if let lastNode = parent.children?[i], lastNode.index == startDel.start {
				var start = state.i + 1
				let src = state.src
				let labelStart = startDel.start + startDel.markup.count
				let labelEndIndex = src.index(src.startIndex, offsetBy: state.i)
				let labelStartIndex = src.index(src.startIndex, offsetBy: labelStart)
				var label = String(src[labelStartIndex..<labelEndIndex])
				
				// "The link text may contain balanced brackets, but not
				// unbalanced ones, unless they are escaped"
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
				
				let isLink = startDel.markup == "["
				
				let hasInfo = state.i + 1 < src.count && src[src.index(src.startIndex, offsetBy: state.i + 1)] == "("
				let hasRef = state.i + 1 < src.count && src[src.index(src.startIndex, offsetBy: state.i + 1)] == "["
				
				// "Full and compact references take precedence over shortcut references"
				// "Inline links also take precedence"
				var link: LinkReference?
				if hasInfo {
					start += 1
					link = parseLinkInline(state: &state, start: start, _end: ")")
				} else if hasRef {
					start += 1
					for i in start..<src.count {
						let iIndex = src.index(src.startIndex, offsetBy: i)
						if src[iIndex] == "]" {
							// Lookup using the text between the [], or if there
							// is no text, use the label
							label = i - start > 0 ? String(src[src.index(src.startIndex, offsetBy: start)..<iIndex]) : label
							label = normalizeLabel(text: label)
							link = state.refs[label]
							if link != nil {
								state.i = i + 1
							}
							break
						}
					}
				}
				
				if link == nil {
					label = normalizeLabel(text: label)
					link = state.refs[label]
					if link != nil {
						state.i += 1
					}
				}
				
				if let foundLink = link {
					let text = MarkdownNode(
						type: "text",
						block: false,
						index: lastNode.index,
						line: lastNode.line,
						column: 1,
						markup: markup,
						indent: 0,
						children: nil
					)
					text.markup = String(lastNode.markup.dropFirst(startDel.markup.count))
					
					lastNode.type = isLink ? "link" : "image"
					lastNode.info = foundLink.url
					lastNode.title = foundLink.title
					
					let movedNodes = Array(parent.children?.suffix(from: i + 1) ?? [])
					if let childCount = parent.children?.count {
						parent.children?.removeSubrange((i + 1)..<childCount)
					}
					lastNode.children = [text] + movedNodes
					parent.children?[i] = lastNode
					
					// "[L]inks may not contain other links, at any level of nesting"
					if isLink {
						// Remove all the opening delimiters so they won't be picked up in future
						var d = state.delimiters.count - 1
						while d >= 0 {
							var prevDelimiter = state.delimiters[d]
							if prevDelimiter.markup == "[" || prevDelimiter.markup == "]" {
								prevDelimiter.handled = true
								state.delimiters[d] = prevDelimiter
							}
							d -= 1
						}
					}
					
					if var del = startDelimiter {
						del.handled = true
						state.delimiters[startIndex] = del
					}
					return true
				}
				
				// TODO: If it's not a link, go back and close delimiters that
				// weren't closed between the start and end
				
				if var del = startDelimiter {
					del.handled = true
					state.delimiters[startIndex] = del
				}
				return true
			}
			i -= 1
		}
	}
	
	return false
}

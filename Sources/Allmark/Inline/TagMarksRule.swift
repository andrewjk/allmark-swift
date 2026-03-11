import Foundation

func testTagMarks(
	name: String,
	char: String,
	state: inout InlineParserState,
	parent: inout MarkdownNode
) -> Bool {
	let src = state.src
	let start = state.i
	var end = state.i
	
	// Get the markup
	var markup = char
	for i in (state.i + 1)..<src.count {
		let iIndex = src.index(src.startIndex, offsetBy: i)
		if String(src[iIndex]) == char {
			markup.append(char)
			end += 1
		} else {
			break
		}
	}
	
	// "Three or more tildes do not create a strikethrough"
	if markup.count < 3 {
		// TODO: Better space checks including start/end of line
		let codeBefore = start > 0 ? src.unicodeScalars[src.index(src.startIndex, offsetBy: start - 1)].value : 0
		let spaceBefore = start == 0 || isUnicodeSpace(code: codeBefore)
		let punctuationBefore = !spaceBefore && isUnicodePunctuation(code: codeBefore)
		
		let codeAfter = end + 1 < src.count ? src.unicodeScalars[src.index(src.startIndex, offsetBy: end + 1)].value : 0
		let spaceAfter = end == src.count - 1 || isUnicodeSpace(code: codeAfter)
		let punctuationAfter = !spaceAfter && isUnicodePunctuation(code: codeAfter)
		
		// "A left-flanking delimiter run is a delimiter run that is (1) not
		// followed by Unicode whitespace, and either (2a) not followed by a
		// punctuation character, or (2b) followed by a punctuation character
		// and preceded by Unicode whitespace or a punctuation character. For
		// purposes of this definition, the beginning and the end of the line
		// count as Unicode whitespace."
		let leftFlanking =
			!spaceAfter &&
			(!punctuationAfter || (punctuationAfter && (spaceBefore || punctuationBefore)))
		
		// "A right-flanking delimiter run is a delimiter run that is (1) not
		// preceded by Unicode whitespace, and either (2a) not preceded by a
		// punctuation character, or (2b) preceded by a punctuation character
		// and followed by Unicode whitespace or a punctuation character. For
		// purposes of this definition, the beginning and the end of the line
		// count as Unicode whitespace"
		let rightFlanking =
			!spaceBefore &&
			(!punctuationBefore || (punctuationBefore && (spaceAfter || punctuationAfter)))
		
		if rightFlanking {
			// TODO: Precedence
			// Loop backwards through delimiters to find a matching one that does
			// not take precedence
			var startDelimiter: Delimiter?
			var i = state.delimiters.count - 1
			while i >= 0 {
				let prevDelimiter = state.delimiters[i]
				if prevDelimiter.handled != true {
					if prevDelimiter.markup == char && prevDelimiter.length == markup.count {
						startDelimiter = prevDelimiter
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
			
			// Check if it's a closing delimiter
			if let startDel = startDelimiter {
				// Convert the text node into a delimited node with a new text
				// child followed by the other children of the parent (if any)
				var i = (parent.children?.count ?? 0) - 1
				while i >= 0 {
					if let lastNode = parent.children?[i], lastNode.index == startDel.start {
						let text = MarkdownNode(
							type: "text",
							block: false,
							index: lastNode.index,
							line: lastNode.line,
							column: 1,
							markup: char,
							indent: 0,
							children: nil
						)
						text.markup = String(lastNode.markup.dropFirst(startDel.length))
						
						lastNode.type = name
						lastNode.markup = markup
						
						let movedNodes = Array(parent.children?.suffix(from: i + 1) ?? [])
						if let childCount = parent.children?.count {
							parent.children?.removeSubrange((i + 1)..<childCount)
						}
						lastNode.children = [text] + movedNodes
						parent.children?[i] = lastNode
						
						state.i += markup.count
						
						// Update delimiter as handled
						for j in 0..<state.delimiters.count {
							if state.delimiters[j].start == startDel.start {
								var del = state.delimiters[j]
								del.handled = true
								state.delimiters[j] = del
								break
							}
						}
						
						return true
					}
					i -= 1
				}
			}
		}
		
		if leftFlanking {
			// Add a new text node which may turn into a delimiter
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
			state.delimiters.append(Delimiter(markup: char, start: start, length: markup.count, handled: nil))
			
			return true
		}
	}
	
	addMarkupAsText(markup: markup, state: &state, parent: &parent)
	
	return true
}

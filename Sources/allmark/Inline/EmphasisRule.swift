import Foundation

@MainActor
let emphasisRule = InlineRule(
	name: "emphasis",
	test: testEmphasis
)

func testEmphasis(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if (char == "*" || char == "_") && !isEscaped(text: src, i: state.i) {
		let start = state.i
		var end = state.i
		
		// Get the markup
		var markup = String(char)
		for i in (start + 1)..<src.count {
			let iIndex = src.index(src.startIndex, offsetBy: i)
			if src[iIndex] == char {
				markup.append(char)
				end += 1
			} else {
				break
			}
		}
		
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
		
		// TODO: Precedence
		// Loop backwards through delimiters to find a matching one that does
		// not take precedence, and ideally has the same length
		var startDelimiter: Delimiter?
		var startIndex = -1
		var i = state.delimiters.count - 1
		while i >= 0 {
			let prevDelimiter = state.delimiters[i]
			if prevDelimiter.handled != true {
				if prevDelimiter.markup == String(char) {
					if prevDelimiter.length == markup.count {
						startDelimiter = prevDelimiter
						startIndex = i
						break
					} else if startDelimiter == nil {
						startDelimiter = prevDelimiter
						startIndex = i
					}
				} else if prevDelimiter.markup == "*" || prevDelimiter.markup == "_" {
					i -= 1
					continue
				} else {
					break
				}
			}
			i -= 1
		}
		
		// Check if it's a closing emphasis
		if let startDel = startDelimiter {
			let canClose =
				(rightFlanking ||
					// Check if it's a continuing part of a three-run delimiter
					(state.i > 0 && src[src.index(src.startIndex, offsetBy: state.i - 1)] == char)) &&
				startDel.markup == String(char) &&
				// "Emphasis with _ is not allowed inside words"
				(char != "_" || spaceAfter || punctuationAfter) &&
				// "[A] delimiter that can both open and close ... cannot form
				// emphasis if the sum of the lengths of the delimiter runs
				// containing the opening and closing delimiters is a multiple
				// of 3 unless both lengths are multiples of 3."
				(!leftFlanking ||
					(markup.count + startDel.length) % 3 != 0 ||
					(markup.count % 3 == 0 && startDel.length % 3 == 0))
			
			if canClose {
				// Convert the text node into an emphasis node with a new text child
				// followed by the other children of the parent (if any)
				var i = (parent.children?.count ?? 0) - 1
				while i >= 0 {
					if let lastNode = parent.children?[i], lastNode.index == startDel.start {
						// If it's longer than the last delimiter, or longer
						// than two, save some for the next go-round
						let useLength = min(startDel.length, 2)
						let useMarkup = String(markup.prefix(useLength))
						
						let text = MarkdownNode(
							type: "text",
							block: false,
							index: lastNode.index,
							line: lastNode.line,
							column: 1,
							markup: String(char),
							indent: 0,
							children: nil
						)
						text.markup = String(lastNode.markup.dropFirst(startDel.length))
						
						let movedNodes = Array(parent.children?.suffix(from: i + 1) ?? [])
						if let childCount = parent.children?.count {
							parent.children?.removeSubrange((i + 1)..<childCount)
						}
						
						if useMarkup.count < startDel.length {
							lastNode.markup = String(lastNode.markup.prefix(startDel.length - useMarkup.count))
							let emphasis = MarkdownNode(
								type: useMarkup.count == 2 ? "strong" : "emphasis",
								block: false,
								index: lastNode.index + useMarkup.count,
								line: lastNode.line,
								column: 1,
								markup: useMarkup,
								indent: 0,
								children: [text] + movedNodes
							)
							parent.children?.append(emphasis)
						} else {
							lastNode.type = useMarkup.count == 2 ? "strong" : "emphasis"
							lastNode.markup = useMarkup
							lastNode.children = [text] + movedNodes
							parent.children?[i] = lastNode
						}
						
						state.i += useMarkup.count
						
						// Mark delimiters between the start and end as handled,
						// as they can't start anything anymore
						var d = state.delimiters.count - 1
						while d >= 0 {
							if d == startIndex {
								break
							}
							var prevDelimiter = state.delimiters[d]
							prevDelimiter.handled = true
							state.delimiters[d] = prevDelimiter
							d -= 1
						}
						
						// Mark the start delimiter handled if all its chars are used up
						var mutableStartDel = startDel
						mutableStartDel.length -= useMarkup.count
						if mutableStartDel.length == 0 {
							mutableStartDel.handled = true
						}
						state.delimiters[startIndex] = mutableStartDel
						
						return true
					}
					i -= 1
				}
			}
		}
		
		// Check if it's an opening emphasis
		let canOpen =
			leftFlanking &&
			// "Emphasis with _ is not allowed inside words"
			(char != "_" || spaceBefore || punctuationBefore)
		
		if canOpen {
			// Add a new text node which may turn into emphasis
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
			state.delimiters.append(Delimiter(markup: String(char), start: start, length: markup.count, handled: nil))
			
			return true
		}
		
		addMarkupAsText(markup: markup, state: &state, parent: &parent)
		return true
	}
	
	return false
}

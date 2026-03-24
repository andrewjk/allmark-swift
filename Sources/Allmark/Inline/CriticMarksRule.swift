import Foundation

func testCriticMarks(
	name: String,
	delimiter: String,
	state: inout InlineParserState,
	parent: inout MarkdownNode,
	closingDelimiter: String? = nil
) -> Bool {
	let closeDel = closingDelimiter ?? delimiter
	let src = state.src
	guard state.i < src.count else { return false }

	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]

	if char == "{" && !isEscaped(text: src, i: state.i) {
		let start = state.i
		var end = state.i

		// Get the markup
		var markup = String(char)
		for i in (start + 1) ..< src.count {
			let iIndex = src.index(src.startIndex, offsetBy: i)
			if src[iIndex] == delimiter.first {
				markup.append(delimiter)
				end += 1
			} else if src[iIndex] == "}" || (closeDel != delimiter && src[iIndex] == closeDel.first) {
				return false
			} else {
				break
			}
		}

		if markup.count == 2 || markup.count == 3 {
			// Add a new text node which may turn into deletion
			let text = MarkdownNode(
				type: "text",
				block: false,
				index: state.parentIndex + start,
				line: state.line,
				column: 1,
				markup: markup,
				indent: 0,
				children: nil
			)
			parent.children?.append(text)

			// Add the start delimiter
			state.i += markup.count
			state.delimiters.append(Delimiter(markup: markup, start: start, length: markup.count, handled: nil))

			return true
		}
	} else if String(char) == closeDel && !isEscaped(text: src, i: state.i) {
		// Get the markup
		var markup = "{" + delimiter
		for i in (state.i + 1) ..< src.count {
			let iIndex = src.index(src.startIndex, offsetBy: i)
			if src[iIndex] == closeDel.first {
				markup.append(delimiter)
			} else if src[iIndex] == "}" {
				break
			} else {
				return false
			}
		}

		if markup.count == 2 || markup.count == 3 {
			// Loop backwards through delimiters to find a matching one that
			// does not take precedence
			var startDelimiter: Delimiter?
			var startIndex = state.delimiters.count - 1
			while startIndex >= 0 {
				let prevDelimiter = state.delimiters[startIndex]
				if prevDelimiter.handled != true && prevDelimiter.markup == markup {
					startDelimiter = prevDelimiter
					break
				}
				startIndex -= 1
			}

			// Check if it's a closing deletion
			if let startDel = startDelimiter {
				// Convert the text node into a deletion node with a new text
				// child followed by the other children of the parent (if any)
				var i = (parent.children?.count ?? 0) - 1
				while i >= 0 {
					if let lastNode = parent.children?[i], lastNode.index == state.parentIndex + startDel.start {
						let newText = String(lastNode.markup.dropFirst(startDel.length))
						let text = MarkdownNode(
							type: "text",
							block: false,
							index: lastNode.index,
							line: lastNode.line,
							column: 1,
							markup: newText,
							indent: 0,
							children: nil
						)

						lastNode.type = name
						lastNode.markup = markup
						lastNode.length = state.parentIndex + state.i - lastNode.index + markup.count
						let movedNodes = Array(parent.children?.suffix(from: i + 1) ?? [])
						lastNode.children = [text] + movedNodes

						// Remove the moved nodes from parent
						if let childCount = parent.children?.count {
							parent.children?.removeSubrange((i + 1) ..< childCount)
						}

						// Replace node
						parent.children?[i] = lastNode

						state.i += markup.count

						if var del = startDelimiter {
							del.handled = true
							state.delimiters[startIndex] = del
						}
						return true
					}
					i -= 1
				}

				// TODO: Precedence!
				// TODO: Should mark all delimiters between the tags as handled...
			}
		}
	}

	return false
}

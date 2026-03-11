import Foundation

/// GFM tables (pipe-delimited)
@MainActor
let tableRule = BlockRule(
	name: "table",
	testStart: testTableStart,
	testContinue: testTableContinue,
	closeNode: { _, _ in }
)

@MainActor
func testTableStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	// We may already have a table
	if let lastNode = parent.children?.last,
	   !state.hasBlankLine,
	   lastNode.type == "table" {
		let endOfLine = getEndOfLine(state: &state)

		guard let headerRow = lastNode.children?.first,
			  let headers = headerRow.children?.map({ $0.info ?? "" }) else {
			return false
		}

		let row = MarkdownNode(
			type: "table_row",
			block: true,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 0,
			children: []
		)
		lastNode.children?.append(row)

		// Get row content, trim it, and remove leading/trailing pipes
		let rowStart = state.src.index(state.src.startIndex, offsetBy: state.i)
		let rowEnd = state.src.index(state.src.startIndex, offsetBy: endOfLine)
		let rowContent = String(state.src[rowStart..<rowEnd])
			.trimmingCharacters(in: .whitespaces)
			.replacingOccurrences(of: "(^\\||\\|$)", with: "", options: .regularExpression)

		// Split by unescaped pipe
		var rowParts = splitByUnescapedPipe(rowContent)
		// Pad with empty strings to match header count
		while rowParts.count < headers.count {
			rowParts.append("")
		}
		rowParts = Array(rowParts.prefix(headers.count))

		var ri = 0
		for text in rowParts {
			let cell = MarkdownNode(
				type: "table_cell",
				block: true,
				index: state.i,
				line: state.line,
				column: 1,
				markup: "",
				indent: 0,
				children: []
			)
			cell.content = (text).trimmingCharacters(in: CharacterSet.whitespaces)
				.replacingOccurrences(of: "\\|", with: "|")
			cell.info = headers[ri]
			row.children?.append(cell)
			ri += 1
		}

		state.i = endOfLine
		return true
	}

	// Check for delimiter row
	// "The delimiter row consists of cells whose only content are hyphens (-),
	// and optionally, a leading or trailing colon (:), or both, to indicate
	// left, right, or center alignment respectively"
	guard state.i < state.src.count else {
		return false
	}

	let charIndex = state.src.index(state.src.startIndex, offsetBy: state.i)
	let char = state.src[charIndex]

	if state.indent <= 3 && (char == "|" || char == "-" || char == ":") {
		var cells: [String] = [char == ":" ? "left" : ""]
		var end = state.i + 1
		var lastChar = char

		while end < state.src.count {
			let nextIndex = state.src.index(state.src.startIndex, offsetBy: end)
			let nextChar = state.src[nextIndex]

			if nextChar == "|" {
				cells.append("")
				lastChar = nextChar
			} else if nextChar == "-" {
				lastChar = nextChar
			} else if nextChar == ":" {
				let x = cells.count - 1
				if lastChar == "|" {
					cells[x] = "left"
				} else {
					cells[x] = cells[x].isEmpty ? "right" : "center"
				}
				lastChar = nextChar
			} else if isNewLine(char: String(nextChar)) {
				// Handle newline
				end += 1
				break
			} else if isSpace(code: Int(nextChar.asciiValue ?? 0)) {
				// Continue past spaces
			} else {
				return false
			}
			end += 1
		}

		if lastChar == "|" {
			cells.removeLast()
		}

		let haveParagraph = parent.type == "paragraph" && !parent.blankAfter
			&& parent.content.range(of: "[^\\s]", options: .regularExpression) != nil

		if haveParagraph {
			// "The header row must match the delimiter row in the number of
			// cells. If not, a table will not be recognized"
			var headerCellCount = 1
			let headerContent = parent.content
				.trimmingCharacters(in: .whitespaces)
				.replacingOccurrences(of: "(^\\||\\|$)", with: "", options: .regularExpression)

			for i in 0..<headerContent.count {
				let idx = headerContent.index(headerContent.startIndex, offsetBy: i)
				if headerContent[idx] == "|" && !isEscaped(text: headerContent, i: i) {
					headerCellCount += 1
				}
			}

			if cells.count != headerCellCount {
				return false
			}

			var closedNode: MarkdownNode?
			var mutableParent = parent

			if state.maybeContinue {
				state.maybeContinue = false
				var i = state.openNodes.count - 1
				while i > 0 {
					let node = state.openNodes[i]
					if node.maybeContinuing {
						node.maybeContinuing = false
						closedNode = node
						state.openNodes.removeSubrange(i...)
						break
					}
					i -= 1
				}
				if let last = state.openNodes.last {
					mutableParent = last
				}
			}

			if let closed = closedNode {
				closeNode(state: &state, node: closed)
			}

			let header = MarkdownNode(
				type: "table_header",
				block: true,
				index: state.i,
				line: state.line,
				column: 1,
				markup: "",
				indent: 0,
				children: []
			)
			mutableParent.children?.append(header)

			let headerParts = splitByUnescapedPipe(headerContent)
			var hi = 0
			for text in headerParts {
				let cell = MarkdownNode(
					type: "table_cell",
					block: true,
					index: state.i,
					line: state.line,
					column: 1,
					markup: "",
					indent: 0,
					children: []
				)
				cell.content = text.trimmingCharacters(in: .whitespaces)
					.replacingOccurrences(of: "\\|", with: "|")
				cell.info = cells[hi]
				header.children?.append(cell)
				hi += 1
			}

			mutableParent.type = "table"
			mutableParent.content = ""
			let markupEnd = min(end, state.src.count)
			let markupStart = state.src.index(state.src.startIndex, offsetBy: state.i)
			let markupEndIndex = state.src.index(state.src.startIndex, offsetBy: markupEnd)
			mutableParent.markup = String(state.src[markupStart..<markupEndIndex])
			state.i = end
			return true
		}
	}

	return false
}

func testTableContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	// Just close the table every time, and check whether the last node was a
	// table in testStart. That way we can interrupt tables with e.g.
	// blockquotes, even if the blockquote contains a pipe
	return false
}

/// Splits a string by unescaped pipe characters
/// Swift doesn't support negative lookbehind, so we handle this manually
private func splitByUnescapedPipe(_ text: String) -> [String] {
	var result: [String] = []
	var current = ""
	var i = 0

	while i < text.count {
		let idx = text.index(text.startIndex, offsetBy: i)
		let char = text[idx]

		if char == "|" && !isEscaped(text: text, i: i) {
			result.append(current)
			current = ""
		} else {
			current.append(char)
		}
		i += 1
	}

	result.append(current)
	return result
}

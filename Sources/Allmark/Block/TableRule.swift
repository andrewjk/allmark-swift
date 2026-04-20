import Foundation

extension String {
	func substring(from start: Int, to end: Int) -> String {
		let startIdx = index(startIndex, offsetBy: start)
		let endIdx = index(startIndex, offsetBy: end)
		return String(self[startIdx ..< endIdx])
	}
}

/// GFM tables (pipe-delimited)

let tableRule = BlockRule(
	name: "table",
	testStart: testTableStart,
	testContinue: testTableContinue,
	closeNode: { _, _ in }
)

func testTableStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}

	// We may already have a table
	if let lastNode = parent.children?.last,
	   !state.hasBlankLine,
	   lastNode.type == "table"
	{
		let endOfLine = getEndOfLine(state: &state)

		guard let headerRow = lastNode.children?.first,
		      let headers = headerRow.children?.map({ $0.info ?? "" })
		else {
			return false
		}

		var rowLength = endOfLine - state.i
		if endOfLine > 0, state.src[state.src.index(state.src.startIndex, offsetBy: endOfLine - 1)] == "\n" {
			rowLength -= 1
		}

		let row = newBlock(
			type: "table_row",
			index: state.i,
			line: state.line,
			markup: "",
			indent: 0
		)
		row.length = rowLength
		lastNode.children?.append(row)

		let rowSrc = state.src.substring(from: state.i, to: state.i + rowLength)
		let pipePositions = loadPipePositions(line: rowSrc)

		let rowContent = rowSrc.trimmingCharacters(in: .whitespaces)
			.replacingOccurrences(of: "(^\\||\\|$)", with: "", options: .regularExpression)
		var rowParts = splitByUnescapedPipe(rowContent)
		while rowParts.count < headers.count {
			rowParts.append("")
		}
		rowParts = Array(rowParts.prefix(headers.count))

		for j in 0 ..< rowParts.count {
			parseTableCell(
				row: row,
				state: &state,
				index: j,
				parts: rowParts,
				headers: headers,
				pipePositions: pipePositions
			)
		}

		lastNode.length = endOfLine - lastNode.index
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

			for i in 0 ..< headerContent.count {
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

			let headerIndex = parent.index
			var headerLength = parent.content.count
			if parent.content.hasSuffix("\n") {
				headerLength -= 1
			}
			let header = newBlock(
				type: "table_header",
				index: headerIndex,
				line: state.line,
				markup: "",
				indent: 0
			)
			header.length = headerLength
			mutableParent.children?.append(header)

			let headerSrc = parent.content.substring(from: 0, to: headerLength)
			let pipePositions = loadPipePositions(line: headerSrc)

			let headerParts = splitByUnescapedPipe(headerContent)
			for j in 0 ..< headerParts.count {
				parseTableCell(
					row: header,
					state: &state,
					index: j,
					parts: headerParts,
					headers: cells,
					pipePositions: pipePositions
				)
			}

			mutableParent.type = "table"
			mutableParent.content = ""
			let markupEnd = min(end, state.src.count)
			let markupStart = state.src.index(state.src.startIndex, offsetBy: state.i)
			let markupEndIndex = state.src.index(state.src.startIndex, offsetBy: markupEnd)
			mutableParent.markup = String(state.src[markupStart ..< markupEndIndex])
			mutableParent.length = end - mutableParent.index
			state.i = end
			return true
		}
	}

	return false
}

func testTableContinue(state _: inout BlockParserState, node _: MarkdownNode) -> Bool {
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

		if char == "|", !isEscaped(text: text, i: i) {
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

/// Loads pipe positions from a line for accurate source mapping
private func loadPipePositions(line: String) -> [Int] {
	var pipePositions: [Int] = []
	var haveEndPipe = false
	for i in 0 ..< line.count {
		let idx = line.index(line.startIndex, offsetBy: i)
		let char = line[idx]
		if char == "|", !isEscaped(text: line, i: i) {
			pipePositions.append(i)
			haveEndPipe = true
		} else if !isSpace(code: Int(char.asciiValue ?? 0)) {
			// Make sure there's a start pipe position
			if pipePositions.isEmpty {
				pipePositions.append(0)
			}
			haveEndPipe = false
		}
	}
	// Make sure there's an end pipe position
	if !haveEndPipe {
		pipePositions.append(line.count - 1)
	}
	return pipePositions
}

private func parseTableCell(
	row: MarkdownNode,
	state: inout BlockParserState,
	index: Int,
	parts: [String],
	headers: [String],
	pipePositions: [Int]
) {
	let text = parts[index]

	let cellStart = index < pipePositions.count ? pipePositions[index] : 0
	let cellEnd = index + 1 < pipePositions.count ? pipePositions[index + 1] : 0
	let cellLength = cellEnd - cellStart + 1

	let trimmedText = text.trimmingCharacters(in: .whitespaces)
	let contentStartOffset = trimmedText.count > 0 ? (text as NSString).range(of: trimmedText).location + 1 : 0
	let contentStart = row.index + cellStart + contentStartOffset

	let cell = newBlock(
		type: "table_cell",
		index: row.index + cellStart,
		line: state.line,
		markup: "",
		indent: 0
	)
	cell.length = cellLength
	cell.info = headers[index]
	row.children?.append(cell)

	let content = newBlock(
		type: "table_cell_content",
		index: contentStart,
		line: state.line,
		markup: "",
		indent: 0
	)
	content.content = trimmedText.replacingOccurrences(of: "\\|", with: "|")
	cell.children = [content]
}

import Foundation

/// GFM tables (pipe-delimited)

let tableRule = BlockRule(
	name: "table",
	testStart: testTableStart,
	// Just close the table every time, and check whether the last node was a
	// table in testStart. That way we can interrupt tables with e.g.
	// blockquotes, even if the blockquote contains a pipe
	testContinue: { _, _ in false },
	closeNode: { _, _ in }
)

func testTableStart(state: inout BlockParserState, parent: MarkdownNode, endOfLine _: Int) -> Bool {
	if parent.acceptsContent {
		return false
	}

	// We may already have a table
	if let lastNode = parent.children.last,
	   !state.hasBlankLine,
	   lastNode.type == "table"
	{
		let endOfLine = getEndOfLine(state: &state)

		guard let headerRow = lastNode.children.first else {
			return false
		}
		let headers = headerRow.children.map { $0.info ?? "" }

		let rowLength = endOfLine - state.i

		let row = newBlock(
			type: "table_row",
			index: state.i,
			line: state.line,
			markup: "",
			indent: 0
		)
		row.length = rowLength
		lastNode.children.append(row)

		let rowSrc = charToString(state.src, from: state.i, to: state.i + rowLength)
		let pipePositions = loadPipePositions(line: rowSrc)

		let rowContent = trimPipesAndWhitespace(rowSrc)
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

	let char = state.src[state.i]

	if state.indent <= 3 && (char == PIPE_CODE || char == DASH_CODE || char == COLON_CODE) {
		var cells: [String] = [char == COLON_CODE ? "left" : ""]
		var end = state.i + 1
		var lastChar = char

		while end < state.src.count {
			let nextChar = state.src[end]

			if nextChar == PIPE_CODE {
				cells.append("")
				lastChar = nextChar
			} else if nextChar == DASH_CODE {
				lastChar = nextChar
			} else if nextChar == COLON_CODE {
				let x = cells.count - 1
				if lastChar == PIPE_CODE {
					cells[x] = "left"
				} else {
					cells[x] = cells[x].isEmpty ? "right" : "center"
				}
				lastChar = nextChar
			} else if isNewLine(code: nextChar) {
				end += 1
				break
			} else if isSpace(code: nextChar) {
				// Continue past spaces
			} else {
				return false
			}
			end += 1
		}

		if lastChar == PIPE_CODE {
			cells.removeLast()
		}

		let haveParagraph = parent.type == "paragraph" && !parent.blankAfter
			&& hasNonWhitespace(parent.content)

		if haveParagraph {
			// "The header row must match the delimiter row in the number of
			// cells. If not, a table will not be recognized"
			var headerCellCount = 1
			let headerContent = trimPipesAndWhitespace(parent.content)

			for idx in headerContent.indices {
				if headerContent[idx] == "|", !isEscaped(text: headerContent, index: idx) {
					headerCellCount += 1
				}
			}

			if cells.count != headerCellCount {
				return false
			}

			let mutableParent = parent

			let headerIndex = parent.index
			var headerLength = parent.content.count
			if parent.content.hasSuffix("\n") || parent.content.hasSuffix("\r\n") || parent.content.hasSuffix("\r") {
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
			mutableParent.children.append(header)

			let headerSrc = charToString(parent.content, from: 0, to: headerLength)
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
			mutableParent.markup = charToString(state.src, from: state.i, to: markupEnd)
			mutableParent.length = end - mutableParent.index
			state.i = end
			return true
		}
	}

	return false
}

/// Trims leading/trailing whitespace, then removes one leading and one
/// trailing pipe character (equivalent to the previous regex processing).
private func trimPipesAndWhitespace(_ text: String) -> String {
	var start = text.startIndex
	let end = text.endIndex
	while start < end {
		let char = text[start]
		if char == " " || char == "\t" || char == "\n" || char == "\r\n" || char == "\r" {
			start = text.index(after: start)
		} else {
			break
		}
	}
	var e = end
	while start < e {
		let prev = text.index(before: e)
		let char = text[prev]
		if char == " " || char == "\t" || char == "\n" || char == "\r\n" || char == "\r" {
			e = prev
		} else {
			break
		}
	}
	var result = String(text[start ..< e])
	if result.first == "|" {
		result.removeFirst()
	}
	if result.last == "|" {
		result.removeLast()
	}
	return result
}

/// Splits a string by unescaped pipe characters
/// Swift doesn't support negative lookbehind, so we handle this manually
private func splitByUnescapedPipe(_ text: String) -> [String] {
	var result: [String] = []
	var current = ""
	var i = text.startIndex
	let end = text.endIndex

	while i < end {
		let char = text[i]

		if char == "|", !isEscaped(text: text, index: i) {
			result.append(current)
			current = ""
		} else {
			current.append(char)
		}
		i = text.index(after: i)
	}

	result.append(current)
	return result
}

/// Loads pipe positions from a line for accurate source mapping
private func loadPipePositions(line: String) -> [Int] {
	var pipePositions: [Int] = []
	var haveEndPipe = false
	var pos = 0
	var i = line.startIndex
	let end = line.endIndex
	while i < end {
		let char = line[i]
		if char == "|", !isEscaped(text: line, index: i) {
			pipePositions.append(pos)
			haveEndPipe = true
		} else if !isSpace(char: char) {
			// Make sure there's a start pipe position
			if pipePositions.isEmpty {
				pipePositions.append(0)
			}
			haveEndPipe = false
		}
		pos += 1
		i = line.index(after: i)
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
	row.children.append(cell)

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

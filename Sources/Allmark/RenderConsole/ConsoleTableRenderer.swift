import Foundation

let consoleTableRenderer = Renderer(
	name: "table",
	render: renderConsoleTable
)

func renderConsoleTable(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiDim
	guard !node.children.isEmpty else { return }

	let headerRow = node.children[0]
	let dataRows = Array(node.children.dropFirst())

	let headerCells = headerRow.children
	var cellTexts: [[String]] = []

	let maxColumns = max(headerCells.count, dataRows.map { $0.children.count }.max() ?? 0)
	var columnWidths = [Int](repeating: 0, count: maxColumns)
	var alignments = [String](repeating: "", count: maxColumns)

	for i in 0 ..< headerCells.count {
		let text = getTextFromConsoleNode(node: headerCells[i])
		if cellTexts.isEmpty {
			cellTexts.append([])
		}
		cellTexts[0].append(text)
		columnWidths[i] = max(columnWidths[i], text.count + 2)
		alignments[i] = headerCells[i].info ?? ""
	}

	for r in 0 ..< dataRows.count {
		let row = dataRows[r]
		let rowCells = row.children
		if cellTexts.count <= r + 1 {
			cellTexts.append([])
		}
		for c in 0 ..< rowCells.count {
			let text = getTextFromConsoleNode(node: rowCells[c])
			while cellTexts[r + 1].count <= c {
				cellTexts[r + 1].append("")
			}
			cellTexts[r + 1][c] = text
			if c < columnWidths.count {
				columnWidths[c] = max(columnWidths[c], text.count + 2)
			}
		}
	}

	var wrappedCells: [[[String]]]? = nil

	if let lineWidth = state.lineWidth {
		let totalWidth = columnWidths.reduce(0, +) + maxColumns + 1
		if totalWidth > lineWidth {
			let targetWidths = fitColumns(columnWidths, lineWidth: lineWidth, numColumns: maxColumns, cellTexts: cellTexts)
			wrappedCells = wrapAllCells(cellTexts, targetWidths)
			var actualWidths = [Int](repeating: 2, count: maxColumns)
			if let wrapped = wrappedCells {
				for row in wrapped {
					for c in 0 ..< row.count {
						for line in row[c] {
							if c < actualWidths.count {
								actualWidths[c] = max(actualWidths[c], line.count + 2)
							}
						}
					}
				}
			}
			columnWidths = actualWidths
		}
	}

	func makeLine(left: String, mid: String, right: String, sep: String) -> String {
		var line = left
		for i in 0 ..< columnWidths.count {
			line += String(repeating: "─", count: columnWidths[i])
			if i < columnWidths.count - 1 {
				line += (i == 0) ? mid : sep
			}
		}
		line += right
		return "\(style)\(line)\(ansiReset)\n"
	}

	func padText(text: String, width: Int, align: String) -> String {
		if align == "right" {
			return String(repeating: " ", count: width - text.count) + text + " "
		}
		if align == "center" {
			let leftPad = (width - text.count) / 2
			let rightPad = width - text.count - leftPad + 1
			return String(repeating: " ", count: leftPad) + text + String(repeating: " ", count: rightPad)
		}
		return text + String(repeating: " ", count: width - text.count) + " "
	}

	func renderRow(texts: [String], wrappedLines: [[String]]?, alignments: [String]) {
		var maxLineCount = 1
		if let wrapped = wrappedLines {
			for lines in wrapped {
				maxLineCount = max(maxLineCount, lines.count)
			}
		}
		for lineIdx in 0 ..< maxLineCount {
			state.output += "\(style)│\(ansiReset)"
			for c in 0 ..< columnWidths.count {
				let text: String
				if let wrapped = wrappedLines, c < wrapped.count, lineIdx < wrapped[c].count {
					text = wrapped[c][lineIdx]
				} else if wrappedLines == nil {
					text = c < texts.count ? texts[c] : ""
				} else {
					text = ""
				}
				let align = c < alignments.count ? alignments[c] : ""
				state.output += " \(padText(text: text, width: columnWidths[c] - 2, align: align))\(style)│\(ansiReset)"
			}
			state.output += "\n"
		}
	}

	state.output += makeLine(left: "┌", mid: "┬", right: "┐", sep: "┬")

	if !headerCells.isEmpty {
		let headerWrapped: [[String]]? = wrappedCells?.first
		renderRow(texts: cellTexts[0], wrappedLines: headerWrapped, alignments: alignments)
	}

	state.output += makeLine(left: "├", mid: "┼", right: "┤", sep: "┼")

	for r in 0 ..< dataRows.count {
		let rowCells = dataRows[r].children
		let rowAlignments = (0 ..< columnWidths.count).map { c in
			c < rowCells.count ? (rowCells[c].info ?? "") : ""
		}
		let rowWrapped: [[String]]? = (r + 1) < (wrappedCells?.count ?? 0) ? wrappedCells?[r + 1] : nil
		let texts = (r + 1) < cellTexts.count ? cellTexts[r + 1] : []
		renderRow(texts: texts, wrappedLines: rowWrapped, alignments: rowAlignments)
	}

	state.output += makeLine(left: "└", mid: "┴", right: "┘", sep: "┴")
	state.output += "\n"
}

func getTextFromConsoleNode(node: MarkdownNode) -> String {
	if node.type == "text" {
		return node.content
	}
	return node.children.map { getTextFromConsoleNode(node: $0) }.joined()
}

func fitColumns(_ columnWidths: [Int], lineWidth: Int, numColumns: Int, cellTexts: [[String]]) -> [Int] {
	let available = lineWidth - 1 - numColumns
	var targetWidths = columnWidths

	let minWidths = columnWidths.enumerated().map { colIdx, _ -> Int in
		var maxWordLen = 1
		for row in cellTexts {
			let text = row.indices.contains(colIdx) ? row[colIdx] : ""
			for word in text.split(separator: " ") {
				maxWordLen = max(maxWordLen, word.count)
			}
		}
		return maxWordLen + 2
	}

	while targetWidths.reduce(0, +) > available {
		var maxIdx = 0
		for i in 1 ..< targetWidths.count {
			if targetWidths[i] > targetWidths[maxIdx] { maxIdx = i }
		}
		if targetWidths[maxIdx] <= minWidths[maxIdx] { break }
		targetWidths[maxIdx] -= 1
	}

	return targetWidths
}

func wrapAllCells(_ cellTexts: [[String]], _ targetWidths: [Int]) -> [[[String]]] {
	var result: [[[String]]] = []
	for r in 0 ..< cellTexts.count {
		var row: [[String]] = []
		for c in 0 ..< targetWidths.count {
			let text = (r < cellTexts.count && c < cellTexts[r].count) ? cellTexts[r][c] : ""
			row.append(wrapText(text, targetWidths[c] - 2))
		}
		result.append(row)
	}
	return result
}

func wrapText(_ text: String, _ maxWidth: Int) -> [String] {
	if maxWidth <= 0 { return [text] }
	if text.count <= maxWidth { return [text] }
	let words = text.split(separator: " ").map(String.init)
	var lines: [String] = []
	var currentLine = ""
	for word in words {
		if currentLine.isEmpty {
			currentLine = word
		} else if currentLine.count + 1 + word.count <= maxWidth {
			currentLine += " " + word
		} else {
			lines.append(currentLine)
			currentLine = word
		}
	}
	if !currentLine.isEmpty { lines.append(currentLine) }
	return lines
}

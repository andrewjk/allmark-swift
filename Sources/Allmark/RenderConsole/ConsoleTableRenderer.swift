import Foundation

let consoleTableRenderer = Renderer(
	name: "table",
	render: renderConsoleTable
)

func renderConsoleTable(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let style = ansiDim
	guard let children = node.children, !children.isEmpty else { return }

	let headerRow = children[0]
	let dataRows = Array(children.dropFirst())

	let headerCells = headerRow.children ?? []
	var cellTexts: [[String]] = []

	let maxColumns = max(headerCells.count, dataRows.map { $0.children?.count ?? 0 }.max() ?? 0)
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
		let rowCells = row.children ?? []
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
			let rightPad = width - text.count - leftPad
			return String(repeating: " ", count: leftPad) + text + String(repeating: " ", count: rightPad)
		}
		return text + String(repeating: " ", count: width - text.count) + " "
	}

	state.output += makeLine(left: "┌", mid: "┬", right: "┐", sep: "┬")

	if !headerCells.isEmpty {
		state.output += "\(style)│\(ansiReset)"
		for i in 0 ..< headerCells.count {
			let text = i < cellTexts[0].count ? cellTexts[0][i] : ""
			let align = alignments[i]
			state.output += " \(padText(text: text, width: columnWidths[i] - 2, align: align))\(style)│\(ansiReset)"
		}
		state.output += "\n"
	}

	state.output += makeLine(left: "├", mid: "┼", right: "┤", sep: "┼")

	for r in 0 ..< dataRows.count {
		state.output += "\(style)│\(ansiReset)"
		for c in 0 ..< columnWidths.count {
			let text = (r + 1) < cellTexts.count && c < cellTexts[r + 1].count ? cellTexts[r + 1][c] : ""
			let rowCells = dataRows[r].children ?? []
			let align = c < rowCells.count ? (rowCells[c].info ?? "") : ""
			state.output += " \(padText(text: text, width: columnWidths[c] - 2, align: align))\(style)│\(ansiReset)"
		}
		state.output += "\n"
	}

	state.output += makeLine(left: "└", mid: "┴", right: "┘", sep: "┴")
	state.output += "\n"
}

func getTextFromConsoleNode(node: MarkdownNode) -> String {
	if node.type == "text" {
		return node.content
	}
	if let children = node.children {
		return children.map { getTextFromConsoleNode(node: $0) }.joined()
	}
	return ""
}

import Foundation

@MainActor
let consoleTableRenderer = Renderer(
	name: "table",
	render: renderConsoleTable
)

@MainActor
func renderConsoleTable(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	let style = ansiDim
	if !state.output.isEmpty && !state.output.hasSuffix("\n") {
		state.output += "\n"
	}

	guard let children = node.children, !children.isEmpty else { return }

	let headerRow = children[0]
	let dataRows = Array(children.dropFirst())

	let headerCells = headerRow.children ?? []
	var cellTexts: [[String]] = []

	let maxColumns = max(headerCells.count, dataRows.map { $0.children?.count ?? 0 }.max() ?? 0)
	var columnWidths = [Int](repeating: 0, count: maxColumns)

	for i in 0..<headerCells.count {
		let text = getTextFromConsoleNode(node: headerCells[i])
		if cellTexts.isEmpty {
			cellTexts.append([])
		}
		cellTexts[0].append(text)
		columnWidths[i] = max(columnWidths[i], text.count + 2)
	}

	for r in 0..<dataRows.count {
		let row = dataRows[r]
		let rowCells = row.children ?? []
		if cellTexts.count <= r + 1 {
			cellTexts.append([])
		}
		for c in 0..<rowCells.count {
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
		for i in 0..<columnWidths.count {
			line += String(repeating: "─", count: columnWidths[i])
			if i < columnWidths.count - 1 {
				line += (i == 0) ? mid : sep
			}
		}
		line += right
		return "\(style)\(line)\(ansiReset)\n"
	}

	state.output += makeLine(left: "┌", mid: "┬", right: "┐", sep: "┬")

	if !headerCells.isEmpty {
		state.output += "\(style)│\(ansiReset)"
		for i in 0..<headerCells.count {
			let text = i < cellTexts[0].count ? cellTexts[0][i] : ""
			let padding = String(repeating: " ", count: columnWidths[i] - text.count - 1)
			state.output += " \(text)\(padding)\(style)│\(ansiReset)"
		}
		state.output += "\n"
	}

	state.output += makeLine(left: "├", mid: "┼", right: "┤", sep: "┼")

	for r in 0..<dataRows.count {
		state.output += "\(style)│\(ansiReset)"
		for c in 0..<columnWidths.count {
			let text = (r + 1) < cellTexts.count && c < cellTexts[r + 1].count ? cellTexts[r + 1][c] : ""
			let padding = String(repeating: " ", count: columnWidths[c] - text.count - 1)
			state.output += " \(text)\(padding)\(style)│\(ansiReset)"
		}
		state.output += "\n"
	}

	state.output += makeLine(left: "└", mid: "┴", right: "┘", sep: "┴")
}

@MainActor
func getTextFromConsoleNode(node: MarkdownNode) -> String {
	if node.type == "text" {
		return node.markup
	}
	if let children = node.children {
		return children.map { getTextFromConsoleNode(node: $0) }.joined()
	}
	return ""
}

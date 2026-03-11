import Foundation

@MainActor
let tableRenderer = Renderer(
	name: "table",
	render: renderTable
)

@MainActor
func renderTable(_ node: MarkdownNode, _ state: inout RendererState, _ first: Bool?, _ last: Bool?, _ decode: Bool?) {
	startNewLine(node: node, state: &state)
	state.output += "<table>\n<thead>\n<tr>\n"
	if let children = node.children, let firstRowChildren = children.first?.children {
		for cell in firstRowChildren {
			renderTableCell(node: cell, state: &state, tag: "th")
		}
	}
	state.output += "</tr>\n</thead>\n"
	if let children = node.children, children.count > 1 {
		state.output += "<tbody>\n"
		for row in children.dropFirst() {
			state.output += "<tr>\n"
			if let rowChildren = row.children {
				for cell in rowChildren {
					renderTableCell(node: cell, state: &state, tag: "td")
				}
			}
			state.output += "</tr>\n"
		}
		state.output += "</tbody>\n"
	}
	state.output += "</table>"
	endNewLine(node: node, state: &state)
}

@MainActor
func renderTableCell(node: MarkdownNode, state: inout RendererState, tag: String) {
	startNewLine(node: node, state: &state)
	let align = node.info != nil && !node.info!.isEmpty ? " align=\"\(node.info!)\"" : ""
	state.output += "<\(tag)\(align)>"
	innerNewLine(node: node, state: &state)
	renderChildren(node: node, state: &state)
	state.output += "</\(tag)>"
	endNewLine(node: node, state: &state)
}

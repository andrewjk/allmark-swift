import Foundation

let listRenderer = Renderer(
	name: "list",
	render: renderList
)

func renderList(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?) {
	let ordered = node.type == "list_ordered"
	var start = ""
	if ordered {
		let startNumber = Int(String(node.markup.dropLast())) ?? 1
		if startNumber != 1 {
			start = " start=\"\(startNumber)\""
		}
	}

	startNewLine(node: node, state: &state)
	state.output += "<\(ordered ? "ol\(start)" : "ul")>"
	innerNewLine(node: node, state: &state)

	for item in node.children {
		state.output += "<li>"
		for (i, child) in item.children.enumerated() {
			if !node.loose, child.type == "paragraph" {
				renderChildren(node: child, state: &state)
			} else {
				if i == 0 {
					innerNewLine(node: item, state: &state)
				}
				renderNode(node: child, state: &state)
				if i == item.children.count - 1, child.block {
					if state.output.hasSuffix("\n") {
						state.output.removeLast()
					}
					if state.output.hasSuffix("\r\n") {
						state.output.removeLast()
					}
					if state.output.hasSuffix("\r") {
						state.output.removeLast()
					}
					state.output += "\n"
				}
			}
		}
		state.output += "</li>"
		endNewLine(node: node, state: &state)
	}

	state.output += "</\(ordered ? "ol" : "ul")>"
	endNewLine(node: node, state: &state)
}

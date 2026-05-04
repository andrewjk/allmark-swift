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

	var loose = false
	for i in 0 ..< (node.children.count - 1) {
		let child = node.children[i]
		if let grandchild = child.children.last, grandchild.blankAfter {
			child.blankAfter = true
		}
		if child.blankAfter {
			loose = true
			break
		}
	}

	for child in node.children {
		if !child.children.isEmpty {
			for j in 0 ..< (child.children.count - 1) {
				let first = child.children[j]
				let second = child.children[j + 1]
				if first.block, first.blankAfter, second.block {
					loose = true
					break
				}
			}
		}
	}

	for item in node.children {
		state.output += "<li>"
		for (i, child) in item.children.enumerated() {
			if !loose, child.type == "paragraph" {
				renderChildren(node: child, state: &state)
			} else {
				if i == 0 {
					innerNewLine(node: item, state: &state)
				}
				renderNode(node: child, state: &state)
				if i == item.children.count - 1, child.block, !state.output.hasSuffix("\n") {
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

import Foundation

let listRenderer = Renderer(
	name: "list",
	render: renderList
)

func renderList(_ node: MarkdownNode, _ state: inout RendererState, _: Bool?, _: Bool?, _: Bool?) {
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
	if let children = node.children {
		for i in 0 ..< (children.count - 1) {
			let child = children[i]
			if let grandchild = child.children?.last, grandchild.blankAfter {
				child.blankAfter = true
			}
			if child.blankAfter {
				loose = true
				break
			}
		}

		for child in children {
			if let childChildren = child.children, !childChildren.isEmpty {
				for j in 0 ..< (childChildren.count - 1) {
					let first = childChildren[j]
					let second = childChildren[j + 1]
					if first.block, first.blankAfter, second.block {
						loose = true
						break
					}
				}
			}
		}

		for item in children {
			state.output += "<li>"
			if let itemChildren = item.children {
				for (i, child) in itemChildren.enumerated() {
					if !loose, child.type == "paragraph" {
						renderChildren(node: child, state: &state)
					} else {
						if i == 0 {
							innerNewLine(node: item, state: &state)
						}
						renderNode(node: child, state: &state, first: i == itemChildren.count - 1)
						if i == itemChildren.count - 1, child.block, !state.output.hasSuffix("\n") {
							state.output += "\n"
						}
					}
				}
			}
			state.output += "</li>"
			endNewLine(node: node, state: &state)
		}
	}

	state.output += "</\(ordered ? "ol" : "ul")>"
	endNewLine(node: node, state: &state)
}

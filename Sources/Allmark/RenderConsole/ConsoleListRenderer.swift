import Foundation

func renderConsoleList(_ node: MarkdownNode, _ state: inout RendererState, ordered: Bool) {
	state.listDepth += 1

	let loose = isLooseList(node: node)

	var counter = 1
	if ordered, !node.markup.isEmpty {
		let digits = node.markup.prefix(while: { $0.isNumber })
		if let num = Int(digits) {
			counter = num
		}
	}

	if let children = node.children {
		for item in children {
			let prefix: String
			if ordered {
				prefix = "\(counter)."
				counter += 1
			} else {
				prefix = consoleBullets[min(state.listDepth - 1, consoleBullets.count - 1)]
			}

			if let itemChildren = item.children {
				for (i, child) in itemChildren.enumerated() {
					if !loose, child.type == "paragraph" {
						let indent = String(repeating: "  ", count: state.listDepth - 1)
						if i == 0 {
							state.output += "\(indent)\(ansiDim)\(prefix)\(ansiReset) "
						}
						renderChildren(node: child, state: &state)
						state.output += "\n"
					} else {
						let indent = String(repeating: "  ", count: state.listDepth - 1)
						if i == 0 {
							state.output += "\(indent)\(ansiDim)\(prefix)\(ansiReset) "
						}
						if let renderer = state.renderers[child.type] {
							renderer.render(child, &state, true)
						}
						if !loose, state.output.hasSuffix("\n\n") {
							state.output.removeLast()
						}
					}
				}
			}
		}
	}

	state.listDepth -= 1

	if !loose {
		state.output += "\n"
	}
}

func isLooseList(node: MarkdownNode) -> Bool {
	if let children = node.children {
		for i in 0 ..< (children.count - 1) {
			let child = children[i]
			if let grandchild = child.children?.last, grandchild.blankAfter {
				child.blankAfter = true
			}
			if child.blankAfter {
				return true
			}
		}

		for i in 0 ..< children.count {
			let child = children[i]
			if let itemChildren = child.children {
				for j in 0 ..< (itemChildren.count - 1) {
					if j < itemChildren.count {
						let first = itemChildren[j]
						if j + 1 < itemChildren.count {
							let second = itemChildren[j + 1]
							if first.block && first.blankAfter && second.block {
								return true
							}
						}
					}
				}
			}
		}
	}
	return false
}

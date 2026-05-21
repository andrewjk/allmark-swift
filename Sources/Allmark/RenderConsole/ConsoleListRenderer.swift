import Foundation

func renderConsoleList(_ node: MarkdownNode, _ state: inout RendererState, ordered: Bool) {
	state.listDepth += 1

	var counter = 1
	if ordered, !node.markup.isEmpty {
		let digits = node.markup.prefix(while: { $0.isNumber })
		if let num = Int(digits) {
			counter = num
		}
	}

	for item in node.children {
		let prefix: String
		if ordered {
			prefix = "\(counter)."
			counter += 1
		} else {
			prefix = consoleBullets[min(state.listDepth - 1, consoleBullets.count - 1)]
		}

		for (i, child) in item.children.enumerated() {
			if !node.loose, child.type == "paragraph" {
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
				if let renderer = state.renderersMap[child.type] {
					renderer.render(child, &state, true)
				}
				if !node.loose, state.output.hasSuffix("\n\n") {
					state.output.removeLast()
				}
			}
		}
	}

	state.listDepth -= 1

	if !node.loose {
		state.output += "\n"
	}
}

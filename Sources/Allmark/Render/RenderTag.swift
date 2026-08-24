import Foundation

func renderTag(node: MarkdownNode, state: inout RendererState, tag: String, decode: Bool = true) {
	startNewLine(node: node, state: &state)
	state.output += "<"
	state.output += tag
	state.output += ">"
	if node.block, node.children.isEmpty {
		state.output += "\n"
	} else {
		innerNewLine(node: node, state: &state)
		renderChildren(node: node, state: &state, decode: decode)
		if node.block {
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
	state.output += "</"
	state.output += tag
	state.output += ">"
	endNewLine(node: node, state: &state)
}

import Foundation

func renderTag(node: MarkdownNode, state: inout RendererState, tag: String, decode: Bool = true) {
	startNewLine(node: node, state: &state)
	state.output += "<\(tag)>"
	if node.block, node.children?.isEmpty ?? true {
		state.output += "\n"
	} else {
		innerNewLine(node: node, state: &state)
		renderChildren(node: node, state: &state, decode: decode)
		if node.block, !state.output.hasSuffix("\n") {
			state.output += "\n"
		}
	}
	state.output += "</\(tag)>"
	endNewLine(node: node, state: &state)
}

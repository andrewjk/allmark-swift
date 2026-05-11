import Foundation

func startNewLine(node: MarkdownNode, state: inout RendererState) {
	if !state.output.isEmpty, node.block, !state.output.hasSuffix("\n"), !state.output.hasSuffix("\r\n") {
		state.output += "\n"
	}
}

func innerNewLine(node: MarkdownNode, state: inout RendererState) {
	if node.block, let firstChild = node.children.first, firstChild.block {
		state.output += "\n"
	}
}

func endNewLine(node: MarkdownNode, state: inout RendererState) {
	if node.block {
		state.output += "\n"
	}
}

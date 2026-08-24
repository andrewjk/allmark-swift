import Foundation

/// Parses inline content by testing each inline rule
/// - Parameters:
///   - state: The inline parser state
///   - parent: The parent markdown node

func parseInline(state: inout InlineParserState, parent: MarkdownNode) {
	let src = state.src

	while state.i < src.count {
		let char = src[state.i]

		if isNewLine(code: char) {
			state.indent = 0
			state.line += 1
			state.lineStart = state.i
		}

		state.isEscaped = isEscaped(text: src, i: state.i)

		for rule in state.rules {
			var mutableParent = parent
			let handled = rule.test(&state, &mutableParent)
			if handled {
				break
			}
		}
	}
}

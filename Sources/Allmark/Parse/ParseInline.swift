import Foundation

/// Parses inline content by testing each inline rule
/// - Parameters:
///   - state: The inline parser state
///   - parent: The parent markdown node

func parseInline(state: inout InlineParserState, parent: MarkdownNode) {
	let src = state.src

	while state.i < src.count {
		let char = src[state.i]

		if char == 0x0D /* \r */ || char == 0x0A /* \n */ {
			// Treat Windows \r\n as \n
			if char == 0x0D /* \r */, state.i + 1 < src.count {
				if src[state.i + 1] == 0x0A /* \n */ {
					state.i += 1
				}
			}

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

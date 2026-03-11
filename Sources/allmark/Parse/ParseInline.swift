import Foundation

/// Parses inline content by testing each inline rule
/// - Parameters:
///   - state: The inline parser state
///   - parent: The parent markdown node
@MainActor
func parseInline(state: inout InlineParserState, parent: MarkdownNode) {
	let src = state.src
	
	while state.i < src.count {
		let index = src.index(src.startIndex, offsetBy: state.i)
		let char = src[index]
		
		if char == "\r" || char == "\n" {
			// Treat Windows \r\n as \n
			if char == "\r" && state.i + 1 < src.count {
				let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
				if src[nextIndex] == "\n" {
					state.i += 1
				}
			}
			
			state.line += 1
			state.lineStart = state.i
		}
		
		for (_, rule) in state.rules {
			var mutableParent = parent
			let handled = rule.test(&state, &mutableParent)
			if handled {
				break
			}
		}
	}
}

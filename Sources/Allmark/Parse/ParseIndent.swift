import Foundation

/// Parses leading indentation (spaces and tabs) from the current position
/// - Parameter state: The block parser state (modified in place)
func parseIndent(state: inout BlockParserState) {
	let src = state.src

	guard state.i < src.count, isSpace(code: src[state.i]) else {
		return
	}

	let start = state.i
	while state.i < src.count {
		let char = src[state.i]

		if char == SPACE_CODE {
			state.indent += 1
		} else if char == TAB_CODE {
			state.indent += 4 - (state.indent % 4)
		} else if isNewLine(code: char) {
			state.hasBlankLine = true
			break
		} else {
			break
		}

		state.i += 1
	}
	state.spaces = charToString(src, from: start, to: state.i)
}

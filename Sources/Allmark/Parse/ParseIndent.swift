import Foundation

/// Parses leading indentation (spaces and tabs) from the current position
/// - Parameter state: The block parser state (modified in place)
func parseIndent(state: inout BlockParserState) {
	let src = state.src

	guard state.i < src.count, isSpace(code: src[state.i]) else {
		return
	}

	while state.i < src.count {
		let char = src[state.i]

		if char == 0x20 /* \s */ {
			state.indent += 1
		} else if char == 0x09 /* \t */ {
			// Set spaces to the next tabstop of 4 characters
			state.indent += 4 - (state.indent % 4)
		} else if isNewLine(code: char) {
			state.hasBlankLine = true
			break
		} else {
			break
		}

		state.i += 1
	}
}

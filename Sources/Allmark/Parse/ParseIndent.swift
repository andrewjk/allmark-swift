import Foundation

/// Parses leading indentation (spaces and tabs) from the current position
/// - Parameter state: The block parser state (modified in place)
func parseIndent(state: inout BlockParserState) {
	let src = state.src

	guard state.i < src.count, isSpace(char: src[state.i]) else {
		return
	}

	while state.i < src.count {
		let char = src[state.i]

		if char == " " {
			state.indent += 1
		} else if char == "\t" {
			// Set spaces to the next tabstop of 4 characters
			state.indent += 4 - (state.indent % 4)
		} else if isNewLine(char: char) {
			state.hasBlankLine = true
			break
		} else {
			break
		}

		state.i += 1
	}
}

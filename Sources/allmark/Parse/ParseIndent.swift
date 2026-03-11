import Foundation

/// Parses leading indentation (spaces and tabs) from the current position
/// - Parameter state: The block parser state (modified in place)
func parseIndent(state: inout BlockParserState) {
	let src = state.src
	let startIndex = src.index(src.startIndex, offsetBy: state.i)
	
	// Check if current character is a space
	guard state.i < src.count && isSpace(code: Int(src.unicodeScalars[startIndex].value)) else {
		return
	}
	
	while state.i < src.count {
		let currentIndex = src.index(src.startIndex, offsetBy: state.i)
		let char = src[currentIndex]
		
		if char == " " {
			state.indent += 1
		} else if char == "\t" {
			// Set spaces to the next tabstop of 4 characters
			state.indent += 4 - (state.indent % 4)
		} else if isNewLine(char: String(char)) {
			state.hasBlankLine = true
			break
		} else {
			break
		}
		
		state.i += 1
	}
}

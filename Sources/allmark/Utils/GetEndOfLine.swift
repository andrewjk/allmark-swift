import Foundation

func getEndOfLine(state: inout BlockParserState) -> Int {
	var endOfLine = state.i
	while endOfLine < state.src.count {
		let index = state.src.index(state.src.startIndex, offsetBy: endOfLine)
		if isNewLine(char: String(state.src[index])) {
			endOfLine += 1
			state.lineStart = endOfLine
			break
		}
		endOfLine += 1
	}
	return endOfLine
}

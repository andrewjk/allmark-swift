import Foundation

func getEndOfLine(state: inout BlockParserState) -> Int {
	var endOfLine = state.i
	while endOfLine < state.src.count {
		let char = state.src[endOfLine]
		if isNewLine(code: char) {
			endOfLine += newlineLength(state.src, endOfLine)
			state.lineStart = endOfLine
			break
		}
		endOfLine += 1
	}
	return endOfLine
}

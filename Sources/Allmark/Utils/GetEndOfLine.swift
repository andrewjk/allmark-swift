import Foundation

func getEndOfLine(state: inout BlockParserState) -> Int {
	var endOfLine = state.i
	while endOfLine < state.src.count {
		if isNewLine(char: state.src[endOfLine]) {
			endOfLine += 1
			state.lineStart = endOfLine
			break
		}
		endOfLine += 1
	}
	return endOfLine
}

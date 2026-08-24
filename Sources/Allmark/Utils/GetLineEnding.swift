import Foundation

func getLineEnding(state: BlockParserState, endOfLine: Int) -> String {
	if endOfLine < state.src.count {
		let code = state.src[endOfLine]
		if code == NEW_LINE_CODE {
			return "\n"
		} else if code == CARRIAGE_RETURN_CODE {
			// Could be \r or \r\n
			if endOfLine + 1 < state.src.count, state.src[endOfLine + 1] == NEW_LINE_CODE {
				return "\r\n"
			}
			return "\r"
		}
	}
	return ""
}

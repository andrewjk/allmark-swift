import Foundation

func movePastMarker(markerLength: Int, state: inout BlockParserState) {
	state.i += markerLength
	if state.i < state.src.count {
		let char = state.src[state.i]
		if char == TAB_CODE, state.i + 1 < state.src.count {
			if state.src[state.i + 1] == TAB_CODE {
				state.indent = 6
				state.i += 2
				return
			}
		}
		if char == SPACE_CODE {
			state.indent = 0
			state.i += 1
		}
	}
}

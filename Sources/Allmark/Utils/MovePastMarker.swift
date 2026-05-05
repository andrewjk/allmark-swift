import Foundation

func movePastMarker(markerLength: Int, state: inout BlockParserState) {
	state.i += markerLength
	if state.i < state.src.count {
		let char = state.src[state.i]
		if char == "\t", state.i + 1 < state.src.count {
			if state.src[state.i + 1] == "\t" {
				state.indent = 6
				state.i += 2
				return
			}
		}
		if char == " " {
			state.indent = 0
			state.i += 1
		}
	}
}

import Foundation

func movePastMarker(markerLength: Int, state: inout BlockParserState) {
	state.i += markerLength
	if state.i < state.src.count {
		let char = state.src[state.i]
		if char == 0x09 /* \t */, state.i + 1 < state.src.count {
			if state.src[state.i + 1] == 0x09 /* \t */ {
				state.indent = 6
				state.i += 2
				return
			}
		}
		if char == 0x20 /* \s */ {
			state.indent = 0
			state.i += 1
		}
	}
}

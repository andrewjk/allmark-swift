import Foundation

func movePastMarker(markerLength: Int, state: inout BlockParserState) {
	state.i += markerLength
	let src = state.src
	if state.i < src.count {
		let index = src.index(src.startIndex, offsetBy: state.i)
		let char = src[index]
		if char == "\t" && state.i + 1 < src.count {
			let nextIndex = src.index(src.startIndex, offsetBy: state.i + 1)
			if src[nextIndex] == "\t" {
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

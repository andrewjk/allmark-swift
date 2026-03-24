import Foundation

let hardBreakRenderer = Renderer(
	name: "hard_break",
	render: { _, state, _, _, _ in
		state.output += "<br />\n"
	}
)

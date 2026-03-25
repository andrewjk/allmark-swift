import Foundation

let hardBreakRenderer = Renderer(
	name: "hard_break",
	render: { _, state, _ in
		state.output += "<br />\n"
	}
)

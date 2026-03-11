import Foundation

@MainActor
let codeFenceRenderer = Renderer(
	name: "code_fence",
	render: renderCodeBlock
)

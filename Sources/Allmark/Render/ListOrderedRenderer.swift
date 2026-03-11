import Foundation

@MainActor
let listOrderedRenderer = Renderer(
	name: "list_ordered",
	render: renderList
)

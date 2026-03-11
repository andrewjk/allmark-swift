import Foundation

@MainActor
let listBulletedRenderer = Renderer(
	name: "list_bulleted",
	render: renderList
)

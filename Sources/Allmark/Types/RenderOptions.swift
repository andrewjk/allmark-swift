import Foundation

/// Options for rendering.
public struct RenderOptions: Sendable {
	/// Optional line width for console table wrapping.
	public var lineWidth: Int?

	public init(lineWidth: Int? = nil) {
		self.lineWidth = lineWidth
	}
}

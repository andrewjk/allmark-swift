import Foundation

/// A link reference definition.
public struct LinkReference {
	/// The URL for the link.
	public var url: String
	/// The title for the link.
	public var title: String

	public init(url: String, title: String) {
		self.url = url
		self.title = title
	}
}

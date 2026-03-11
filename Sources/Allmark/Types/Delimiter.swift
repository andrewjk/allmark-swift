import Foundation

/// An inline delimiter for emphasis/links.
public struct Delimiter {
	/// The delimiter markup (e.g., "*", "_", "[").
	public var markup: String
	/// Starting position in the source.
	public var start: Int
	/// Length of the delimiter.
	public var length: Int
	/// Whether this delimiter has been handled.
	public var handled: Bool?
}

import Foundation

/// A footnote reference definition.
public struct FootnoteReference {
	/// The label for the footnote.
	public var label: String
	/// The content node for the footnote.
	public var content: MarkdownNode
}

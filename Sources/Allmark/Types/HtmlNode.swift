import Foundation

/// The type of a HTML node.
public enum HtmlNodeType: String, Sendable {
	case element
	case text
	case comment
}

/// A HTML node, checked when sanitizing.
public final class HtmlNode: @unchecked Sendable {
	/// The node type: element, text or comment.
	public var type: HtmlNodeType
	/// The lowercase tag name for elements, empty for text and comment nodes.
	public var tag: String
	/// The attributes for an element, in source order, with values already entity-decoded.
	public var attributes: [(name: String, value: String)]
	/// The text content for text, comment and raw text elements (entity-decoded).
	public var text: String
	/// The child nodes for elements.
	public var children: [HtmlNode]
	/// Whether this element is a void element (no children or closing tag).
	public var selfClosing: Bool
	/// The parent node, or nil for the root.
	public weak var parent: HtmlNode?

	/// Creates a new HtmlNode.
	public init(
		type: HtmlNodeType,
		tag: String = "",
		attributes: [(name: String, value: String)] = [],
		text: String = "",
		children: [HtmlNode] = [],
		selfClosing: Bool = false,
		parent: HtmlNode? = nil
	) {
		self.type = type
		self.tag = tag
		self.attributes = attributes
		self.text = text
		self.children = children
		self.selfClosing = selfClosing
		self.parent = parent
	}
}

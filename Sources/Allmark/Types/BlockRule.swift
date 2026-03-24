import Foundation

// TODO: Try to arrange rules so that they don't have to refer to other rules
// e.g. checking for code in lists

/// A rule for parsing block-level Markdown elements.
public struct BlockRule: Sendable {
	/// The name for this rule, which must also be used for nodes created by this rule.
	public var name: String

	/// The names of rules that this node closes.
	// TODO: var closes: [String]

	/// Tests whether a node should start e.g. a block quote should start when we find a '>'.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	/// - Returns: Whether the node should start
	public var testStart: @Sendable (inout BlockParserState, MarkdownNode) -> Bool

	/// Creates a node for this rule.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	// TODO: var createNode: (inout BlockParserState, MarkdownNode) -> Void

	/// Tests whether a node should continue after being started e.g. a block quote should continue if we find a '>'.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	/// - Returns: Whether the node should continue
	public var testContinue: @Sendable (inout BlockParserState, MarkdownNode) -> Bool

	/// Does any cleanup for this rule's node when it is closed.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	public var closeNode: @Sendable (inout BlockParserState, MarkdownNode) -> Void

	public init(
		name: String,
		testStart: @escaping @Sendable (inout BlockParserState, MarkdownNode) -> Bool,
		testContinue: @escaping @Sendable (inout BlockParserState, MarkdownNode) -> Bool,
		closeNode: @escaping @Sendable (inout BlockParserState, MarkdownNode) -> Void
	) {
		self.name = name
		self.testStart = testStart
		self.testContinue = testContinue
		self.closeNode = closeNode
	}
}

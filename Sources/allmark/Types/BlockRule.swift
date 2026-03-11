import Foundation

// TODO: Try to arrange rules so that they don't have to refer to other rules
// e.g. checking for code in lists
// Note: BlockRule is not Sendable because it uses closures with inout parameters
// which cannot be marked as @Sendable. This is acceptable for a single-threaded parser.
@MainActor
struct BlockRule {
	/// The name for this rule, which must also be used for nodes created by this rule.
	var name: String
	
	/// The names of rules that this node closes.
	// TODO: var closes: [String]
	
	/// Tests whether a node should start e.g. a block quote should start when we find a '>'.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	/// - Returns: Whether the node should start
	var testStart: @MainActor (inout BlockParserState, MarkdownNode) -> Bool
	
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
	var testContinue: @MainActor (inout BlockParserState, MarkdownNode) -> Bool
	
	/// Does any cleanup for this rule's node when it is closed.
	/// - Parameters:
	///   - state: The block parser state
	///   - parent: The parent markdown node
	var closeNode: @MainActor (inout BlockParserState, MarkdownNode) -> Void
}

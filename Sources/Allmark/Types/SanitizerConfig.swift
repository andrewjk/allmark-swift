import Foundation

/// A matcher for an attribute value.
public enum SanitizerAttributeMatcher: Sendable {
	/// The value must match the given predicate.
	case pattern(@Sendable (String) -> Bool)
	/// The value must use one of the given URL protocols.
	case protocols([String])
}

/// An attribute rule for a tag. Either:
/// - an attribute name, allowed with any value (URL attributes still get protocol checks)
/// - a tuple of attribute name and a value matcher
public enum SanitizerAttributeRule: Sendable {
	/// Allowed with any value.
	case name(String)
	/// Allowed when the value matches the matcher.
	case matched(String, SanitizerAttributeMatcher)

	/// The lowercase attribute name the rule applies to.
	public var name: String {
		switch self {
		case let .name(name):
			return name
		case let .matched(name, _):
			return name
		}
	}

	/// Returns a copy of the rule with the attribute name lowercased.
	public func lowercasingName() -> SanitizerAttributeRule {
		switch self {
		case let .name(name):
			return .name(name.lowercased())
		case let .matched(name, matcher):
			return .matched(name.lowercased(), matcher)
		}
	}
}

/// Configuration for the HTML sanitizer.
public struct SanitizerConfig: Sendable {
	/// Allowlist of (lowercase) tag names. Disallowed tags are unwrapped, keeping their children.
	public var elements: [String]?
	/// Tags that are removed together with their children.
	public var removeElements: [String]?
	/// Per-tag attribute rules, keyed by tag name. Use "*" for all tags.
	public var attributes: [String: [SanitizerAttributeRule]]?
	/// Whether HTML comments are kept (default: false).
	public var allowComments: Bool?
	/// Whether data-* attributes are kept (default: true).
	public var allowDataAttributes: Bool?
	/// Prefix added to id and name attribute values to prevent DOM clobbering (default: "user-content-").
	public var clobberPrefix: String?

	public init(
		elements: [String]? = nil,
		removeElements: [String]? = nil,
		attributes: [String: [SanitizerAttributeRule]]? = nil,
		allowComments: Bool? = nil,
		allowDataAttributes: Bool? = nil,
		clobberPrefix: String? = nil
	) {
		self.elements = elements
		self.removeElements = removeElements
		self.attributes = attributes
		self.allowComments = allowComments
		self.allowDataAttributes = allowDataAttributes
		self.clobberPrefix = clobberPrefix
	}
}

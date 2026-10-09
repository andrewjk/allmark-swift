import Foundation

private let clobberedAttributes: Set<String> = ["id", "name", "aria-describedby", "aria-labelledby"]

private let urlAttributes: Set<String> = [
	"href",
	"src",
	"cite",
	"longdesc",
	"action",
	"formaction",
	"background",
	"poster",
	"srcset",
	"lowsrc",
	"ping",
	"usemap",
]

private let defaultProtocols = ["http", "https", "irc", "ircs", "mailto", "xmpp", "tel"]

struct CompiledSanitizerConfig {
	var allowComments: Bool
	var allowDataAttributes: Bool
	var clobberPrefix: String
	var elements: Set<String>
	var removeElements: Set<String>
	var globalAttributes: [SanitizerAttributeRule]
	var tagAttributes: [String: [SanitizerAttributeRule]]
}

func filterTree(root: HtmlNode, config: SanitizerConfig) {
	var tagAttributes: [String: [SanitizerAttributeRule]] = [:]
	for (tag, rules) in config.attributes ?? [:] {
		tagAttributes[tag.lowercased()] = rules.map { $0.lowercasingName() }
	}
	let ctx = CompiledSanitizerConfig(
		allowComments: config.allowComments == true,
		allowDataAttributes: config.allowDataAttributes != false,
		clobberPrefix: config.clobberPrefix ?? "",
		elements: Set((config.elements ?? []).map { $0.lowercased() }),
		removeElements: Set((config.removeElements ?? []).map { $0.lowercased() }),
		globalAttributes: (config.attributes?["*"] ?? []).map { $0.lowercasingName() },
		tagAttributes: tagAttributes
	)
	root.children = filterNodes(root.children, ctx)
}

private func filterNodes(_ nodes: [HtmlNode], _ ctx: CompiledSanitizerConfig) -> [HtmlNode] {
	var result: [HtmlNode] = []
	for node in nodes {
		switch node.type {
		case .text:
			result.append(node)
		case .comment:
			if ctx.allowComments {
				result.append(node)
			}
		case .element:
			if ctx.removeElements.contains(node.tag) {
				continue
			}
			if !ctx.elements.contains(node.tag) || !matchesTagName(node.tag) {
				if !node.text.isEmpty {
					result.append(HtmlNode(type: .text, text: node.text, parent: node.parent))
				}
				for child in filterNodes(node.children, ctx) {
					result.append(child)
				}
				continue
			}
			node.attributes = filterAttributes(node: node, ctx: ctx)
			node.children = filterNodes(node.children, ctx)
			result.append(node)
		}
	}
	return result
}

private func filterAttributes(node: HtmlNode, ctx: CompiledSanitizerConfig) -> [(name: String, value: String)] {
	var result: [(name: String, value: String)] = []
	for attribute in node.attributes {
		let name = attribute.name.lowercased()
		let value = attribute.value
		if !matchesAttributeName(name) {
			continue
		}
		if name.hasPrefix("on") {
			continue
		}
		if name.hasPrefix("data-") {
			if ctx.allowDataAttributes {
				result.append((name: name, value: value))
			}
			continue
		}
		guard
			let rule = findAttributeRule(ctx.tagAttributes[node.tag], name)
			?? findAttributeRule(ctx.globalAttributes, name)
		else {
			continue
		}
		if !checkAttributeValue(name: name, value: value, rule: rule) {
			continue
		}
		let finalValue: String
		if clobberedAttributes.contains(name), !value.hasPrefix(ctx.clobberPrefix) {
			finalValue = ctx.clobberPrefix + value
		} else {
			finalValue = value
		}
		result.append((name: name, value: finalValue))
	}
	return result
}

private func findAttributeRule(
	_ rules: [SanitizerAttributeRule]?,
	_ name: String
) -> SanitizerAttributeRule? {
	guard let rules = rules else {
		return nil
	}
	for rule in rules {
		if rule.name == name {
			return rule
		}
	}
	return nil
}

private func checkAttributeValue(name: String, value: String, rule: SanitizerAttributeRule) -> Bool {
	if urlAttributes.contains(name) {
		var protocols = defaultProtocols
		if case let .matched(_, matcher) = rule {
			switch matcher {
			case let .pattern(pattern):
				if !pattern(value) {
					return false
				}
			case let .protocols(allowed):
				protocols = allowed
			}
		}
		return isSafeUrl(name: name, value: value, protocols: protocols)
	}
	switch rule {
	case .name:
		return true
	case let .matched(_, matcher):
		switch matcher {
		case let .pattern(pattern):
			return pattern(value)
		case .protocols:
			return true
		}
	}
}

private func isSafeUrl(name: String, value: String, protocols: [String]) -> Bool {
	let urls: [String]
	if name == "srcset" {
		urls = value.split(separator: ",", omittingEmptySubsequences: false).map(String.init)
	} else {
		urls = [value]
	}
	for url in urls {
		if !isSafeSingleUrl(url.trimmingCharacters(in: .whitespacesAndNewlines), protocols) {
			return false
		}
	}
	return true
}

private func isSafeSingleUrl(_ value: String, _ protocols: [String]) -> Bool {
	let chars = Array(value)
	var schemeEnd = -1
	for (i, c) in chars.enumerated() {
		if c == ":" {
			schemeEnd = i
			break
		}
		if c == "/" || c == "?" || c == "#" {
			break
		}
	}
	if schemeEnd == -1 {
		return true
	}
	var scheme = ""
	for c in chars[0 ..< schemeEnd] {
		if c.unicodeScalars.allSatisfy({ $0.value > 0x20 }) {
			scheme.append(c)
		}
	}
	scheme = scheme.lowercased()
	if !matchesScheme(scheme) {
		return true
	}
	return protocols.contains(scheme)
}

/// Matches the TS regex `^[a-z][a-z0-9-]*$`.
private func matchesTagName(_ tag: String) -> Bool {
	let chars = Array(tag)
	guard let first = chars.first, let code = first.asciiValue, code >= 97 && code <= 122 else {
		return false
	}
	for c in chars.dropFirst() {
		guard let code = c.asciiValue,
		      (code >= 97 && code <= 122) || (code >= 48 && code <= 57) || code == 45
		else {
			return false
		}
	}
	return true
}

/// Matches the TS regex `^[a-zA-Z_][a-zA-Z0-9_.:-]*$`.
private func matchesAttributeName(_ name: String) -> Bool {
	let chars = Array(name)
	guard let first = chars.first, let code = first.asciiValue,
	      (code >= 65 && code <= 90) || (code >= 97 && code <= 122) || code == 95
	else {
		return false
	}
	for c in chars.dropFirst() {
		guard let code = c.asciiValue,
		      (code >= 65 && code <= 90) || (code >= 97 && code <= 122) || (code >= 48 && code <= 57)
		      || code == 95 || code == 46 || code == 58 || code == 45
		else {
			return false
		}
	}
	return true
}

/// Matches the TS regex `^[a-z][a-z0-9+.-]*$`.
private func matchesScheme(_ scheme: String) -> Bool {
	let chars = Array(scheme)
	guard let first = chars.first, let code = first.asciiValue, code >= 97 && code <= 122 else {
		return false
	}
	for c in chars.dropFirst() {
		guard let code = c.asciiValue,
		      (code >= 97 && code <= 122) || (code >= 48 && code <= 57) || code == 43 || code == 46
		      || code == 45
		else {
			return false
		}
	}
	return true
}

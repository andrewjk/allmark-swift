import Foundation

/// Sanitize a HTML string: parse it, filter tags and attributes against the
/// config, and serialize it back to HTML.
/// - Parameters:
///   - html: The HTML string to sanitize.
///   - config: Optional configuration overrides, merged with the default config.
/// - Returns: The sanitized HTML string.
public func sanitize(html: String, config: SanitizerConfig? = nil) -> String {
	let defaults = defaultSanitizerConfig
	let mergedConfig = SanitizerConfig(
		elements: config?.elements ?? defaults.elements,
		removeElements: config?.removeElements ?? defaults.removeElements,
		attributes: config?.attributes ?? defaults.attributes,
		allowComments: config?.allowComments ?? defaults.allowComments,
		allowDataAttributes: config?.allowDataAttributes ?? defaults.allowDataAttributes,
		clobberPrefix: config?.clobberPrefix ?? defaults.clobberPrefix
	)
	let root = parseHtml(content: html)
	filterTree(root: root, config: mergedConfig)
	return serialize(root: root)
}

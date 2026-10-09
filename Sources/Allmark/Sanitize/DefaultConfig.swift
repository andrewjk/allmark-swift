import Foundation

/// The default sanitizer configuration, mirroring GitHub's sanitizer.

let ariaAttributes: [SanitizerAttributeRule] = [
	.name("aria-describedby"),
	.name("aria-label"),
	.name("aria-labelledby"),
]

/// Matches the TS regex `^data-footnote-backref$`.
private func isDataFootnoteBackref(value: String) -> Bool {
	return value == "data-footnote-backref"
}

/// Matches the TS regex `^language-./`.
private func isLanguageClass(value: String) -> Bool {
	return value.count >= 10 && value.hasPrefix("language-")
}

/// Matches the TS regex `^sr-only$`.
private func isSrOnly(value: String) -> Bool {
	return value == "sr-only"
}

/// Matches the TS regex `^task-list-item$`.
private func isTaskListItem(value: String) -> Bool {
	return value == "task-list-item"
}

/// Matches the TS regex `^contains-task-list$`.
private func isContainsTaskList(value: String) -> Bool {
	return value == "contains-task-list"
}

/// Matches the TS regex `^footnotes$`.
private func isFootnotes(value: String) -> Bool {
	return value == "footnotes"
}

/// Matches the TS regex `^checkbox$`.
private func isCheckbox(value: String) -> Bool {
	return value == "checkbox"
}

/// The default sanitizer configuration.
public let defaultSanitizerConfig = SanitizerConfig(
	elements: [
		"a",
		"b",
		"blockquote",
		"br",
		"code",
		"dd",
		"del",
		"details",
		"div",
		"dl",
		"dt",
		"em",
		"h1",
		"h2",
		"h3",
		"h4",
		"h5",
		"h6",
		"hr",
		"i",
		"img",
		"input",
		"ins",
		"kbd",
		"li",
		"ol",
		"p",
		"picture",
		"pre",
		"q",
		"rp",
		"rt",
		"ruby",
		"s",
		"samp",
		"section",
		"source",
		"span",
		"strike",
		"strong",
		"sub",
		"summary",
		"sup",
		"table",
		"tbody",
		"td",
		"tfoot",
		"th",
		"thead",
		"tr",
		"tt",
		"ul",
		"var",
	],
	removeElements: [
		"script",
		"style",
		"noscript",
		"noembed",
		"noframes",
		"iframe",
		"frame",
		"frameset",
		"object",
		"embed",
		"param",
		"applet",
		"template",
		"math",
		"svg",
		"head",
		"base",
		"link",
		"meta",
		"plaintext",
	],
	attributes: [
		"a": ariaAttributes + [
			.name("data-footnote-backref"),
			.name("data-footnote-ref"),
			.matched("class", .pattern(isDataFootnoteBackref)),
			.matched("href", .protocols(["http", "https", "irc", "ircs", "mailto", "xmpp"])),
		],
		"blockquote": [.matched("cite", .protocols(["http", "https"]))],
		"code": [.matched("class", .pattern(isLanguageClass))],
		"del": [.matched("cite", .protocols(["http", "https"]))],
		"div": [.name("itemscope"), .name("itemtype")],
		"dl": ariaAttributes,
		"h2": [.matched("class", .pattern(isSrOnly))],
		"img": ariaAttributes + [
			.matched("longdesc", .protocols(["http", "https"])),
			.matched("src", .protocols(["http", "https"])),
		],
		"input": [.matched("type", .pattern(isCheckbox)), .name("disabled")],
		"ins": [.matched("cite", .protocols(["http", "https"]))],
		"li": [.matched("class", .pattern(isTaskListItem))],
		"ol": ariaAttributes + [.matched("class", .pattern(isContainsTaskList))],
		"q": [.matched("cite", .protocols(["http", "https"]))],
		"section": [.name("data-footnotes"), .matched("class", .pattern(isFootnotes))],
		"source": [.name("srcset")],
		"summary": ariaAttributes,
		"table": ariaAttributes,
		"ul": ariaAttributes + [.matched("class", .pattern(isContainsTaskList))],
		"*": [
			.name("abbr"),
			.name("accept"),
			.name("acceptcharset"),
			.name("accesskey"),
			.name("action"),
			.name("align"),
			.name("alt"),
			.name("axis"),
			.name("border"),
			.name("cellpadding"),
			.name("cellspacing"),
			.name("char"),
			.name("charoff"),
			.name("charset"),
			.name("checked"),
			.name("clear"),
			.name("colspan"),
			.name("color"),
			.name("cols"),
			.name("compact"),
			.name("coords"),
			.name("datetime"),
			.name("dir"),
			.name("enctype"),
			.name("frame"),
			.name("headers"),
			.name("height"),
			.name("hspace"),
			.name("hreflang"),
			.name("htmlfor"),
			.name("id"),
			.name("ismap"),
			.name("itemprop"),
			.name("label"),
			.name("lang"),
			.name("maxlength"),
			.name("media"),
			.name("method"),
			.name("multiple"),
			.name("name"),
			.name("nohref"),
			.name("noshade"),
			.name("nowrap"),
			.name("open"),
			.name("prompt"),
			.name("readonly"),
			.name("rev"),
			.name("rowspan"),
			.name("rows"),
			.name("rules"),
			.name("scope"),
			.name("selected"),
			.name("shape"),
			.name("size"),
			.name("span"),
			.name("start"),
			.name("summary"),
			.name("tabindex"),
			.name("title"),
			.name("usemap"),
			.name("valign"),
			.name("value"),
			.name("width"),
		],
	],
	allowComments: false,
	allowDataAttributes: true,
	clobberPrefix: "user-content-"
)

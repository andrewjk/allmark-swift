import Foundation

/// HTML elements that never have children or a closing tag.
let voidElements: Set<String> = [
	"area",
	"base",
	"br",
	"col",
	"embed",
	"hr",
	"img",
	"input",
	"link",
	"meta",
	"param",
	"source",
	"track",
	"wbr",
]

/// HTML elements whose content is parsed as raw text.
let rawTextElements: Set<String> = [
	"script",
	"style",
	"noscript",
	"noembed",
	"noframes",
	"textarea",
	"title",
	"xmp",
	"iframe",
	"plaintext",
]

/// HTML elements whose raw text content still gets entity-decoded.
let rcdataElements: Set<String> = ["textarea", "title"]

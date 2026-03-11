import Foundation

// A tag name consists of an ASCII letter followed by zero or more ASCII
// letters, digits, or hyphens (-).
let tagName = "[a-zA-Z][a-zA-Z0-9-]*"

// An attribute name consists of an ASCII letter, _, or :, followed by zero or
// more ASCII letters, digits, _, ., :, or -. (Note: This is the XML
// specification restricted to ASCII. HTML5 is laxer.)
let attributeName = "[a-zA-Z_:][a-zA-Z0-9_.:-]*"

// An unquoted attribute value is a nonempty string of characters not including
// whitespace, ", ', =, <, >, or `.
let unquotedValue = "[^\\s\"'=<>`]+"

// A single-quoted attribute value consists of ', zero or more characters not
// including ', and a final '.
let singleQuotedValue = "'[^']+'"

// A double-quoted attribute value consists of ", zero or more characters not
// including ", and a final ".
let doubleQuotedValue = "\"[^\"]+\""

// An attribute value consists of an unquoted attribute value, a single-quoted
// attribute value, or a double-quoted attribute value.
let attributeValue = "(?:\(unquotedValue)|\(singleQuotedValue)|\(doubleQuotedValue))"

// An attribute value specification consists of optional whitespace, a =
// character, optional whitespace, and an attribute value.
let attributeValueSpec = "\\s*=\\s*(?:\(attributeValue))"

// An attribute consists of whitespace, an attribute name, and an optional
// attribute value specification.
let attribute = "\\s(?:\(attributeName))(?:\(attributeValueSpec))*"

// An open tag consists of a < character, a tag name, zero or more attributes,
// optional whitespace, an optional / character, and a > character.
let openTag = "<(?:\(tagName))(?:\(attribute))*\\s*/*>"

// A closing tag consists of the string </, a tag name, optional whitespace, and
// the character >.
let closeTag = "</(?:\(tagName))*\\s*>"

// An HTML comment consists of <!-- + text + -->, where text does not start with
// > or ->, does not end with -, and does not contain --. (See the HTML5 spec.)
let comment = "<!---?>|<!--(?:[^-]|-[^-]|--[^>])*-->"

// A processing instruction consists of the string <?, a string of characters
// not including the string ?>, and the string ?>.
let instruction = "<\\?[^\\?]*\\?>"

// A declaration consists of the string <!, a name consisting of one or more
// uppercase ASCII letters, whitespace, a string of characters not including the
// character >, and the character >.
let declaration = "<![A-Z]+\\s+[^>]+>"

// A CDATA section consists of the string <![CDATA[, a string of characters not
// including the string ]]>, and the string ]]>
let cdata = "<!\\[CDATA\\[.*?\\]\\]>"

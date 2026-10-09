import Foundation

private enum ParseLocation {
	case none
	case elementOpened
	case elementClosing
	case elementOpenName
	case elementCloseName
	case insideElement
	case attributeName
	case afterAttributeName
	case beforeAttributeValue
	case attributeValue
	case insideText
}

/// Lower than the TS `MAX_DEPTH` (500): the recursive filter and serialize passes
/// overflow small test-runner thread stacks (~512 KB) with deep debug-build frames.
private let maxDepth = 100

private struct ParseState {
	var location: ParseLocation = .none
	var start = 0
	var node: HtmlNode
	var depth = 0
	var attributeName = ""
	var quote: Character?
	var attrNeedsDecode = false
	var textNeedsDecode = false
}

func parseHtml(content: String) -> HtmlNode {
	let root = newNode(type: .element, parent: nil)
	let chars = Array(content)
	var state = ParseState(node: root)

	var i = 0
	while i < chars.count {
		let c = chars[i]
		switch state.location {
		case .none:
			if c == "<" {
				state.location = .elementOpened
				state.start = i
			} else {
				let child = newNode(type: .text, parent: state.node)
				state.textNeedsDecode = c == "&"
				state.location = .insideText
				state.start = i
				state.node = child
			}
		case .elementOpened:
			switch c {
			case "/":
				state.location = .elementClosing
			case "!":
				i = parseBang(chars, i, &state)
				state.location = .none
			case "?":
				i = skipToCloseTriangle(chars, i)
				state.location = .none
			default:
				if let code = c.asciiValue, (code >= 65 && code <= 90) || (code >= 97 && code <= 122) {
					let child = newNode(type: .element, parent: state.node)
					state.location = .elementOpenName
					state.start = i
					state.node = child
				} else {
					let child = newNode(type: .text, parent: state.node)
					state.textNeedsDecode = c == "&"
					state.location = .insideText
					state.start = i - 1
					state.node = child
				}
			}
		case .elementClosing:
			if c == ">" {
				state.location = .none
			} else if !isWhitespaceChar(c) && c != "/" {
				state.location = .elementCloseName
				state.start = i
			}
		case .elementCloseName:
			if c == ">" {
				let raw = String(chars[state.start ..< i])
				let tag = tagNamePrefix(raw).lowercased()
				var node = state.node
				var steps = 0
				while node.parent != nil && node.tag != tag {
					node = node.parent!
					steps += 1
				}
				if node.parent != nil {
					state.node = node.parent!
					state.depth -= steps + 1
				}
				state.location = .none
			}
		case .elementOpenName:
			if c == ">" {
				state.node.tag = String(chars[state.start ..< i]).lowercased()
				i = startElement(chars, i, &state)
			} else if isWhitespaceChar(c) || c == "/" {
				state.node.tag = String(chars[state.start ..< i]).lowercased()
				state.location = .insideElement
			}
		case .insideElement:
			if c == ">" {
				i = startElement(chars, i, &state)
			} else if isWhitespaceChar(c) || c == "/" {
				break
			} else {
				state.location = .attributeName
				state.start = i
			}
		case .attributeName:
			if c == "=" {
				state.attributeName = String(chars[state.start ..< i])
				state.location = .beforeAttributeValue
			} else if isWhitespaceChar(c) {
				state.attributeName = String(chars[state.start ..< i])
				state.location = .afterAttributeName
			} else if c == "/" {
				state.attributeName = String(chars[state.start ..< i])
				commitAttribute(&state, "")
				state.location = .insideElement
			} else if c == ">" {
				state.attributeName = String(chars[state.start ..< i])
				commitAttribute(&state, "")
				i = startElement(chars, i, &state)
			}
		case .afterAttributeName:
			if c == "=" {
				state.location = .beforeAttributeValue
			} else if isWhitespaceChar(c) {
				break
			} else if c == "/" {
				commitAttribute(&state, "")
				state.location = .insideElement
			} else if c == ">" {
				commitAttribute(&state, "")
				i = startElement(chars, i, &state)
			} else {
				commitAttribute(&state, "")
				state.location = .attributeName
				state.start = i
			}
		case .beforeAttributeValue:
			if isWhitespaceChar(c) {
				break
			} else if c == "'" || c == "\"" {
				state.quote = c
				state.attrNeedsDecode = false
				state.location = .attributeValue
				state.start = i + 1
			} else if c == ">" {
				commitAttribute(&state, "")
				i = startElement(chars, i, &state)
			} else {
				state.quote = nil
				state.attrNeedsDecode = c == "&"
				state.location = .attributeValue
				state.start = i
			}
		case .attributeValue:
			if c == "'" || c == "\"" {
				if c == state.quote {
					commitAttribute(&state, String(chars[state.start ..< i]))
					state.location = .insideElement
				}
			} else if isWhitespaceChar(c) {
				if state.quote == nil {
					commitAttribute(&state, String(chars[state.start ..< i]))
					state.location = .insideElement
				}
			} else if c == ">" {
				if state.quote == nil {
					commitAttribute(&state, String(chars[state.start ..< i]))
					i = startElement(chars, i, &state)
				}
			} else if c == "&" {
				state.attrNeedsDecode = true
			}
		case .insideText:
			if c == "<" {
				let text = String(chars[state.start ..< i])
				state.node.text = state.textNeedsDecode ? decodeEntities(text: text) : text
				state.node = state.node.parent!
				state.location = .elementOpened
				state.start = i
			} else if c == "&" {
				state.textNeedsDecode = true
			}
		}
		i += 1
	}

	if state.location == .insideText {
		let text = String(chars[state.start ..< chars.count])
		state.node.text = state.textNeedsDecode ? decodeEntities(text: text) : text
	}

	return root
}

private func newNode(type: HtmlNodeType, parent: HtmlNode?) -> HtmlNode {
	let node = HtmlNode(type: type, parent: parent)
	if let parent = parent {
		parent.children.append(node)
	}
	return node
}

private func parseBang(_ chars: [Character], _ i: Int, _ state: inout ParseState) -> Int {
	if i + 2 < chars.count, chars[i + 1] == "-", chars[i + 2] == "-" {
		let textStart = i + 3
		if textStart < chars.count, chars[textStart] == ">" {
			_ = newNode(type: .comment, parent: state.node)
			return textStart
		}
		if textStart + 1 < chars.count, chars[textStart] == "-", chars[textStart + 1] == ">" {
			_ = newNode(type: .comment, parent: state.node)
			return textStart + 1
		}
		if let end = findCommentEnd(chars, textStart) {
			let child = newNode(type: .comment, parent: state.node)
			child.text = String(chars[textStart ..< end.dataEnd])
			return end.next - 1
		}
		return chars.count
	}
	return skipToCloseTriangle(chars, i)
}

private struct CommentEnd {
	var dataEnd: Int
	var next: Int
}

private func findCommentEnd(_ chars: [Character], _ from: Int) -> CommentEnd? {
	let a = indexOf(chars, ["-", "-", ">"], from: from)
	let b = indexOf(chars, ["-", "-", "!", ">"], from: from)
	if a == nil, b == nil {
		return nil
	}
	if let b = b, a == nil || b < a! {
		return CommentEnd(dataEnd: b, next: b + 4)
	}
	return CommentEnd(dataEnd: a!, next: a! + 3)
}

private struct RawTextEnd {
	var textEnd: Int
	var next: Int
}

private func findRawTextEnd(_ chars: [Character], _ from: Int, _ tag: String) -> RawTextEnd {
	let tagChars = Array(tag)
	var search = from
	while true {
		guard let lt = indexOf(chars, ["<"], from: search) else {
			return RawTextEnd(textEnd: chars.count, next: chars.count)
		}
		if lt + 1 >= chars.count {
			return RawTextEnd(textEnd: chars.count, next: chars.count)
		}
		if chars[lt + 1] != "/" {
			search = lt + 1
			continue
		}
		var matched = true
		for t in 0 ..< tagChars.count {
			let index = lt + 2 + t
			guard index < chars.count, lowerAscii(chars[index]) == tagChars[t] else {
				matched = false
				break
			}
		}
		if !matched {
			search = lt + 1
			continue
		}
		let afterIndex = lt + 2 + tagChars.count
		let after: Character? = afterIndex < chars.count ? chars[afterIndex] : nil
		if after == ">" || after == "/" || (after.map(isWhitespaceChar) ?? false) {
			let gt = indexOf(chars, [">"], from: lt)
			return RawTextEnd(textEnd: lt, next: gt == nil ? chars.count : gt! + 1)
		}
		search = lt + 1
	}
}

private func startElement(_ chars: [Character], _ i: Int, _ state: inout ParseState) -> Int {
	let node = state.node
	let parent = node.parent!
	if voidElements.contains(node.tag) {
		node.selfClosing = true
		state.node = parent
		state.location = .none
		return i
	}
	if state.depth >= maxDepth {
		parent.children.removeLast()
		state.node = parent
		state.location = .none
		return i
	}
	if rawTextElements.contains(node.tag) {
		let close = findRawTextEnd(chars, i + 1, node.tag)
		let raw = String(chars[(i + 1) ..< close.textEnd])
		node.text = rcdataElements.contains(node.tag) ? decodeAttributeEntities(raw) : raw
		state.node = parent
		state.location = .none
		return close.next - 1
	}
	state.depth += 1
	state.location = .none
	return i
}

private func commitAttribute(_ state: inout ParseState, _ rawValue: String) {
	let name = state.attributeName.lowercased()
	state.attributeName = ""
	if name.isEmpty {
		return
	}
	if !state.node.attributes.contains(where: { $0.name == name }) {
		let value = state.attrNeedsDecode ? decodeAttributeEntities(rawValue) : rawValue
		state.node.attributes.append((name: name, value: value))
	}
}

private func tagNamePrefix(_ raw: String) -> String {
	for (j, c) in raw.enumerated() {
		if let code = c.asciiValue, isWhitespaceCode(code) || code == SLASH_CODE {
			return String(raw.prefix(j))
		}
	}
	return raw
}

private func skipToCloseTriangle(_ chars: [Character], _ i: Int) -> Int {
	return indexOf(chars, [">"], from: i) ?? chars.count
}

private func isWhitespaceChar(_ c: Character) -> Bool {
	guard let code = c.asciiValue else {
		return false
	}
	return isWhitespaceCode(code)
}

private func isWhitespaceCode(_ code: UInt8) -> Bool {
	return code == SPACE_CODE || code == TAB_CODE || code == CARRIAGE_RETURN_CODE
		|| code == NEW_LINE_CODE || code == 0x0C
}

private func lowerAscii(_ c: Character) -> Character {
	guard let code = c.asciiValue, code >= 65 && code <= 90 else {
		return c
	}
	return Character(UnicodeScalar(code + 32))
}

private func indexOf(_ haystack: [Character], _ needle: [Character], from: Int) -> Int? {
	guard !needle.isEmpty else {
		return from
	}
	if from >= haystack.count {
		return nil
	}
	let limit = haystack.count - needle.count
	var i = from
	while i <= limit {
		var matched = true
		for offset in 0 ..< needle.count {
			if haystack[i + offset] != needle[offset] {
				matched = false
				break
			}
		}
		if matched {
			return i
		}
		i += 1
	}
	return nil
}

func decodeAttributeEntities(_ text: String) -> String {
	var result = decodeEntities(text: text)
	if result.contains("&") {
		result = replaceNumericEntities(result)
	}
	return result
}

/// Replaces numeric character references with optional trailing semicolons,
/// mirroring the TS regex `/&#(\d+|[xX][a-fA-F0-9]+);?/g`.
private func replaceNumericEntities(_ text: String) -> String {
	let chars = Array(text)
	var result = ""
	result.reserveCapacity(chars.count)
	var i = 0
	while i < chars.count {
		let c = chars[i]
		if c != "&" || i + 1 >= chars.count || chars[i + 1] != "#" {
			result.append(c)
			i += 1
			continue
		}
		var j = i + 2
		var isHex = false
		if j < chars.count, chars[j] == "x" || chars[j] == "X" {
			isHex = true
			j += 1
		}
		let digitsStart = j
		while j < chars.count, isDigitChar(chars[j], hex: isHex) {
			j += 1
		}
		let digitsEnd = j
		if digitsEnd == digitsStart {
			result.append(c)
			i += 1
			continue
		}
		var next = digitsEnd
		if next < chars.count, chars[next] == ";" {
			next += 1
		}
		let digits = String(chars[digitsStart ..< digitsEnd])
		let num = isHex ? Int(digits, radix: 16) : Int(digits)
		if let num = num, num > 0, num <= 0x10FFFF {
			// Mirrors String.fromCharCode, which truncates to 16 bits
			let truncated = num & 0xFFFF
			if let scalar = UnicodeScalar(truncated) {
				result.append(Character(scalar))
			} else {
				result.append("\u{FFFD}")
			}
		} else {
			result.append(contentsOf: chars[i ..< next])
		}
		i = next
	}
	return result
}

private func isDigitChar(_ c: Character, hex: Bool) -> Bool {
	guard let code = c.asciiValue else {
		return false
	}
	if code >= 48 && code <= 57 {
		return true
	}
	if hex {
		return (code >= 65 && code <= 70) || (code >= 97 && code <= 102)
	}
	return false
}

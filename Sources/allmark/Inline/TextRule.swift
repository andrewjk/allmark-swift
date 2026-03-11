import Foundation

@MainActor
let textRule = InlineRule(
	name: "text",
	test: testText
)

/**
 * The text inline rule handles any character that hasn't been handled by a
 * previous rule
 */
func testText(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	let src = state.src
	guard state.i < src.count else { return false }
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	// TODO: Should this be in the testEscaped rule?
	// "Any ASCII punctuation character may be backslash-escaped"
	//if (char == "\\" && isPunctuation(code: Int(src[src.index(src.startIndex, offsetBy: state.i + 1)].asciiValue ?? 0))) {
	//	state.i += 1
	//	let newIndex = src.index(src.startIndex, offsetBy: state.i)
	//	char = src[newIndex]
	//}
	
	var lastNode = parent.children?.last
	if lastNode == nil || lastNode?.type != "text" {
		let newTextNode = MarkdownNode(
			type: "text",
			block: false,
			index: state.i,
			line: state.line,
			column: 1,
			markup: "",
			indent: 0,
			children: nil
		)
		parent.children?.append(newTextNode)
		lastNode = newTextNode
	} else if isNewLine(char: String(char)) {
		// "Spaces at the end of the line and beginning of the next line are removed"
		if let last = lastNode {
            last.markup = last.markup.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
			if let count = parent.children?.count, count > 0 {
				parent.children?[count - 1] = last
			}
		}
	}
	
	let code = Int(char.asciiValue ?? 0)
	if isAlphaNumeric(code: code) {
		// If this an alphanumeric character, we can just process the whole
		// word, and save checking a bunch of characters that are never going to
		// match anything
		let start = state.i
		state.i += 1
		while state.i < src.count {
			let nextCode = Int(src[src.index(src.startIndex, offsetBy: state.i)].asciiValue ?? 0)
			if isAlphaNumeric(code: nextCode) {
				state.i += 1
			} else {
				break
			}
		}
		let startIndex = src.index(src.startIndex, offsetBy: start)
		let endIndex = src.index(src.startIndex, offsetBy: state.i)
		if let last = lastNode {
			last.markup += String(src[startIndex..<endIndex])
			if let count = parent.children?.count, count > 0 {
				parent.children?[count - 1] = last
			}
		}
	} else {
		state.i += 1
		if let last = lastNode {
			last.markup += String(char)
			if let count = parent.children?.count, count > 0 {
				parent.children?[count - 1] = last
			}
		}
	}
	
	return true
}

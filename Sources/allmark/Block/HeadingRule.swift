import Foundation

/// An ATX heading consists of a string of characters, parsed as inline content,
/// between an opening sequence of 1-6 unescaped # characters and an optional
/// closing sequence of any number of unescaped # characters.
@MainActor
let headingRule = BlockRule(
	name: "heading",
	testStart: testHeadingStart,
	testContinue: testHeadingContinue,
	closeNode: { _, _ in }
)

@MainActor
func testHeadingStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && char == "#" && !isEscaped(text: src, i: state.i) {
		var level = 1
		var j = state.i + 1
		
		while j < src.count {
			let jIndex = src.index(src.startIndex, offsetBy: j)
			if src[jIndex] == "#" {
				level += 1
			} else {
				break
			}
			j += 1
		}
		
		if level < 7 && state.i + level < src.count {
			let spaceIndex = src.index(src.startIndex, offsetBy: state.i + level)
			if isSpace(code: Int(src[spaceIndex].asciiValue ?? 0)) {
				var closedNode: MarkdownNode? = nil
				var currentParent = parent
				
				// If there's an open paragraph, close it
				if currentParent.type == "paragraph" {
					closedNode = state.openNodes.popLast()
					currentParent = state.openNodes.last!
				}
				
				if closedNode != nil {
					closeNode(state: &state, node: closedNode!)
				}
				
				let heading = MarkdownNode(
					type: "heading",
					block: true,
					index: state.i,
					line: state.line,
					column: 1,
					markup: String(repeating: "#", count: level),
					indent: 0,
					children: []
				)
				
				if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
					let lastChild = currentParent.children![currentParent.children!.count - 1]
					lastChild.blankAfter = true
					state.hasBlankLine = false
				}
				
				currentParent.children!.append(heading)
				
				// HACK: ignore optional end heading marks and spaces, destructively
				state.i += level
				let endOfLine = getEndOfLine(state: &state)
				var end = endOfLine - 1
				
				while end >= state.i {
					let endIndex = src.index(src.startIndex, offsetBy: end)
					if !isSpace(code: Int(src[endIndex].asciiValue ?? 0)) {
						break
					}
					end -= 1
				}
				
				while end >= state.i {
					let endIndex = src.index(src.startIndex, offsetBy: end)
					if src[endIndex] != "#" {
						if src[endIndex] == "\\" || !isSpace(code: Int(src[endIndex].asciiValue ?? 0)) {
							end = endOfLine - 1
						}
						break
					}
					end -= 1
				}
				
				let contentStart = src.index(src.startIndex, offsetBy: state.i)
				let contentEnd = src.index(src.startIndex, offsetBy: end + 1)
				heading.content = String(src[contentStart..<contentEnd])
				state.i = endOfLine
				
				return true
			}
		}
	}
	
	return false
}

func testHeadingContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	return false
}

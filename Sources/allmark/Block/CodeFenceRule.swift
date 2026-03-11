import Foundation

/// A code fence is a sequence of at least three consecutive backtick characters
/// (`) or tildes (~).
@MainActor
let codeFenceRule = BlockRule(
	name: "code_fence",
	testStart: testCodeFenceStart,
	testContinue: testCodeFenceContinue,
	closeNode: { _, _ in }
)

@MainActor
func testCodeFenceStart(state: inout BlockParserState, parent: MarkdownNode) -> Bool {
	// A fenced code block can't be started in a block that accepts content
	if parent.acceptsContent {
		return false
	}
	
	let src = state.src
	if state.i >= src.count {
		return false
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && (char == "`" || char == "~") {
		var matched = 1
		var end = state.i + 1
		var haveSpace = false
		
		while end < src.count {
			let endIndex = src.index(src.startIndex, offsetBy: end)
			let nextChar = src[endIndex]
			
			if nextChar == char {
				if haveSpace {
					return false
				}
				matched += 1
			} else if isNewLine(char: String(nextChar)) {
				break
			} else if isSpace(code: Int(nextChar.asciiValue ?? 0)) {
				haveSpace = true
			} else {
				break
			}
			end += 1
		}
		
		if matched >= 3 {
			var closedNode: MarkdownNode? = nil
			var currentParent = parent
			
			let markup = String(repeating: char, count: matched)
			
			var info = ""
			if src.indices.contains(src.index(src.startIndex, offsetBy: state.i + matched)), !isNewLine(char: String(src[src.index(src.startIndex, offsetBy: state.i + matched)])) {
				end = getEndOfLine(state: &state)
				let infoStart = src.index(src.startIndex, offsetBy: state.i + matched)
				let infoEnd = src.index(src.startIndex, offsetBy: end)
				info = String(src[infoStart..<infoEnd])
				
				// Info strings for backtick code blocks cannot contain backticks
				if char == "`" && info.contains("`") {
					return false
				}
				
				info = decodeEntities(text: info)
				info = escapeBackslashes(text: info)
			} else {
				end += 1
			}
			
			if state.maybeContinue {
				state.maybeContinue = false
				var i = state.openNodes.count - 1
				while i > 0 {
					let node = state.openNodes[i]
					if node.maybeContinuing {
						node.maybeContinuing = false
						closedNode = node
						state.openNodes.removeSubrange(i...)
						break
					}
					i -= 1
				}
				currentParent = state.openNodes.last!
			}
			
			// If there's an open paragraph, close it
			if currentParent.type == "paragraph" {
				closedNode = state.openNodes.popLast()
				currentParent = state.openNodes.last!
			}
			
			if closedNode != nil {
				closeNode(state: &state, node: closedNode!)
			}
			
			let code = MarkdownNode(
				type: "code_fence",
				block: true,
				index: state.i,
				line: state.line,
				column: 1,
				markup: markup,
				indent: state.indent,
				children: []
			)
			code.acceptsContent = true
			code.info = info
			
			state.i = end
			
			if state.hasBlankLine && currentParent.children != nil && !currentParent.children!.isEmpty {
				let lastChild = currentParent.children![currentParent.children!.count - 1]
				lastChild.blankAfter = true
				state.hasBlankLine = false
			}
			
			currentParent.children!.append(code)
			state.openNodes.append(code)
			
			return true
		}
	}
	
	return false
}

func testCodeFenceContinue(state: inout BlockParserState, node: MarkdownNode) -> Bool {
	if state.hasBlankLine {
		node.content += String(repeating: " ", count: state.indent)
		return true
	}
	
	let src = state.src
	if state.i >= src.count {
		return true
	}
	
	let index = src.index(src.startIndex, offsetBy: state.i)
	let char = src[index]
	
	if state.indent <= 3 && (char == "`" || char == "~") {
		// This might be a closing fence
		if node.markup.hasPrefix(String(char)) {
			var endMatched = 0
			var end = state.i
			
			while end < src.count {
				let endIndex = src.index(src.startIndex, offsetBy: end)
				let nextChar = src[endIndex]
				
				if nextChar == char {
					endMatched += 1
				} else {
					break
				}
				end += 1
			}
			
			if endMatched >= node.markup.count {
				// Closing code fences cannot have info strings
				while end < src.count {
					let endIndex = src.index(src.startIndex, offsetBy: end)
					let nextChar = src[endIndex]
					
					if isNewLine(char: String(nextChar)) {
						break
					} else if isSpace(code: Int(nextChar.asciiValue ?? 0)) {
						end += 1
					} else {
						return true
					}
				}
				
				state.i = end
				return false
			}
		}
	}
	
	return true
}

import Foundation

/// Returns the number of consecutive space/whitespace bytes starting at `i`.
func consumeSpaces(text: [UInt8], i: Int) -> Int {
	var index = i
	while index < text.count, isSpace(code: text[index]) {
		index += 1
	}
	return index - i
}

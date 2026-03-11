import Foundation

func skipSpaces(text: String, start: Int) -> Int {
	var index = start
	while index < text.count {
		let charIndex = text.index(text.startIndex, offsetBy: index)
		if !isSpace(code: Int(text[charIndex].asciiValue ?? 0)) {
			break
		}
		index += 1
	}
	return index
}

import Foundation

func skipSpaces(text: [UInt8], start: Int) -> Int {
	var index = start
	while index < text.count {
		if !isSpace(code: text[index]) {
			break
		}
		index += 1
	}
	return index
}

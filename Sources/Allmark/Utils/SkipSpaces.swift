import Foundation

func skipSpaces(text: [Character], start: Int) -> Int {
	var index = start
	while index < text.count {
		if !isSpace(char: text[index]) {
			break
		}
		index += 1
	}
	return index
}

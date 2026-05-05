import Foundation

func consumeSpaces(text: [Character], i: Int) -> String {
	var result = ""
	var index = i
	while index < text.count {
		let char = text[index]
		if isSpace(char: char) {
			result.append(char)
			index += 1
		} else {
			break
		}
	}
	return result
}

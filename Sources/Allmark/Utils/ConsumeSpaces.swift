import Foundation

func consumeSpaces(text: [UInt8], i: Int) -> String {
	var result = ""
	var index = i
	while index < text.count {
		let char = text[index]
		if isSpace(code: char) {
			result.append(Character(UnicodeScalar(char)))
			index += 1
		} else {
			break
		}
	}
	return result
}

import Foundation

func consumeSpaces(text: String, i: Int) -> String {
	var result = ""
	var index = i
	while index < text.count {
		let char = text[text.index(text.startIndex, offsetBy: index)]
		if isSpace(code: Int(char.asciiValue ?? 0)) {
			result.append(char)
			index += 1
		} else {
			break
		}
	}
	return result
}

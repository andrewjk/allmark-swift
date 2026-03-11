import Foundation

func escapeBackslashes(text: String) -> String {
	var result = ""
	var i = 0
	while i < text.count {
		let index = text.index(text.startIndex, offsetBy: i)
		let char = text[index]
		if char == "\\" && i + 1 < text.count {
			let nextIndex = text.index(text.startIndex, offsetBy: i + 1)
			let nextChar = text[nextIndex]
			if isPunctuation(code: text.unicodeScalars[nextIndex].value) {
				i += 1
				result.append(nextChar)
			} else {
				result.append(char)
			}
		} else {
			result.append(char)
		}
		i += 1
	}
	return result
}

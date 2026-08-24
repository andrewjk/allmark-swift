import Foundation

func escapeBackslashes(text: String) -> String {
	var result = ""
	result.reserveCapacity(text.count)
	var i = text.startIndex
	let end = text.endIndex
	while i < end {
		let char = text[i]
		if char == "\\" {
			let next = text.index(after: i)
			if next < end, isPunctuation(code: text.unicodeScalars[next].value) {
				i = next
				result.append(text[i])
			} else {
				result.append(char)
			}
		} else {
			result.append(char)
		}
		i = text.index(after: i)
	}
	return result
}

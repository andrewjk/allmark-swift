import Foundation

func escapePunctuation(text: String) -> String {
	// Fast path: no backslashes means nothing to unescape
	if !text.contains("\\") {
		return text
	}

	// Replace \ followed by punctuation with just the punctuation
	var result = ""
	result.reserveCapacity(text.count)
	var i = text.startIndex
	let end = text.endIndex
	while i < end {
		let char = text[i]
		if char == "\\" {
			let next = text.index(after: i)
			if next < end, let code = text[next].asciiValue, isPunctuation(code: UInt32(code)) {
				result.append(text[next])
				i = text.index(after: next)
				continue
			}
		}
		result.append(char)
		i = text.index(after: i)
	}
	return result
}

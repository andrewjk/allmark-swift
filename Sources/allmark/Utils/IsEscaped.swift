import Foundation

func isEscaped(text: String, i: Int) -> Bool {
	if i == 0 {
		return false
	}
	let prevIndex = text.index(text.startIndex, offsetBy: i - 1)
	let prevPrevIndex = i > 1 ? text.index(text.startIndex, offsetBy: i - 2) : text.startIndex
	return text[prevIndex] == "\\" && (i <= 1 || text[prevPrevIndex] != "\\")
}

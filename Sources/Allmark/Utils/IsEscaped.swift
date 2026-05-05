@inlinable func isEscaped(text: [Character], i: Int) -> Bool {
	if i == 0 {
		return false
	}
	return text[i - 1] == "\\" && (i <= 1 || text[i - 2] != "\\")
}

@inlinable func isEscaped(text: String, i: Int) -> Bool {
	if i == 0 {
		return false
	}
	let chars = Array(text)
	return isEscaped(text: chars, i: i)
}

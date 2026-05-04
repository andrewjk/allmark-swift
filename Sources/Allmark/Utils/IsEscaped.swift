@inlinable func isEscaped(text: [UInt8], i: Int) -> Bool {
	if i == 0 {
		return false
	}
	return text[i - 1] == 0x5C /* \ */ && (i <= 1 || text[i - 2] != 0x5C /* \ */ )
}

func isEscaped(text: String, i: Int) -> Bool {
	if i == 0 {
		return false
	}
	let chars = Array(text.utf8)
	return chars[i - 1] == 0x5C /* \ */ && (i <= 1 || chars[i - 2] != 0x5C /* \ */ )
}

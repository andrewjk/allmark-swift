@inlinable func isWhitespace(code: Character) -> Bool {
	switch code {
	case " ", "\t", "\n", "\r":
		return true
	case "\r\n":
		return true
	default:
		return false
	}
}

@inlinable func isWhitespace(code: UInt8) -> Bool {
	switch code {
	case TAB_CODE, NEW_LINE_CODE, 0x0B, 0x0C, CARRIAGE_RETURN_CODE, SPACE_CODE:
		return true
	default:
		return false
	}
}

@inlinable func hasNonWhitespace(_ text: String) -> Bool {
	for char in text {
		if !isWhitespace(code: char) {
			return true
		}
	}
	return false
}

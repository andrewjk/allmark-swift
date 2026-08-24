@inlinable func isNewLine(char: Character) -> Bool {
	return char == "\n" || char == "\r\n" || char == "\r"
}

@inlinable func isNewLine(code: UInt8) -> Bool {
	return code == NEW_LINE_CODE || code == CARRIAGE_RETURN_CODE
}

/// Number of bytes in the line ending at position `i` (2 for `\r\n`, else 1).
@inlinable func newlineLength(_ bytes: [UInt8], _ i: Int) -> Int {
	if bytes[i] == CARRIAGE_RETURN_CODE, i + 1 < bytes.count, bytes[i + 1] == NEW_LINE_CODE {
		return 2
	}
	return 1
}

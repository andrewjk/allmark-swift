@inlinable func isWhitespace(code: Character) -> Bool {
	return code == " " || code == "\t" || code == "\n" || code == "\r\n" || code == "\r"
}

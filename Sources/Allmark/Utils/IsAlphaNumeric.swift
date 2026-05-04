@inlinable func isAlpha(code: UInt8) -> Bool {
	return (code > 64 && code < 91) || (code > 96 && code < 123)
}

@inlinable func isNumeric(code: UInt8) -> Bool {
	return code > 47 && code < 58
}

@inlinable func isAlphaNumeric(code: UInt8) -> Bool {
	return isAlpha(code: code) || isNumeric(code: code)
}

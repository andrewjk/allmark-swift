@inlinable func isAlpha(code: UInt8) -> Bool {
	return (code > 64 && code < 91) || (code > 96 && code < 123)
}

@inlinable func isAlpha(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isAlpha(code: code)
}

@inlinable func isNumeric(code: UInt8) -> Bool {
	return code > 47 && code < 58
}

@inlinable func isNumeric(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isNumeric(code: code)
}

@inlinable func isAlphaNumeric(code: UInt8) -> Bool {
	return isAlpha(code: code) || isNumeric(code: code)
}

@inlinable func isAlphaNumeric(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isAlphaNumeric(code: code)
}

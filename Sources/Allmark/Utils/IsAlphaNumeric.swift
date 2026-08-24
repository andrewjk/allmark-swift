@inlinable func isAlpha(code: UInt8) -> Bool {
	return (code > AT_SIGN_CODE && code < BRACKET_OPEN_CODE) || (code > BACKTICK_CODE && code < BRACE_LEFT_CODE)
}

@inlinable func isAlpha(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isAlpha(code: code)
}

@inlinable func isNumeric(code: UInt8) -> Bool {
	return code >= DIGIT_0_CODE && code <= DIGIT_9_CODE
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

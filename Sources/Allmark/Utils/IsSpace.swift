@inlinable func isSpace(code: UInt8) -> Bool {
	switch code {
	case TAB_CODE /* \t */,
	     NEW_LINE_CODE /* \n */,
	     0x0B,
	     0x0C,
	     CARRIAGE_RETURN_CODE /* \r */,
	     SPACE_CODE /* \s */:
		return true
	default:
		return false
	}
}

@inlinable func isSpace(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isSpace(code: code)
}

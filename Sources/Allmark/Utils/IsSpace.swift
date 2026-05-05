@inlinable func isSpace(code: UInt8) -> Bool {
	switch code {
	case 0x09 /* \t */,
	     0x0A /* \n */,
	     0x0B,
	     0x0C,
	     0x0D /* \r */,
	     0x20 /* \s */:
		return true
	default:
		return false
	}
}

@inlinable func isSpace(char: Character) -> Bool {
	guard let code = char.asciiValue else { return false }
	return isSpace(code: code)
}

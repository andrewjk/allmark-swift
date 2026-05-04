@inlinable func isWhitespace(code: UInt8) -> Bool {
	return code == 0x20 /* \s */ || code == 0x09 /* \t */ || code == 0x0A /* \n */ || code == 0x0D /* \r */
}

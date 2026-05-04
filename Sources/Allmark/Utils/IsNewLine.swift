
@inlinable func isNewLine(code: UInt8) -> Bool {
	return code == 0x0D /* \r */ || code == 0x0A /* \n */
}

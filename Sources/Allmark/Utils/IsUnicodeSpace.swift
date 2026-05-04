@inlinable func isUnicodeSpace(code: UInt32) -> Bool {
	switch code {
	case 0x09 /* \t */,
	     0x0A /* \n */,
	     0x0B,
	     0x0C,
	     0x0D /* \r */,
	     0x20 /* \s */,
	     0xA0:
		return true
	default:
		return false
	}
}

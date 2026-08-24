@inlinable func isUnicodeSpace(code: UInt32) -> Bool {
	switch code {
	case UInt32(TAB_CODE) /* \t */,
	     UInt32(NEW_LINE_CODE) /* \n */,
	     0x0B,
	     0x0C,
	     UInt32(CARRIAGE_RETURN_CODE) /* \r */,
	     UInt32(SPACE_CODE) /* \s */,
	     0xA0:
		return true
	default:
		return false
	}
}

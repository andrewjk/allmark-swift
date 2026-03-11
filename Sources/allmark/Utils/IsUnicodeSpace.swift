import Foundation

func isUnicodeSpace(code: UInt32) -> Bool {
	switch code {
	case 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x20, 0xa0:
		return true
	default:
		return false
	}
}

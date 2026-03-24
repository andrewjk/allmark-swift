import Foundation

func isUnicodeSpace(code: UInt32) -> Bool {
	switch code {
	case 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x20, 0xA0:
		return true
	default:
		return false
	}
}

import Foundation

/// Decodes the Unicode scalar at byte position `i` in a UTF-8 byte array.
/// For ASCII bytes this returns the byte value directly. For multi-byte
/// sequences it decodes the full code point.
@inlinable func scalarValue(_ bytes: [UInt8], _ i: Int) -> UInt32 {
	let b = bytes[i]
	if b < 0x80 {
		return UInt32(b)
	}
	if b >= 0xC2 && b <= 0xDF, i + 1 < bytes.count {
		return (UInt32(b & 0x1F) << 6) | UInt32(bytes[i + 1] & 0x3F)
	}
	if b >= 0xE0 && b <= 0xEF, i + 2 < bytes.count {
		return (UInt32(b & 0x0F) << 12) | (UInt32(bytes[i + 1] & 0x3F) << 6) | UInt32(bytes[i + 2] & 0x3F)
	}
	if b >= 0xF0 && b <= 0xF4, i + 3 < bytes.count {
		return (UInt32(b & 0x07) << 18) | (UInt32(bytes[i + 1] & 0x3F) << 12)
			| (UInt32(bytes[i + 2] & 0x3F) << 6) | UInt32(bytes[i + 3] & 0x3F)
	}
	return UInt32(b)
}

/// Returns the String for a single byte (assumes ASCII).
@inlinable func byteString(_ byte: UInt8) -> String {
	return String(UnicodeScalar(byte))
}

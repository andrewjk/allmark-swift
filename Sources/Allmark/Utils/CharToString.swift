import Foundation

@inlinable func charToString(_ bytes: [UInt8], from: Int, to: Int) -> String {
	return String(decoding: bytes[from ..< to], as: UTF8.self)
}

@inlinable func charToString(_ bytes: [UInt8], from: Int) -> String {
	return String(decoding: bytes[from...], as: UTF8.self)
}

@inlinable func charToString(_ string: String, from: Int, to: Int) -> String {
	let start = string.index(string.startIndex, offsetBy: from)
	let end = string.index(string.startIndex, offsetBy: to)
	return String(string[start ..< end])
}

/// The index of the end of the line starting at `from` (not including the newline).
@inlinable func endOfLineIndex(_ bytes: [UInt8], _ from: Int) -> Int {
	var end = from
	while end < bytes.count, !isNewLine(code: bytes[end]) {
		end += 1
	}
	return end
}

/// Removes trailing ASCII whitespace from a string (equivalent to `\s+$`).
func trimTrailingWhitespace(_ text: String) -> String {
	var end = text.endIndex
	while end > text.startIndex {
		let prev = text.index(before: end)
		let char = text[prev]
		if char == " " || char == "\t" || char == "\n" || char == "\r\n" || char == "\r" || char == "\u{0B}" || char == "\u{0C}" {
			end = prev
		} else {
			break
		}
	}
	return String(text[..<end])
}

import Foundation

@inlinable func charToString(_ chars: [UInt8], from: Int, to: Int) -> String {
	return String(bytes: chars[from ..< to], encoding: .utf8)!
}

@inlinable func charToString(_ chars: [UInt8], from: Int) -> String {
	return String(bytes: chars[from...], encoding: .utf8)!
}

@inlinable func charToString(_ string: String, from: Int, to: Int) -> String {
	let start = string.index(string.startIndex, offsetBy: from)
	let end = string.index(string.startIndex, offsetBy: to)
	return String(string[start ..< end])
}

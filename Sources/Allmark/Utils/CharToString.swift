import Foundation

@inlinable func charToString(_ chars: [Character], from: Int, to: Int) -> String {
	return String(chars[from ..< to])
}

@inlinable func charToString(_ chars: [Character], from: Int) -> String {
	return String(chars[from...])
}

@inlinable func charToString(_ string: String, from: Int, to: Int) -> String {
	let start = string.index(string.startIndex, offsetBy: from)
	let end = string.index(string.startIndex, offsetBy: to)
	return String(string[start ..< end])
}

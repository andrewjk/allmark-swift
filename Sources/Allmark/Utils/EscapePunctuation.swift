import Foundation

func escapePunctuation(text: String) -> String {
	// Replace \ followed by punctuation with just the punctuation
	let pattern = "\\\\([!\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~])"
	guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
		return text
	}
	let range = NSRange(location: 0, length: text.utf16.count)
	return regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "$1")
}

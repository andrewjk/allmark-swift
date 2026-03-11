import Foundation

func normalizeLabel(text: String) -> String {
	return text.lowercased().uppercased().trimmingCharacters(in: .whitespacesAndNewlines)
		.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
}

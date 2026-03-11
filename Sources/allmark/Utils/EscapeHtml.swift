import Foundation

func escapeHtml(text: String) -> String {
	var result = ""
	for char in text {
		switch char {
		case "&":
			result.append("&amp;")
		case "<":
			result.append("&lt;")
		case ">":
			result.append("&gt;")
		case "\"":
			result.append("&quot;")
		default:
			result.append(char)
		}
	}
	return result
}

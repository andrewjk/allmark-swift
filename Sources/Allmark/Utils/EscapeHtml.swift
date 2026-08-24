import Foundation

func escapeHtml(text: String) -> String {
	// Fast path: nothing to escape, return the original string
	var needsEscaping = false
	for byte in text.utf8 {
		if byte == AMPERSAND_CODE || byte == ANGLE_LEFT_CODE || byte == ANGLE_RIGHT_CODE || byte == QUOTE_DOUBLE_CODE { // & < > "
			needsEscaping = true
			break
		}
	}
	if !needsEscaping {
		return text
	}

	var result = ""
	result.reserveCapacity(text.count + 4)
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

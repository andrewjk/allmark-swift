import Foundation

func isAlpha(code: Int) -> Bool {
	return (code > 64 && code < 91) || (code > 96 && code < 123)
}

func isNumeric(code: Int) -> Bool {
	return code > 47 && code < 58
}

func isAlphaNumeric(code: Int) -> Bool {
	return isAlpha(code: code) || isNumeric(code: code)
}

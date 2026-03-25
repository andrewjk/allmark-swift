import Foundation

let extendedAutolinkRule = InlineRule(
	name: "extended_autolink",
	test: testExtendedAutolink
)

let spaceRegexExt = try! NSRegularExpression(pattern: "\\s")
// TODO: This needs improvement:
let urlRegex = try! NSRegularExpression(
	pattern: "^(www\\.([a-z0-9_-]\\.*)+([a-z0-9-]\\.*){0,2}[^\\s<]*)",
	options: .caseInsensitive
)
let extUrlRegex = try! NSRegularExpression(
	pattern: "^((https*|ftp)://([a-z0-9_-]\\.*)+([a-z0-9-]\\.*){0,2}[^\\s<]*)",
	options: .caseInsensitive
)
let extEmailRegex = try! NSRegularExpression(
	pattern: "^([a-z0-9._\\-+]+@([a-z0-9._\\-+]+\\.*)+)",
	options: .caseInsensitive
)
let extXmppRegex = try! NSRegularExpression(
	pattern: "^((mailto|xmpp):[a-z0-9._\\-+]+@([a-z0-9._\\-+]+\\.*)+(/[a-z0-9@.]+){0,1})",
	options: .caseInsensitive
)

func testExtendedAutolink(state: inout InlineParserState, parent: inout MarkdownNode) -> Bool {
	// Don't try to extract HTML for HTML blocks
	if parent.type == "html_block" {
		return false
	}

	let src = state.src
	guard state.i < src.count else { return false }

	if !isEscaped(text: src, i: state.i) {
		let index = src.index(src.startIndex, offsetBy: state.i)
		let char = src[index]

		if char == "w" {
			let tail = String(src[index...])

			let urlRange = NSRange(location: 0, length: tail.utf16.count)
			if let urlMatch = urlRegex.firstMatch(in: tail, options: [], range: urlRange) {
				let matchRange = urlMatch.range(at: 1)
				if let range = Range(matchRange, in: tail) {
					var url = String(tail[range])

					let spaceRange = NSRange(location: 0, length: url.utf16.count)
					if spaceRegexExt.firstMatch(in: url, options: [], range: spaceRange) != nil {
						let fullMatchRange = urlMatch.range(at: 0)
						if let fullRange = Range(fullMatchRange, in: tail) {
							let originalLength = tail[fullRange].count
							let markup = escapeHtml(text: String(tail[fullRange]))
							let text = newText(
								index: state.parentIndex + state.i,
								line: state.line,
								content: markup,
								indent: state.indent
							)
							text.length = originalLength
							parent.children?.append(text)
							state.i += originalLength
							return true
						}
					}

					url = extendedValidation(url: url)
					url = escapeHtml(text: url)

					let fullMatchRange = urlMatch.range(at: 0)
					if let fullRange = Range(fullMatchRange, in: tail) {
						let link = newLink(url: url, state: state)
						link.info = "http://\(link.info ?? "")"
						parent.children?.append(link)
						state.i += url.count
					}

					return true
				}
			}
		}

		if char == "h" || char == "f" {
			let tail = String(src[index...])

			let urlRange = NSRange(location: 0, length: tail.utf16.count)
			if let urlMatch = extUrlRegex.firstMatch(in: tail, options: [], range: urlRange) {
				let matchRange = urlMatch.range(at: 1)
				if let range = Range(matchRange, in: tail) {
					var url = String(tail[range])

					let spaceRange = NSRange(location: 0, length: url.utf16.count)
					if spaceRegexExt.firstMatch(in: url, options: [], range: spaceRange) != nil {
						let fullMatchRange = urlMatch.range(at: 0)
						if let fullRange = Range(fullMatchRange, in: tail) {
							let markup = escapeHtml(text: String(tail[fullRange]))
							let text = newText(
								index: state.parentIndex + state.i,
								line: state.line,
								content: markup,
								indent: state.indent
							)
							parent.children?.append(text)
							state.i += tail[fullRange].count
							return true
						}
					}

					url = extendedValidation(url: url)
					url = escapeHtml(text: url)

					let link = newLink(url: url, state: state)
					parent.children?.append(link)
					state.i += url.count

					return true
				}
			}
		}

		// Check alphanumeric for email
		if state.i < src.count {
			let code = Int(src[index].asciiValue ?? 0)
			if isAlphaNumeric(code: code) {
				// TODO: I think we should actually check this when we come across an @,
				// rather than any alphanumeric
				let tail = String(src[index...])

				let emailRange = NSRange(location: 0, length: tail.utf16.count)
				if let emailMatch = extEmailRegex.firstMatch(in: tail, options: [], range: emailRange) {
					let matchRange = emailMatch.range(at: 1)
					if let range = Range(matchRange, in: tail) {
						var url = String(tail[range])

						// "+ can occur before the @, but not after" "., -, and _ can
						// occur on both sides of the @, but only . may occur at the end
						// of the email address, in which case it will not be considered
						// part of the address"
						if url.hasSuffix("-") || url.hasSuffix("_") {
							let fullMatchRange = emailMatch.range(at: 0)
							if let fullRange = Range(fullMatchRange, in: tail) {
								let markup = escapeHtml(text: String(tail[fullRange]))
								let text = newText(
									index: state.parentIndex + state.i,
									line: state.line,
									content: markup,
									indent: state.indent
								)
								parent.children?.append(text)
								state.i += tail[fullRange].count
								return true
							}
						}

						if let atIndex = url.firstIndex(of: "@") {
							let afterAt = String(url[url.index(after: atIndex)...])
							if afterAt.contains("+") {
								let fullMatchRange = emailMatch.range(at: 0)
								if let fullRange = Range(fullMatchRange, in: tail) {
									let markup = escapeHtml(text: String(tail[fullRange]))
									let text = newText(
										index: state.parentIndex + state.i,
										line: state.line,
										content: markup,
										indent: state.indent
									)
									parent.children?.append(text)
									state.i += tail[fullRange].count
									return true
								}
							}
						}

						url = url.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)

						let link = newLink(url: url, state: state)
						link.info = "mailto:\(link.info ?? "")"
						parent.children?.append(link)
						state.i += url.count

						return true
					}
				}
			}
		}

		if char == "m" || char == "x" {
			let tail = String(src[index...])

			let xmppRange = NSRange(location: 0, length: tail.utf16.count)
			if let emailMatch = extXmppRegex.firstMatch(in: tail, options: [], range: xmppRange) {
				let matchRange = emailMatch.range(at: 1)
				if let range = Range(matchRange, in: tail) {
					var url = String(tail[range])

					// "+ can occur before the @, but not after" "., -, and _ can
					// occur on both sides of the @, but only . may occur at the end
					// of the email address, in which case it will not be considered
					// part of the address"
					if url.hasSuffix("-") || url.hasSuffix("_") {
						let fullMatchRange = emailMatch.range(at: 0)
						if let fullRange = Range(fullMatchRange, in: tail) {
							let markup = escapeHtml(text: String(tail[fullRange]))
							let text = newText(
								index: state.parentIndex + state.i,
								line: state.line,
								content: markup,
								indent: state.indent
							)
							parent.children?.append(text)
							state.i += tail[fullRange].count
							return true
						}
					}

					if let atIndex = url.firstIndex(of: "@") {
						let afterAt = String(url[url.index(after: atIndex)...])
						if afterAt.contains("+") {
							let fullMatchRange = emailMatch.range(at: 0)
							if let fullRange = Range(fullMatchRange, in: tail) {
								let markup = escapeHtml(text: String(tail[fullRange]))
								let text = newText(
									index: state.parentIndex + state.i,
									line: state.line,
									content: markup,
									indent: state.indent
								)
								parent.children?.append(text)
								state.i += tail[fullRange].count
								return true
							}
						}
					}

					url = url.replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)

					let link = newLink(url: url, state: state)
					parent.children?.append(link)
					state.i += url.count

					return true
				}
			}
		}
	}

	return false
}

let trailingPunctuation = try! NSRegularExpression(pattern: "[?!.,:*_~]$")
let trailingEntity = try! NSRegularExpression(pattern: "&[a-z0-9]+;$", options: .caseInsensitive)

func extendedValidation(url: String) -> String {
	var result = url

	// "Trailing punctuation (specifically, ?, !, ., ,, :, *, _,
	// and ~) will not be considered part of the autolink,
	// though they may be included in the interior of the link"
	result = result.replacingOccurrences(of: "[?!.,:*_~]$", with: "", options: .regularExpression)

	// "When an autolink ends in ), we scan the entire autolink for the total
	// number of parentheses. If there is a greater number of closing
	// parentheses than opening ones, we don't consider the unmatched trailing
	// parentheses part of the autolink, in order to facilitate including an
	// autolink inside a parenthesis"
	if result.hasSuffix(")") {
		var trimCount = 0
		var i = result.count
		var countingUp = true
		while i > 0 {
			i -= 1
			let index = result.index(result.startIndex, offsetBy: i)
			if countingUp {
				if result[index] == ")" {
					trimCount += 1
				} else {
					countingUp = false
				}
			} else {
				if result[index] == "(" {
					trimCount -= 1
				}
				if trimCount == 0 {
					break
				}
			}
		}
		if trimCount > 0 {
			let endIndex = result.index(result.endIndex, offsetBy: -trimCount)
			result = String(result[..<endIndex])
		}
	}

	// "If an autolink ends in a semicolon (;), we check to see if it appears to
	// resemble an entity reference; if the preceding text is & followed by one
	// or more alphanumeric characters. If so, it is excluded from the autolink"
	if result.hasSuffix(";") {
		result = result.replacingOccurrences(of: "&[a-z0-9]+;$", with: "", options: [.regularExpression, .caseInsensitive])
	}

	return result
}

func newLink(url: String, state: InlineParserState) -> MarkdownNode {
	let escapedUrl = url.replacingOccurrences(of: "\\", with: "\\\\")
	let decodedUrl = decodeEntities(text: url)
	let encodedUrl = decodedUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? decodedUrl

	let text = newText(
		index: state.parentIndex + state.i,
		line: state.line,
		content: escapedUrl,
		indent: state.indent
	)

	let link = newInline(
		type: "link",
		index: state.parentIndex + state.i,
		line: state.line,
		markup: "",
		indent: state.indent
	)
	link.info = encodedUrl
	link.length = url.count
	link.children = [text]

	return link
}

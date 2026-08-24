import Foundation

/// Extracts YAML frontmatter from the beginning of a markdown document.
/// Frontmatter is delimited by `---` on its own line at the start and end.

// Regex pattern: ^---[ \t]*\r?\n (anchored at start, no multiline)
nonisolated(unsafe) let frontmatterPattern = /^---\s*(?:\n|\r\n|\r)/

func extractFrontMatter(_ document: inout MarkdownNode, _ src: [UInt8], _ index: Int) -> String? {
	// Check if we're at the start of a potential frontmatter block
	guard src[index] == DASH_CODE else {
		return nil
	}

	// Check if opening pattern matches at the start
	let remainingSrc = String(decoding: src[index...], as: UTF8.self)
	guard let openingMatch = remainingSrc.firstMatch(of: frontmatterPattern) else {
		return nil
	}

	// Get the end position of the match (in bytes)
	let openingEnd = String(remainingSrc[..<openingMatch.range.upperBound]).utf8.count

	// Search for closing delimiter starting after the opening
	var contentEnd = -1
	let searchStart = index + openingEnd

	for j in searchStart ..< src.count {
		if src[j] == DASH_CODE {
			// Check what comes after using regex
			let afterDelimStr = String(decoding: src[j...], as: UTF8.self)
			if let closingMatch = afterDelimStr.firstMatch(of: frontmatterPattern) {
				// Found closing delimiter, contentEnd is at the end of the closing match (in bytes)
				let matchLength = String(afterDelimStr[..<closingMatch.range.upperBound]).utf8.count
				contentEnd = j + matchLength
				break
			} else if j + 3 >= src.count {
				// End of string after closing delimiter
				contentEnd = src.count
				break
			}
		}
	}

	guard contentEnd != -1 else {
		return nil
	}

	// Extract the frontmatter
	let frontmatter = String(decoding: src[index ..< contentEnd], as: UTF8.self)

	// Count newlines to update document line
	var lineCount = 1
	for i in 0 ..< contentEnd {
		if src[i] == NEW_LINE_CODE {
			lineCount += 1
		}
	}
	document.line = lineCount

	return frontmatter
}

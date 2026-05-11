import Foundation

/// Extracts YAML frontmatter from the beginning of a markdown document.
/// Frontmatter is delimited by `---` on its own line at the start and end.

// Regex pattern: ^---[ \t]*\r?\n (anchored at start, no multiline)
nonisolated(unsafe) let frontmatterPattern = /^---\s*(?:\n|\r\n)/

func extractFrontMatter(_ document: inout MarkdownNode, _ src: [Character], _ index: Int) -> String? {
	let DASH: Character = "-"

	// Check if we're at the start of a potential frontmatter block
	guard src[index] == DASH else {
		return nil
	}

	// Check if opening pattern matches at the start
	let remainingSrc = String(src[index...])
	guard let openingMatch = remainingSrc.firstMatch(of: frontmatterPattern) else {
		return nil
	}

	// Get the end position of the match
	let openingEnd = remainingSrc.distance(from: remainingSrc.startIndex, to: openingMatch.range.upperBound)

	// Search for closing delimiter starting after the opening
	var contentEnd = -1
	let searchStart = index + openingEnd

	for j in searchStart ..< src.count {
		if src[j] == DASH {
			// Check what comes after using regex
			let afterDelimStr = String(src[j...])
			if let closingMatch = afterDelimStr.firstMatch(of: frontmatterPattern) {
				// Found closing delimiter, contentEnd is at the end of the closing match
				let matchLength = afterDelimStr.distance(from: afterDelimStr.startIndex, to: closingMatch.range.upperBound)
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
	let frontmatter = String(src[index ..< contentEnd])

	// Count newlines to update document line
	var lineCount = 1
	for i in 0 ..< contentEnd {
		if src[i] == "\n" {
			lineCount += 1
		}
	}
	document.line = lineCount

	return frontmatter
}

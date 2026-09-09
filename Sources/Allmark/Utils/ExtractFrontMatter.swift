/// Extracts YAML frontmatter from the beginning of a markdown document.
/// Frontmatter is delimited by `---` on its own line at the start and end.

func extractFrontMatter(_ document: inout MarkdownNode, _ src: [UInt8], _ index: Int) -> String? {
	guard index + 2 < src.count, src[index + 1] == DASH_CODE, src[index + 2] == DASH_CODE else {
		return nil
	}

	var i = index + 3
	// Only consume horizontal whitespace (space and tab), not newlines
	while i < src.count, src[i] == SPACE_CODE || src[i] == TAB_CODE {
		i += 1
	}

	// The opening delimiter must be followed by a line ending, otherwise a
	// thematic break would be treated as frontmatter
	guard i < src.count, isNewLine(code: src[i]) else {
		return nil
	}

	// Skip the line ending (\r\n counts as one)
	if src[i] == CARRIAGE_RETURN_CODE, i + 1 < src.count, src[i + 1] == NEW_LINE_CODE {
		i += 2
	} else {
		i += 1
	}

	// Eagerly scan for the closing delimiter: the first line containing only
	// "---" (plus optional trailing spaces/tabs), ended by a line ending or
	// the end of the document
	var atLineStart = true
	while i < src.count {
		let isClosingCandidate =
			src[i] == DASH_CODE
				&& i + 2 < src.count
				&& src[i + 1] == DASH_CODE
				&& src[i + 2] == DASH_CODE
		if atLineStart, isClosingCandidate {
			var j = i + 3
			// Only consume horizontal whitespace (space and tab), not newlines
			while j < src.count, src[j] == SPACE_CODE || src[j] == TAB_CODE {
				j += 1
			}

			if j >= src.count || isNewLine(code: src[j]) {
				let contentEnd = j
				let frontmatter = String(decoding: src[index ..< contentEnd], as: UTF8.self)

				var lineCount = 1
				for k in 0 ..< contentEnd {
					if src[k] == NEW_LINE_CODE {
						lineCount += 1
					}
				}
				document.line = lineCount

				return frontmatter
			}
		}

		atLineStart = isNewLine(code: src[i])
		i += 1
	}

	return nil
}

@testable import Allmark
import Testing

struct RenderConsoleTests {
	func stripAnsiCodes(_ string: String) -> String {
		var result = string
		let patterns = [
			"\u{001B}[0m",
			"\u{001B}[1m",
			"\u{001B}[2m",
			"\u{001B}[3m",
			"\u{001B}[4m",
			"\u{001B}[9m",
			"\u{001B}[29m",
			"\u{001B}[31m",
			"\u{001B}[32m",
			"\u{001B}[33m",
			"\u{001B}[34m",
			"\u{001B}[35m",
			"\u{001B}[36m",
			"\u{001B}[38;5;208m",
			"\u{001B}[43m",
			"\u{001B}[30m",
			"\u{001B}[90m",
		]
		for pattern in patterns {
			result = result.replacingOccurrences(of: pattern, with: "")
		}
		return result
	}

	@Test func rendersParagraphToConsole() async {
		let input = "Hello, world!"
		let expected = "Hello, world!\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphThenParagraphToConsole() async {
		let input = "Hello, world!\n\nHello again"
		let expected = "Hello, world!\n\nHello again\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphX3ToConsole() async {
		let input = "First\n\nSecond\n\nThird"
		let expected = "First\n\nSecond\n\nThird\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingToConsoleWithColor() async {
		let input = "# Heading 1\n## Heading 2"
		let expected = "\u{001B}[2m#\u{001B}[0m \u{001B}[1m\u{001B}[35mHeading 1\u{001B}[0m\n\n\u{001B}[2m##\u{001B}[0m \u{001B}[1m\u{001B}[35mHeading 2\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenHeadingToConsole() async {
		let input = "# Heading 1\n## Heading 2"
		let expected = "# Heading 1\n\n## Heading 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenParagraph() async {
		let input = "# Heading\n\nParagraph text"
		let expected = "# Heading\n\nParagraph text\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphThenHeading() async {
		let input = "Paragraph text\n\n# Heading"
		let expected = "Paragraph text\n\n# Heading\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenList() async {
		let input = "# Heading\n\n- Item 1\n- Item 2"
		let expected = "# Heading\n\n• Item 1\n• Item 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersListThenHeading() async {
		let input = "- Item 1\n- Item 2\n\n# Heading"
		let expected = "• Item 1\n• Item 2\n\n# Heading\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphThenList() async {
		let input = "Paragraph\n\n- Item 1\n- Item 2"
		let expected = "Paragraph\n\n• Item 1\n• Item 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersListThenParagraph() async {
		let input = "- Item 1\n- Item 2\n\nParagraph"
		let expected = "• Item 1\n• Item 2\n\nParagraph\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenCodeBlock() async {
		let input = "# Heading\n\n```\ncode\n```"
		let expected = "# Heading\n\n┌─\n│ code\n└─\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersCodeBlockThenHeading() async {
		let input = "```\ncode\n```\n\n# Heading"
		let expected = "┌─\n│ code\n└─\n\n# Heading\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenBlockQuote() async {
		let input = "# Heading\n\n> Quote text"
		let expected = "# Heading\n\n┃ Quote text\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersBlockQuoteThenHeading() async {
		let input = "> Quote text\n\n# Heading"
		let expected = "┃ Quote text\n\n# Heading\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingThenThematicBreak() async {
		let input = "# Heading\n\n---"
		let expected = "# Heading\n\n───\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersThematicBreakThenHeading() async {
		let input = "---\n\n# Heading"
		let expected = "───\n\n# Heading\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersMultipleBlockTypes() async {
		let input = "# Heading 1\n\nParagraph 1\n\n---\n\n## Heading 2\n\nParagraph 2"
		let expected = "# Heading 1\n\nParagraph 1\n\n───\n\n## Heading 2\n\nParagraph 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersAlertThenParagraph() async {
		let input = "> [!NOTE]\n> Note\n\nParagraph"
		let expected = "📝 Note:\n\nNote\n\nParagraph\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphThenAlert() async {
		let input = "Paragraph\n\n> [!NOTE]\n> Note"
		let expected = "Paragraph\n\n📝 Note:\n\nNote\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersBulletedListWithUnicodeBullets() async {
		let input = "- Item 1\n- Item 2"
		let expected = "\u{001B}[2m•\u{001B}[0m Item 1\n\u{001B}[2m•\u{001B}[0m Item 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersOrderedList() async {
		let input = "1. First\n2. Second"
		let expected = "\u{001B}[2m1.\u{001B}[0m First\n\u{001B}[2m2.\u{001B}[0m Second\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersTightBulletedList() async {
		let input = "- Item 1\n- Item 2\n- Item 3"
		let expected = "• Item 1\n• Item 2\n• Item 3\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersLooseBulletedList() async {
		let input = "- Item 1\n\n- Item 2\n\n- Item 3"
		let expected = "• Item 1\n\n• Item 2\n\n• Item 3\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersTightOrderedList() async {
		let input = "1. First\n2. Second\n3. Third"
		let expected = "1. First\n2. Second\n3. Third\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersLooseOrderedList() async {
		let input = "1. First\n\n2. Second\n\n3. Third"
		let expected = "1. First\n\n2. Second\n\n3. Third\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersOrderedListWithNestedBulletedList() async {
		let input = "1. First\n   - Nested A\n   - Nested B\n2. Second"
		let expected = "1. First\n  ◦ Nested A\n  ◦ Nested B\n2. Second\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersBulletedListWithNestedOrderedList() async {
		let input = "- First\n  1. Nested A\n  2. Nested B\n- Second"
		let expected = "• First\n  1. Nested A\n  2. Nested B\n• Second\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersCodeFenceWithBoxDrawing() async {
		let input = "```\ncode\n```"
		let expected = "\u{001B}[2m┌─\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m code\n\u{001B}[2m└─\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersInlineCode() async {
		let input = "`code`"
		let expected = "\u{001B}[32mcode\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersBlockQuoteWithVerticalLine() async {
		let input = "> Quote text"
		let expected = "┃ Quote text\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			let stripped = output.replacingOccurrences(of: "\u{001B}[0m", with: "")
				.replacingOccurrences(of: "\u{001B}[1m", with: "")
				.replacingOccurrences(of: "\u{001B}[2m", with: "")
				.replacingOccurrences(of: "\u{001B}[3m", with: "")
				.replacingOccurrences(of: "\u{001B}[4m", with: "")
				.replacingOccurrences(of: "\u{001B}[31m", with: "")
				.replacingOccurrences(of: "\u{001B}[32m", with: "")
				.replacingOccurrences(of: "\u{001B}[33m", with: "")
				.replacingOccurrences(of: "\u{001B}[34m", with: "")
				.replacingOccurrences(of: "\u{001B}[35m", with: "")
				.replacingOccurrences(of: "\u{001B}[36m", with: "")
				.replacingOccurrences(of: "\u{001B}[38;5;208m", with: "")
				.replacingOccurrences(of: "\u{001B}[90m", with: "")
			#expect(stripped == expected)
		}
	}

	@Test func rendersThematicBreak() async {
		let input = "---"
		let expected = "\u{001B}[2m───\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersTaskListWithEmojis() async {
		let input = "- [x] Done\n- [ ] Todo"
		let expected = "\u{001B}[2m•\u{001B}[0m [✓] Done\n\u{001B}[2m•\u{001B}[0m [ ] Todo\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersTableWithUnicodeBorders() async {
		let input = "| A | B |\n|---|---|\n| 1 | 2 |"
		let expected = "\u{001B}[2m┌───┬───┐\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m A \u{001B}[2m│\u{001B}[0m B \u{001B}[2m│\u{001B}[0m\n\u{001B}[2m├───┼───┤\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m 1 \u{001B}[2m│\u{001B}[0m 2 \u{001B}[2m│\u{001B}[0m\n\u{001B}[2m└───┴───┘\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersTableThenParagraph() async {
		let input = "| A |\n|---|\n| 1 |\n\nParagraph"
		let expected = "┌───┐\n│ A │\n├───┤\n│ 1 │\n└───┘\n\nParagraph\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersParagraphThenTable() async {
		let input = "Paragraph\n\n| A |\n|---|\n| 1 |"
		let expected = "Paragraph\n\n┌───┐\n│ A │\n├───┤\n│ 1 │\n└───┘\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected)
		}
	}

	@Test func rendersTableWithPadding() async {
		let input = "| A | B |\n| - | - |\n| 1 | hello |"
		let expected = """
		┌───┬───────┐
		│ A │ B     │
		├───┼───────┤
		│ 1 │ hello │
		└───┴───────┘
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func rendersTableWithCorrectlyAlignedPadding() async {
		let input = "| A | B |\n| - | -: |\n| x | 1 |\n| y | 200 |"
		let expected = """
		┌───┬─────┐
		│ A │   B │
		├───┼─────┤
		│ x │   1 │
		│ y │ 200 │
		└───┴─────┘
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func rendersStrongText() async {
		let input = "**bold**"
		let expected = "\u{001B}[1m\u{001B}[33mbold\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersEmphasisText() async {
		let input = "*italic*"
		let expected = "\u{001B}[3m\u{001B}[33mitalic\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersLink() async {
		let input = "[text](url)"
		let expected = "\u{001B}[4m\u{001B}[34mtext\u{001B}[0m \u{001B}[2m(url)\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersImage() async {
		let input = "![alt](url)"
		let expected = "\u{001B}[90m[Image: alt]\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersStrikethrough() async {
		let input = "~~deleted~~"
		let expected = "\u{001B}[2m\u{001B}[9mdeleted\u{001B}[29m\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersAlertWithEmoji() async {
		let input = "> [!NOTE]\n> Note content"
		let expected = "\u{001B}[34m📝 Note:\u{001B}[0m\n\nNote content\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersNestedListWithDifferentBullets() async {
		let input = "- Level 1\n  - Level 2\n    - Level 3"
		let expected = "\u{001B}[2m•\u{001B}[0m Level 1\n  \u{001B}[2m◦\u{001B}[0m Level 2\n    \u{001B}[2m▪\u{001B}[0m Level 3\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHardBreak() async {
		let input = "Line 1\n\nLine 2"
		let expected = "Line 1\n\nLine 2\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHeadingWithUnderlineSetextStyle() async {
		let input = "Heading\n=======\n\nSubheading\n-------"
		let expected = "\u{001B}[1m\u{001B}[35mHeading\n\u{001B}[0m\u{001B}[2m=======\u{001B}[0m\n\u{001B}[1m\u{001B}[35mSubheading\n\u{001B}[0m\u{001B}[2m----------\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHtmlBlock() async {
		let input = "<div>html</div>"
		let expected = "<div>html</div>\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHtmlSpanInline() async {
		let input = "test <span>html</span> test"
		let expected = "test <span>html</span> test\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersComment() async {
		let input = "<!-- comment -->"
		let expected = "<!-- comment -->\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersDeletionStrikethroughAlternative() async {
		let input = "~~deleted~~"
		let expected = "\u{001B}[2m\u{001B}[9mdeleted\u{001B}[29m\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersFootnote() async {
		let input = "Text [^1]\n\n[^1]: http://example.com"
		let expected = "Text \u{001B}[2m[1]\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersHighlight() async {
		let input = "==highlighted=="
		let expected = "\u{001B}[43m\u{001B}[30mhighlighted\u{001B}[0m\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func rendersInsertion() async {
		let input = "++inserted++"
		let expected = "++inserted++\n"

		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let output = _render(doc: doc, renderers: consoleRenderers)
			#expect(output == expected)
		}
	}

	@Test func basicParseAndRender() async {
		let input = """
		# Test

		Here is some text

		* Tight item 1
		  * Nested item 1
		* Tight item 2

		- Loose item 1

		- Loose item 2

		## Subtest

		Here is some more text
		"""
		let expected = """
		# Test

		Here is some text

		• Tight item 1
		  ◦ Nested item 1
		• Tight item 2

		• Loose item 1

		• Loose item 2

		## Subtest

		Here is some more text
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func rendersNestedAndSpacedLists() async {
		let input = """
		1. Item one
		2. Item two
		   - child one
		   - child two

		3. Item three
		4. Item four
		"""
		let expected = """
		1. Item one

		2. Item two

		  ◦ child one
		  ◦ child two

		3. Item three

		4. Item four
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let output = stripAnsiCodes(_render(doc: doc, renderers: consoleRenderers))
			#expect(output == expected + "\n")
		}
	}
}

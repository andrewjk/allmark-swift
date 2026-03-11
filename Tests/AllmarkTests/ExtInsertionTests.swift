import Testing
@testable import Allmark

struct ExtInsertionTests {
	@Test func insertionSingle() async {
		let input = """
This text was {+inserted+} recently.
"""
		let expected = """
<p>This text was <ins class="markdown-insertion">inserted</ins> recently.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionDouble() async {
		let input = """
This text was {++inserted++} recently.
"""
		let expected = """
<p>This text was <ins class="markdown-insertion">inserted</ins> recently.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionTriple() async {
		let input = """
This text was {+++inserted+++} recently.
"""
		let expected = """
<p>This text was {+++inserted+++} recently.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionSingleCharacter() async {
		let input = "text {+a+} more"
		let expected = "<p>text <ins class=\"markdown-insertion\">a</ins> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithSpaces() async {
		let input = "text {+with spaces+} more"
		let expected = "<p>text <ins class=\"markdown-insertion\">with spaces</ins> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionAtStartOfParagraph() async {
		let input = "{+inserted+} This is new."
		let expected = "<p><ins class=\"markdown-insertion\">inserted</ins> This is new.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionAtEndOfParagraph() async {
		let input = "This is {+inserted+}"
		let expected = "<p>This is <ins class=\"markdown-insertion\">inserted</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithPunctuation() async {
		let input = "text {+word!+} more"
		let expected = "<p>text <ins class=\"markdown-insertion\">word!</ins> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithSpecialCharacters() async {
		let input = "text {+a+b+} more"
		let expected = "<p>text <ins class=\"markdown-insertion\">a+b</ins> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionAdjacentToText() async {
		let input = "test{+ing+}test"
		let expected = "<p>test<ins class=\"markdown-insertion\">ing</ins>test</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyInsertion() async {
		let input = "text{++}text"
		let expected = "<p>text{++}text</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithMarkdownInside() async {
		let input = "text {+**bold**+}"
		let expected = "<p>text <ins class=\"markdown-insertion\"><strong>bold</strong></ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithCodeInside() async {
		let input = "text {+`code`+}"
		let expected = "<p>text <ins class=\"markdown-insertion\"><code>code</code></ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func escapedBracesShouldNotBeInsertion() async {
		let input = "text \\{+not insertion\\+}"
		let expected = "<p>text {+not insertion+}</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedOpeningInsertion() async {
		let input = "text {+not closed"
		let expected = "<p>text {+not closed</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedClosingInsertion() async {
		let input = "text not opened+}"
		let expected = "<p>text not opened+}</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionInListItem() async {
		let input = "- Item with {+insertion+}"
		let expected = """
<ul>
<li>Item with <ins class="markdown-insertion">insertion</ins></li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionInBlockquote() async {
		let input = "> Quote with {+insertion+}"
		let expected = """
<blockquote>
<p>Quote with <ins class="markdown-insertion">insertion</ins></p>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithPlusInside() async {
		let input = "text {+plus + inside+}"
		let expected = "<p>text <ins class=\"markdown-insertion\">plus + inside</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionAtBeginningOfDocument() async {
		let input = "{+Start+} of document."
		let expected = "<p><ins class=\"markdown-insertion\">Start</ins> of document.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionAtEndOfDocument() async {
		let input = "End of {+document+}"
		let expected = "<p>End of <ins class=\"markdown-insertion\">document</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleInsertionsInOneLine() async {
		let input = "{+first+} and {+second+} and {+third+}"
		let expected = "<p><ins class=\"markdown-insertion\">first</ins> and <ins class=\"markdown-insertion\">second</ins> and <ins class=\"markdown-insertion\">third</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithStartingEmphasis() async {
		let input = "{+inserted *text+} that shouldn't be bold*"
		let expected = "<p><ins class=\"markdown-insertion\">inserted *text</ins> that shouldn't be bold*</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func insertionWithEndingEmphasis() async {
		let input = "*this text should be {+inserted but not bold*+}"
		let expected = "<p>*this text should be <ins class=\"markdown-insertion\">inserted but not bold*</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

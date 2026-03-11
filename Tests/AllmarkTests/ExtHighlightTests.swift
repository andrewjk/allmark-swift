import Testing
@testable import allmark

struct ExtHighlightTests {
	@Test func highlightSingle() async {
		let input = """
This should be =highlighted= as it is important.
"""
		let expected = """
<p>This should be <mark>highlighted</mark> as it is important.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightDouble() async {
		let input = """
This should be ==highlighted== as it is important.
"""
		let expected = """
<p>This should be <mark>highlighted</mark> as it is important.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightTriple() async {
		let input = """
This should be ===highlighted=== as it is important.
"""
		let expected = """
<p>This should be ===highlighted=== as it is important.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightSingleCharacter() async {
		let input = "text =a= more"
		let expected = "<p>text <mark>a</mark> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleHighlightsInOneLine() async {
		let input = "=first= and =second= and =third="
		let expected = "<p><mark>first</mark> and <mark>second</mark> and <mark>third</mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightAtStartOfParagraph() async {
		let input = "=highlighted= This is important."
		let expected = "<p><mark>highlighted</mark> This is important.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightAtEndOfParagraph() async {
		let input = "This is =highlighted="
		let expected = "<p>This is <mark>highlighted</mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithPunctuation() async {
		let input = "text =word!= more"
		let expected = "<p>text <mark>word!</mark> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithSpaces() async {
		let input = "text =with spaces= more"
		let expected = "<p>text <mark>with spaces</mark> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithSpecialCharacters() async {
		let input = "text =a+b= more"
		let expected = "<p>text <mark>a+b</mark> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightAdjacentToText() async {
		let input = "test=ing=test"
		let expected = "<p>test<mark>ing</mark>test</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyHighlight() async {
		let input = "text==text"
		let expected = "<p>text==text</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithMarkdownInside() async {
		let input = "text =**bold**="
		let expected = "<p>text <mark><strong>bold</strong></mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithCodeInside() async {
		let input = "text =`code`="
		let expected = "<p>text <mark><code>code</code></mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func escapedEqualsShouldNotBeHighlight() async {
		let input = "text \\=not highlight\\="
		let expected = "<p>text =not highlight=</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedOpeningEquals() async {
		let input = "text =not closed"
		let expected = "<p>text =not closed</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedClosingEquals() async {
		let input = "text not opened="
		let expected = "<p>text not opened=</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightInListItem() async {
		let input = "- Item with =highlight="
		let expected = """
<ul>
<li>Item with <mark>highlight</mark></li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightInBlockquote() async {
		let input = "> Quote with =highlight="
		let expected = """
<blockquote>
<p>Quote with <mark>highlight</mark></p>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightWithEqualsInside() async {
		let input = "text =equals = inside="
		let expected = "<p>text <mark>equals = inside</mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightAtBeginningOfDocument() async {
		let input = "=Start= of document."
		let expected = "<p><mark>Start</mark> of document.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func highlightAtEndOfDocument() async {
		let input = "End of =document="
		let expected = "<p>End of <mark>document</mark></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

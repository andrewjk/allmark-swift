import Testing
@testable import allmark

struct ExtSuperscriptTests {
	@Test func superscriptSingle() async {
		let input = """
This should be ^up^ above everything else.
"""
		let expected = """
<p>This should be <sup>up</sup> above everything else.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptDouble() async {
		let input = """
This should be ^^up^^ above everything else.
"""
		let expected = """
<p>This should be <sup>up</sup> above everything else.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptTriple() async {
		let input = """
This should be ^^^up^^^ above everything else.
"""
		let expected = """
<p>This should be ^^^up^^^ above everything else.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptSingleCharacter() async {
		let input = "x^2^"
		let expected = "<p>x<sup>2</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithNumbers() async {
		let input = "E=mc^2^"
		let expected = "<p>E=mc<sup>2</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleSuperscriptsInOneLine() async {
		let input = "x^2^ + y^2^ = z^2^"
		let expected = "<p>x<sup>2</sup> + y<sup>2</sup> = z<sup>2</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptAtStartOfParagraph() async {
		let input = "^note^ This is important."
		let expected = "<p><sup>note</sup> This is important.</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptAtEndOfParagraph() async {
		let input = "See footnote^1^"
		let expected = "<p>See footnote<sup>1</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithPunctuation() async {
		let input = "Hello^world!^"
		let expected = "<p>Hello<sup>world!</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithSpaces() async {
		let input = "text ^with spaces^ more"
		let expected = "<p>text <sup>with spaces</sup> more</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithSpecialCharacters() async {
		let input = "math^2+3^"
		let expected = "<p>math<sup>2+3</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptAdjacentToText() async {
		let input = "test^ing^test"
		let expected = "<p>test<sup>ing</sup>test</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptySuperscript() async {
		let input = "text^^text"
		let expected = "<p>text^^text</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithMarkdownInside() async {
		let input = "text ^**bold**^"
		let expected = "<p>text <sup><strong>bold</strong></sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithCodeInside() async {
		let input = "text ^`code`^"
		let expected = "<p>text <sup><code>code</code></sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func escapedCaretShouldNotBeSuperscript() async {
		let input = "text \\^not superscript\\^"
		let expected = "<p>text ^not superscript^</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedOpeningCaret() async {
		let input = "text ^not closed"
		let expected = "<p>text ^not closed</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedClosingCaret() async {
		let input = "text not opened^"
		let expected = "<p>text not opened^</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptInListItem() async {
		let input = "- Item with ^superscript^"
		let expected = """
<ul>
<li>Item with <sup>superscript</sup></li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptInBlockquote() async {
		let input = "> Quote with ^superscript^"
		let expected = """
<blockquote>
<p>Quote with <sup>superscript</sup></p>
</blockquote>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func nestedSuperscript() async {
		let input = "x^y^z^"
		// The first pair of carets creates a superscript, leaving ^z^ as text
		let expected = "<p>x<sup>y</sup>z^</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func superscriptWithCaretInside() async {
		let input = "text ^caret ^ inside^"
		let expected = "<p>text <sup>caret ^ inside</sup></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

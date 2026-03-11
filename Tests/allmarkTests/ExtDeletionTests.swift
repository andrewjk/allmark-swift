import Testing
@testable import allmark

struct ExtDeletionTests {
	@Test func deletionSingle() async {
		let input = """
This text was {-deleted-} recently.
"""
		let expected = """
<p>This text was <del class="markdown-deletion">deleted</del> recently.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionDouble() async {
		let input = """
This text was {--deleted--} recently.
"""
		let expected = """
<p>This text was <del class="markdown-deletion">deleted</del> recently.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionTriple() async {
		let input = """
This text was {---deleted---} recently.
"""
		let expected = """
<p>This text was {---deleted---} recently.</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionSingleCharacter() async {
		let input = "text {-a-} more"
		let expected = "<p>text <del class=\"markdown-deletion\">a</del> more</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithSpaces() async {
		let input = "text {-with spaces-} more"
		let expected = "<p>text <del class=\"markdown-deletion\">with spaces</del> more</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionAtStartOfParagraph() async {
		let input = "{-deleted-} This is new."
		let expected = "<p><del class=\"markdown-deletion\">deleted</del> This is new.</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionAtEndOfParagraph() async {
		let input = "This is {-deleted-}"
		let expected = "<p>This is <del class=\"markdown-deletion\">deleted</del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithPunctuation() async {
		let input = "text {-word!-} more"
		let expected = "<p>text <del class=\"markdown-deletion\">word!</del> more</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithSpecialCharacters() async {
		let input = "text {-a-b-} more"
		let expected = "<p>text <del class=\"markdown-deletion\">a-b</del> more</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionAdjacentToText() async {
		let input = "test{-ing-}test"
		let expected = "<p>test<del class=\"markdown-deletion\">ing</del>test</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyDeletion() async {
		let input = "text{--}text"
		let expected = "<p>text{--}text</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithMarkdownInside() async {
		let input = "text {-**bold**-}"
		let expected = "<p>text <del class=\"markdown-deletion\"><strong>bold</strong></del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithCodeInside() async {
		let input = "text {-`code`-}"
		let expected = "<p>text <del class=\"markdown-deletion\"><code>code</code></del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func escapedBracesShouldNotBeDeletion() async {
		let input = "text \\{-not deletion\\-}"
		let expected = "<p>text {-not deletion-}</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedOpeningDeletion() async {
		let input = "text {-not closed"
		let expected = "<p>text {-not closed</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedClosingDeletion() async {
		let input = "text not opened-}"
		let expected = "<p>text not opened-}</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionInListItem() async {
		let input = "- Item with {-deletion-}"
		let expected = """
<ul>
<li>Item with <del class="markdown-deletion">deletion</del></li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionInBlockquote() async {
		let input = "> Quote with {-deletion-}"
		let expected = """
<blockquote>
<p>Quote with <del class="markdown-deletion">deletion</del></p>
</blockquote>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithPlusInside() async {
		let input = "text {-plus - inside-}"
		let expected = "<p>text <del class=\"markdown-deletion\">plus - inside</del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionAtBeginningOfDocument() async {
		let input = "{-Start-} of document."
		let expected = "<p><del class=\"markdown-deletion\">Start</del> of document.</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionAtEndOfDocument() async {
		let input = "End of {-document-}"
		let expected = "<p>End of <del class=\"markdown-deletion\">document</del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleDeletionsInOneLine() async {
		let input = "{-first-} and {-second-} and {-third-}"
		let expected = "<p><del class=\"markdown-deletion\">first</del> and <del class=\"markdown-deletion\">second</del> and <del class=\"markdown-deletion\">third</del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithStartingEmphasis() async {
		let input = "{-deleted *text-} that shouldn't be bold*"
		let expected = "<p><del class=\"markdown-deletion\">deleted *text</del> that shouldn't be bold*</p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deletionWithEndingEmphasis() async {
		let input = "*this text should be {-deleted but not bold*-}"
		let expected = "<p>*this text should be <del class=\"markdown-deletion\">deleted but not bold*</del></p>"
		await MainActor.run {
			let doc = parse(src: input, rules: extendedRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

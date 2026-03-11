import Testing
@testable import allmark

struct ExtCommentTests {
	@Test func commentBasic() async {
		let input = """
This text was {>>commented<<} recently.
"""
		let expected = """
<p>This text was <span class="markdown-comment">commented</span> recently.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentSingleCharacter() async {
		let input = "text {>>a<<} more"
		let expected = "<p>text <span class=\"markdown-comment\">a</span> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithSpaces() async {
		let input = "text {>>with spaces<<} more"
		let expected = "<p>text <span class=\"markdown-comment\">with spaces</span> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentAtStartOfParagraph() async {
		let input = "{>>commented<<} This is new."
		let expected = "<p><span class=\"markdown-comment\">commented</span> This is new.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentAtEndOfParagraph() async {
		let input = "This is {>>commented<<}"
		let expected = "<p>This is <span class=\"markdown-comment\">commented</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithPunctuation() async {
		let input = "text {>>word!<<} more"
		let expected = "<p>text <span class=\"markdown-comment\">word!</span> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithSpecialCharacters() async {
		let input = "text {>>a-b<<} more"
		let expected = "<p>text <span class=\"markdown-comment\">a-b</span> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentAdjacentToText() async {
		let input = "test{>>ing<<}test"
		let expected = "<p>test<span class=\"markdown-comment\">ing</span>test</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyComment() async {
		let input = "text{>><<}text"
		let expected = "<p>text{&gt;&gt;&lt;&lt;}text</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithMarkdownInside() async {
		let input = "text {>>**bold**<<}"
		let expected = "<p>text <span class=\"markdown-comment\"><strong>bold</strong></span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithCodeInside() async {
		let input = "text {>>`code`<<}"
		let expected = "<p>text <span class=\"markdown-comment\"><code>code</code></span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func escapedBracesShouldNotBeComment() async {
		let input = "text \\{>>not comment<<\\}"
		let expected = "<p>text {&gt;&gt;not comment&lt;&lt;}</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedOpeningComment() async {
		let input = "text {>>not closed"
		let expected = "<p>text {&gt;&gt;not closed</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func unmatchedClosingComment() async {
		let input = "text not opened<<}"
		let expected = "<p>text not opened&lt;&lt;}</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentInListItem() async {
		let input = "- Item with {>>comment<<}"
		let expected = """
<ul>
<li>Item with <span class="markdown-comment">comment</span></li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentInBlockquote() async {
		let input = "> Quote with {>>comment<<}"
		let expected = """
<blockquote>
<p>Quote with <span class="markdown-comment">comment</span></p>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithAngleBracketsInside() async {
		let input = "text {>>some <text> inside<<} more"
		let expected = "<p>text <span class=\"markdown-comment\">some <text> inside</span> more</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentAtBeginningOfDocument() async {
		let input = "{>>Start<<} of document."
		let expected = "<p><span class=\"markdown-comment\">Start</span> of document.</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentAtEndOfDocument() async {
		let input = "End of {>>document<<}"
		let expected = "<p>End of <span class=\"markdown-comment\">document</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleCommentsInOneLine() async {
		let input = "{>>first<<} and {>>second<<} and {>>third<<}"
		let expected = "<p><span class=\"markdown-comment\">first</span> and <span class=\"markdown-comment\">second</span> and <span class=\"markdown-comment\">third</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithStartingEmphasis() async {
		let input = "{>>comment *text<<} that shouldn't be bold*"
		let expected = "<p><span class=\"markdown-comment\">comment *text</span> that shouldn't be bold*</p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithEndingEmphasis() async {
		let input = "*this text should be {>>commented but not bold*<<}"
		let expected = "<p>*this text should be <span class=\"markdown-comment\">commented but not bold*</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithPlusSignsInside() async {
		let input = "text {>>plus + sign<<}"
		let expected = "<p>text <span class=\"markdown-comment\">plus + sign</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentWithMinusSignsInside() async {
		let input = "text {>>minus - sign<<}"
		let expected = "<p>text <span class=\"markdown-comment\">minus - sign</span></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func commentNestedWithOtherCriticMarks() async {
		let input = "text {+insertion {>>comment<<} end+}"
		let expected = "<p>text <ins class=\"markdown-insertion\">insertion <span class=\"markdown-comment\">comment</span> end</ins></p>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

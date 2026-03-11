import Testing
@testable import allmark

struct GfmAlertTests {
	@Test func specAlert() async {
		let input = """
> [!NOTE]
> Useful information that users should know, even when skimming content.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Useful information that users should know, even when skimming content.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertTip() async {
		let input = """
> [!TIP]
> Helpful advice for doing things better or more easily.
"""
		let expected = """
<div class="markdown-alert markdown-alert-tip">
<p class="markdown-alert-title">Tip</p>
<p>Helpful advice for doing things better or more easily.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertImportant() async {
		let input = """
> [!IMPORTANT]
> Key information users need to know to achieve their goal.
"""
		let expected = """
<div class="markdown-alert markdown-alert-important">
<p class="markdown-alert-title">Important</p>
<p>Key information users need to know to achieve their goal.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWarning() async {
		let input = """
> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.
"""
		let expected = """
<div class="markdown-alert markdown-alert-warning">
<p class="markdown-alert-title">Warning</p>
<p>Urgent info that needs immediate user attention to avoid problems.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertCaution() async {
		let input = """
> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
"""
		let expected = """
<div class="markdown-alert markdown-alert-caution">
<p class="markdown-alert-title">Caution</p>
<p>Advises about risks or negative outcomes of certain actions.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithMultipleParagraphs() async {
		let input = """
> [!NOTE]
> First paragraph of the note.
>
> Second paragraph of the note.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>First paragraph of the note.</p>
<p>Second paragraph of the note.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithInlineFormatting() async {
		let input = """
> [!NOTE]
> This is **bold** and this is *italic* and this is `code`.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>This is <strong>bold</strong> and this is <em>italic</em> and this is <code>code</code>.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithList() async {
		let input = """
> [!NOTE]
> Some important points:
> - First point
> - Second point
> - Third point
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Some important points:</p>
<ul>
<li>First point</li>
<li>Second point</li>
<li>Third point</li>
</ul>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithCodeBlock() async {
		let input = """
> [!NOTE]
> Example code:
>
> ```
> console.log("Hello World");
> ```
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Example code:</p>
<pre><code>console.log(&quot;Hello World&quot;);
</code></pre>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithLink() async {
		let input = """
> [!NOTE]
> Check out the [documentation](https://example.com) for more info.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Check out the <a href="https://example.com">documentation</a> for more info.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertCaseInsensitive() async {
		let input = """
> [!note]
> This should work with lowercase.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>This should work with lowercase.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func nonAlertBlockquote() async {
		let input = """
> This is just a regular blockquote.
> It should not be treated as an alert.
"""
		let expected = """
<blockquote>
<p>This is just a regular blockquote.
It should not be treated as an alert.</p>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithBracketsButNotAlert() async {
		let input = """
> [NOTE] This is not an alert syntax.
> It should be a regular blockquote.
"""
		let expected = """
<blockquote>
<p>[NOTE] This is not an alert syntax.
It should be a regular blockquote.</p>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithNestedBlockquote() async {
		let input = """
> [!NOTE]
> Outer alert content.
>
> > Nested blockquote inside alert.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Outer alert content.</p>
<blockquote>
<p>Nested blockquote inside alert.</p>
</blockquote>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func consecutiveAlerts() async {
		let input = """
> [!NOTE]
> First alert.

> [!WARNING]
> Second alert.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>First alert.</p>
</div>
<div class="markdown-alert markdown-alert-warning">
<p class="markdown-alert-title">Warning</p>
<p>Second alert.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func alertWithEmptyContent() async {
		let input = """
> [!NOTE]
>
> Content after empty line.
"""
		let expected = """
<div class="markdown-alert markdown-alert-note">
<p class="markdown-alert-title">Note</p>
<p>Content after empty line.</p>
</div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

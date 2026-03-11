import Testing
@testable import allmark

struct GfmFootnoteTests {
	@Test func specFootnote() async {
		let input = """
Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a footnote, add 2 spaces to the end of a line.  
This is a second line.
"""
		let expected = """
<p>Here is a simple footnote<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<p>A footnote can also have multiple lines<sup class="footnote-ref"><a href="#fn2" id="fnref2">2</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>My reference. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
<li id="fn2">
<p>To add line breaks within a footnote, add 2 spaces to the end of a line.<br />
This is a second line. <a href="#fnref2" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func simpleFootnoteReference() async {
		let input = """
Text with a footnote[^1].

[^1]: This is the footnote content.
"""
		let expected = """
<p>Text with a footnote<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>This is the footnote content. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleFootnoteReferences() async {
		let input = """
First reference[^1] and second[^2].

[^1]: First footnote.
[^2]: Second footnote.
"""
		let expected = """
<p>First reference<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup> and second<sup class="footnote-ref"><a href="#fn2" id="fnref2">2</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>First footnote. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
<li id="fn2">
<p>Second footnote. <a href="#fnref2" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteWithInlineFormatting() async {
		let input = """
Text[^1].

[^1]: Footnote with **bold** and *italic* text.
"""
		let expected = """
<p>Text<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Footnote with <strong>bold</strong> and <em>italic</em> text. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteWithCode() async {
		let input = """
Code reference[^1].

[^1]: Footnote with `inline code`.
"""
		let expected = """
<p>Code reference<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Footnote with <code>inline code</code>. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteWithLink() async {
		let input = """
Link reference[^1].

[^1]: See [example](http://example.com).
"""
		let expected = """
<p>Link reference<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>See <a href="http://example.com">example</a>. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteReferenceNotAtDefinition() async {
		let input = "Unknown footnote[^99]."
		let expected = """
<p>Unknown footnote[^99].</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteWithMultilineContent() async {
		let input = """
Multiline[^1].

[^1]: First line
    Second line
    Third line
"""
		let expected = """
<p>Multiline<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>First line
Second line
Third line <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func repeatedFootnoteReference() async {
		let input = """
First[^1] and second[^1] use same footnote.

[^1]: Shared footnote content.
"""
		let expected = """
<p>First<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup> and second<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup> use same footnote.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Shared footnote content. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteInList() async {
		let input = """
- Item with footnote[^1]
- Another item[^2]

[^1]: First footnote.
[^2]: Second footnote.
"""
		let expected = """
<ul>
<li>Item with footnote<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup></li>
<li>Another item<sup class="footnote-ref"><a href="#fn2" id="fnref2">2</a></sup></li>
</ul>
<section class="footnotes">
<ol>
<li id="fn1">
<p>First footnote. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
<li id="fn2">
<p>Second footnote. <a href="#fnref2" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteInBlockquote() async {
		let input = """
> Quoted text with footnote[^1]

[^1]: Footnote for quote.
"""
		let expected = """
<blockquote>
<p>Quoted text with footnote<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup></p>
</blockquote>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Footnote for quote. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteWithSpecialCharactersInLabel() async {
		let input = """
Special label[^a-b_c].

[^a-b_c]: Footnote with special label.
"""
		let expected = """
<p>Special label[^a-b_c].</p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func caseInsensitiveFootnoteLabels() async {
		let input = """
Mixed case[^ABC].

[^abc]: Should match.
"""
		let expected = """
<p>Mixed case<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Should match. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteThenList() async {
		let input = """
Text[^1]

[^1]: Here is the content  
- and here is a list
"""
		let expected = """
<p>Text<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup></p>
<ul>
<li>and here is a list</li>
</ul>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Here is the content <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func titleAfterFootnoteLabel() async {
		let input = """
Text[^1]

[^1]: https://example.com test
"""
		let expected = """
<p>Text<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup></p>
<section class="footnotes">
<ol>
<li id="fn1">
<p><a href="https://example.com">https://example.com</a> test <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkThenFootnote() async {
		let input = """
Text[^1] [foo]

[foo]: https://example.com/foo
[^1]: https://example.com/1 test
"""
		let expected = """
<p>Text<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup> <a href="https://example.com/foo">foo</a></p>
<section class="footnotes">
<ol>
<li id="fn1">
<p><a href="https://example.com/1">https://example.com/1</a> test <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func footnoteThenLink() async {
		let input = """
Text[^1] [foo]

[^1]: https://example.com/1 test
[foo]: https://example.com/foo
"""
		let expected = """
<p>Text<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup> [foo]</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p><a href="https://example.com/1">https://example.com/1</a> test
[foo]: <a href="https://example.com/foo">https://example.com/foo</a> <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func swallowFollowingBrackets() async {
		let input = """
[^1][asd]f]

[^1]: /footnote
"""
		let expected = """
<p><sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>f]</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>/footnote <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkReferenceTakesPrecedence() async {
		let input = """
[^1][foo]

[^1]: /footnote

[foo]: /url
"""
		let expected = """
<p><a href="/url">^1</a></p>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleParagraphs() async {
		let input = """
Footnote 1 link[^first].

[^first]: Footnote **can have markup**

    and multiple paragraphs.
"""
		let expected = """
<p>Footnote 1 link<sup class="footnote-ref"><a href="#fn1" id="fnref1">1</a></sup>.</p>
<section class="footnotes">
<ol>
<li id="fn1">
<p>Footnote <strong>can have markup</strong></p>
<p>and multiple paragraphs. <a href="#fnref1" class="footnote-backref">↩</a></p>
</li>
</ol>
</section>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

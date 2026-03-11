import Testing
@testable import Allmark

struct BlockquoteTests {
	@Test func simpleBlockquote() async {
		let input = "> Simple quote"
		let expected = """
		<blockquote>
		<p>Simple quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithMultipleLines() async {
		let input = """
		> Line 1
		> Line 2
		> Line 3
		"""
		let expected = """
		<blockquote>
		<p>Line 1
		Line 2
		Line 3</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithLazyContinuation() async {
		let input = """
		> Line 1
		Line 2
		> Line 3
		"""
		let expected = """
		<blockquote>
		<p>Line 1
		Line 2
		Line 3</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithSpaceAfter() async {
		let input = "> With space"
		let expected = """
		<blockquote>
		<p>With space</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithoutSpaceAfter() async {
		let input = ">Without space"
		let expected = """
		<blockquote>
		<p>Without space</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithMultipleParagraphs() async {
		let input = """
		> Paragraph 1
		>
		> Paragraph 2
		"""
		let expected = """
		<blockquote>
		<p>Paragraph 1</p>
		<p>Paragraph 2</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithCodeBlock() async {
		let input = """
		>     code block
		>     more code
		"""
		let expected = """
		<blockquote>
		<pre><code>code block
		more code
		</code></pre>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithList() async {
		let input = """
		> - Item 1
		> - Item 2
		"""
		let expected = """
		<blockquote>
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithNestedBlockquote() async {
		let input = """
		> Outer
		>> Inner
		>>> Innerer
		"""
		let expected = """
		<blockquote>
		<p>Outer</p>
		<blockquote>
		<p>Inner</p>
		<blockquote>
		<p>Innerer</p>
		</blockquote>
		</blockquote>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithHeading() async {
		let input = "> # Heading"
		let expected = """
		<blockquote>
		<h1>Heading</h1>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithInlineEmphasis() async {
		let input = "> *italic* and **bold**"
		let expected = """
		<blockquote>
		<p><em>italic</em> and <strong>bold</strong></p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithInlineCode() async {
		let input = "> `code` inside quote"
		let expected = """
		<blockquote>
		<p><code>code</code> inside quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithLink() async {
		let input = "> [link](https://example.com)"
		let expected = """
		<blockquote>
		<p><a href="https://example.com">link</a></p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWith1SpaceIndent() async {
		let input = " > Indented quote"
		let expected = """
		<blockquote>
		<p>Indented quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWith3SpaceIndent() async {
		let input = "   > Indented quote"
		let expected = """
		<blockquote>
		<p>Indented quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWith4SpaceIndentShouldBeCode() async {
		let input = "    > Not a quote"
		let expected = """
		<pre><code>&gt; Not a quote
		</code></pre>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleConsecutiveBlockquotes() async {
		let input = """
		> Quote 1

		> Quote 2
		"""
		let expected = """
		<blockquote>
		<p>Quote 1</p>
		</blockquote>
		<blockquote>
		<p>Quote 2</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquotePrecededByParagraphWithoutBlankLine() async {
		let input = """
		Paragraph
		> Quote
		"""
		let expected = """
		<p>Paragraph</p>
		<blockquote>
		<p>Quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithThematicBreak() async {
		let input = """
		> Text
		>
		> ---
		"""
		let expected = """
		<blockquote>
		<p>Text</p>
		<hr />
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithMultipleBlocks() async {
		let input = """
		> Paragraph
		>
		> - List item
		>
		> Code:
		>     code
		"""
		let expected = """
		<blockquote>
		<p>Paragraph</p>
		<ul>
		<li>List item</li>
		</ul>
		<p>Code:
		code</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithComplexNestedContent() async {
		let input = """
		> Quote
		>
		>> Nested quote
		>>
		>> - List in nested
		> Back to outer
		"""
		let expected = """
		<blockquote>
		<p>Quote</p>
		<blockquote>
		<p>Nested quote</p>
		<ul>
		<li>List in nested
		Back to outer</li>
		</ul>
		</blockquote>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyBlockquote() async {
		let input = ">"
		let expected = """
		<blockquote>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithOnlySpace() async {
		let input = "> "
		let expected = """
		<blockquote>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteAtEndOfDocument() async {
		let input = "> Last quote"
		let expected = """
		<blockquote>
		<p>Last quote</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithFencedCodeBlock() async {
		let input = """
		> ```
		> code
		> ```
		"""
		let expected = """
		<blockquote>
		<pre><code>code
		</code></pre>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithOrderedList() async {
		let input = """
		> 1. First
		> 2. Second
		"""
		let expected = """
		<blockquote>
		<ol>
		<li>First</li>
		<li>Second</li>
		</ol>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithSetextHeading() async {
		let input = """
		> Heading
		> =======
		"""
		let expected = """
		<blockquote>
		<h1>Heading</h1>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithHardLineBreaks() async {
		let input = """
		> Line 1  
		> Line 2
		"""
		let expected = """
		<blockquote>
		<p>Line 1<br />
		Line 2</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithImage() async {
		let input = "> ![alt](image.png)"
		let expected = """
		<blockquote>
		<p><img src="image.png" alt="alt" /></p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deeplyNestedBlockquotes() async {
		let input = """
		> Level 1
		>> Level 2
		>>> Level 3
		>>>> Level 4
		"""
		let expected = """
		<blockquote>
		<p>Level 1</p>
		<blockquote>
		<p>Level 2</p>
		<blockquote>
		<p>Level 3</p>
		<blockquote>
		<p>Level 4</p>
		</blockquote>
		</blockquote>
		</blockquote>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithMixedLazyContinuation() async {
		let input = """
		> Line 1
		> Line 2
		Line 3 (lazy)
		> Line 4
		"""
		let expected = """
		<blockquote>
		<p>Line 1
		Line 2
		Line 3 (lazy)
		Line 4</p>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithLooseList() async {
		let input = """
		> - Item 1
		>
		> - Item 2
		"""
		let expected = """
		<blockquote>
		<ul>
		<li>
		<p>Item 1</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ul>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithTightList() async {
		let input = """
		> - Item 1
		> - Item 2
		"""
		let expected = """
		<blockquote>
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func blockquoteWithHTMLBlock() async {
		let input = "> <div>HTML</div>"
		let expected = """
		<blockquote>
		<div>HTML</div>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

@testable import Allmark
import Testing

struct HeadingTests {
	@Test func atxHeadingLevel1() async {
		let input = "# Heading 1"
		let expected = """
		<h1>Heading 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingLevel2() async {
		let input = "## Heading 2"
		let expected = """
		<h2>Heading 2</h2>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingLevel3() async {
		let input = "### Heading 3"
		let expected = """
		<h3>Heading 3</h3>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingLevel4() async {
		let input = "#### Heading 4"
		let expected = """
		<h4>Heading 4</h4>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingLevel5() async {
		let input = "##### Heading 5"
		let expected = """
		<h5>Heading 5</h5>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingLevel6() async {
		let input = "###### Heading 6"
		let expected = """
		<h6>Heading 6</h6>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithClosingSequence() async {
		let input = "# Heading 1 #"
		let expected = """
		<h1>Heading 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithMultipleClosingHashes() async {
		let input = "## Heading 2 ###"
		let expected = """
		<h2>Heading 2</h2>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithClosingHashesAndSpaces() async {
		let input = "# Heading 1 #  "
		let expected = """
		<h1>Heading 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithInlineEmphasis() async {
		let input = "# *Heading* with **emphasis**"
		let expected = """
		<h1><em>Heading</em> with <strong>emphasis</strong></h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithInlineCode() async {
		let input = "# Heading with `code`"
		let expected = """
		<h1>Heading with <code>code</code></h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithLink() async {
		let input = "# Heading with [link](https://example.com)"
		let expected = """
		<h1>Heading with <a href="https://example.com">link</a></h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func setextHeadingLevel1WithEquals() async {
		let input = """
		Heading 1
		========
		"""
		let expected = """
		<h1>Heading 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func setextHeadingLevel2WithDashes() async {
		let input = """
		Heading 2
		--------
		"""
		let expected = """
		<h2>Heading 2</h2>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func setextHeadingWithMultilineContent() async {
		let input = """
		Heading 1
		line 2
		========
		"""
		let expected = """
		<h1>Heading 1
		line 2</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func setextHeadingWithInlineFormatting() async {
		let input = """
		*Heading* 1
		========
		"""
		let expected = """
		<h1><em>Heading</em> 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWith3SpaceIndent() async {
		let input = "   # Heading 1"
		let expected = """
		<h1>Heading 1</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWith4SpaceIndentShouldBeCode() async {
		let input = "    # Heading 1"
		let expected = """
		<pre><code># Heading 1
		</code></pre>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithoutSpaceAfterHashIsParagraph() async {
		let input = "#Not a heading"
		let expected = """
		<p>#Not a heading</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWith7HashCharactersIsParagraph() async {
		let input = "####### Not a heading"
		let expected = """
		<p>####### Not a heading</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithEmptyContent() async {
		let input = "# "
		let expected = """
		<h1></h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithOnlyHashAndClosingHash() async {
		let input = "## #"
		let expected = """
		<h2></h2>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func setextHeadingRequiresParagraphContent() async {
		let input = """
		- Not a heading
		========
		"""
		let expected = """
		<ul>
		<li>Not a heading
		========</li>
		</ul>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingEscapesClosingHashWithBackslash() async {
		let input = "# Heading with \\# escaped"
		let expected = """
		<h1>Heading with # escaped</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingAtEndOfDocument() async {
		let input = "# Last heading"
		let expected = """
		<h1>Last heading</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleAtxHeadings() async {
		let input = """
		# Heading 1
		## Heading 2
		### Heading 3
		"""
		let expected = """
		<h1>Heading 1</h1>
		<h2>Heading 2</h2>
		<h3>Heading 3</h3>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleSetextHeadings() async {
		let input = """
		Heading 1
		========

		Heading 2
		--------
		"""
		let expected = """
		<h1>Heading 1</h1>
		<h2>Heading 2</h2>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingPrecededByParagraphWithoutBlankLine() async {
		let input = """
		Paragraph
		# Heading
		"""
		let expected = """
		<p>Paragraph</p>
		<h1>Heading</h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func atxHeadingWithMixedInlineElements() async {
		let input = "# **Bold** text, *italic* text, `code`, and [link](https://example.com)"
		let expected = """
		<h1><strong>Bold</strong> text, <em>italic</em> text, <code>code</code>, and <a href="https://example.com">link</a></h1>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

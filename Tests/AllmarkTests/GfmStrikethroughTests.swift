import Testing
@testable import allmark

struct GfmStrikethroughTests {
	@Test func specStrikethrough() async {
		let input = "~~Hi~~ Hello, world!"
		let expected = """
<p><del>Hi</del> Hello, world!</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughSingleWord() async {
		let input = "~~deleted~~"
		let expected = """
<p><del>deleted</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughMultipleWords() async {
		let input = "~~this is deleted~~"
		let expected = """
<p><del>this is deleted</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithSpacesInside() async {
		let input = "~~  spaces  ~~"
		let expected = """
<p>~~  spaces  ~~</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithEmphasis() async {
		let input = "~~*bold and deleted*~~"
		let expected = """
<p><del><em>bold and deleted</em></del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughInsideEmphasis() async {
		let input = "*~~deleted in italic~~*"
		let expected = """
<p><em><del>deleted in italic</del></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithCode() async {
		let input = "~~code: `var x` here~~"
		let expected = """
<p><del>code: <code>var x</code> here</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithLink() async {
		let input = "~~[link text](http://example.com)~~"
		let expected = """
<p><del><a href="http://example.com">link text</a></del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleStrikethroughsInOneLine() async {
		let input = "~~first~~ and ~~second~~ and ~~third~~"
		let expected = """
<p><del>first</del> and <del>second</del> and <del>third</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughAtStartOfParagraph() async {
		let input = "~~deleted~~ followed by normal text."
		let expected = """
<p><del>deleted</del> followed by normal text.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughAtEndOfParagraph() async {
		let input = "Normal text followed by ~~deleted~~"
		let expected = """
<p>Normal text followed by <del>deleted</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughInListItem() async {
		let input = """
- ~~deleted item~~
- normal item
"""
		let expected = """
<ul>
<li><del>deleted item</del></li>
<li>normal item</li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithTildesInside() async {
		let input = "~~text with ~ tilde~~"
		let expected = """
<p><del>text with ~ tilde</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithMultipleTildes() async {
		let input = "~~~~double~~~~"
		let expected = """
<pre><code class="language-double~~~~"></code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughAcrossLines() async {
		let input = """
~~line one
line two~~
"""
		let expected = """
<p><del>line one
line two</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithPunctuation() async {
		let input = "~~Hello, world!~~"
		let expected = """
<p><del>Hello, world!</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithNumbers() async {
		let input = "~~12345~~"
		let expected = """
<p><del>12345</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughInTableCell() async {
		let input = """
| col1 | col2 |
| ---- | ---- |
| ~~deleted~~ | normal |
"""
		let expected = """
<table>
<thead>
<tr>
<th>col1</th>
<th>col2</th>
</tr>
</thead>
<tbody>
<tr>
<td><del>deleted</del></td>
<td>normal</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughAdjacentToRegularText() async {
		let input = "normal~~deleted~~normal"
		let expected = """
<p>normal<del>deleted</del>normal</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func strikethroughWithEscapedCharacters() async {
		let input = "~~text with \\*asterisk\\*~~"
		let expected = """
<p><del>text with *asterisk*</del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: gfmRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

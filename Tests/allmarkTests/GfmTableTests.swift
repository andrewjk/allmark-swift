import Testing
@testable import allmark

struct GfmTableTests {
	@Test func specTable() async {
		let input = """
| foo | bar |
| --- | --- |
| baz | bim |
"""
		let expected = """
<table>
<thead>
<tr>
<th>foo</th>
<th>bar</th>
</tr>
</thead>
<tbody>
<tr>
<td>baz</td>
<td>bim</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithAlignment() async {
		let input = """
| Left | Center | Right |
| :--- | :----: | ----: |
| foo  |  bar   |   baz |
| a    |   b    |     c |
"""
		let expected = """
<table>
<thead>
<tr>
<th align="left">Left</th>
<th align="center">Center</th>
<th align="right">Right</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left">foo</td>
<td align="center">bar</td>
<td align="right">baz</td>
</tr>
<tr>
<td align="left">a</td>
<td align="center">b</td>
<td align="right">c</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithInlineFormatting() async {
		let input = """
| Text | Code |
| ---- | ---- |
| **bold** | `code` |
| *italic* | [link](url) |
| ~~strike~~ | `multi` |
"""
		let expected = """
<table>
<thead>
<tr>
<th>Text</th>
<th>Code</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>bold</strong></td>
<td><code>code</code></td>
</tr>
<tr>
<td><em>italic</em></td>
<td><a href="url">link</a></td>
</tr>
<tr>
<td><del>strike</del></td>
<td><code>multi</code></td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithMissingCells() async {
		let input = """
| a | b | c |
| - | - | - |
| 1 | 2 |
| 1 |
"""
		let expected = """
<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
<th>c</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2</td>
<td></td>
</tr>
<tr>
<td>1</td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithExtraCells() async {
		let input = """
| a | b |
| - | - |
| 1 | 2 | 3 | 4 |
"""
		let expected = """
<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithOnlyHeader() async {
		let input = """
| foo | bar |
| --- | --- |
"""
		let expected = """
<table>
<thead>
<tr>
<th>foo</th>
<th>bar</th>
</tr>
</thead>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithEmptyCells() async {
		let input = """
| a | b | c |
| - | - | - |
|   | 2 |   |
| 1 |   | 3 |
"""
		let expected = """
<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
<th>c</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td>2</td>
<td></td>
</tr>
<tr>
<td>1</td>
<td></td>
<td>3</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithoutOuterPipes() async {
		let input = """
a | b | c
- | - | -
1 | 2 | 3
"""
		let expected = """
<p>a | b | c</p>
<ul>
<li>| - | -
1 | 2 | 3</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithWhitespaceVariations() async {
		let input = """
|  a  |  b  |  c  |
| --- | --- | --- |
| 1   |   2 |3    |
"""
		let expected = """
<table>
<thead>
<tr>
<th>a</th>
<th>b</th>
<th>c</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithMixedContentTypes() async {
		let input = """
| Type | Example |
| ---- | ------- |
| Text | plain text |
| Code | `inline` |
| Bold | **strong** |
| Link | [text](http://example.com) |
"""
		let expected = """
<table>
<thead>
<tr>
<th>Type</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr>
<td>Text</td>
<td>plain text</td>
</tr>
<tr>
<td>Code</td>
<td><code>inline</code></td>
</tr>
<tr>
<td>Bold</td>
<td><strong>strong</strong></td>
</tr>
<tr>
<td>Link</td>
<td><a href="http://example.com">text</a></td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithSingleColumn() async {
		let input = """
| Column |
| ------ |
| data   |
| more   |
"""
		let expected = """
<table>
<thead>
<tr>
<th>Column</th>
</tr>
</thead>
<tbody>
<tr>
<td>data</td>
</tr>
<tr>
<td>more</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tableWithManyColumns() async {
		let input = """
| A | B | C | D | E | F |
| - | - | - | - | - | - |
| 1 | 2 | 3 | 4 | 5 | 6 |
| a | b | c | d | e | f |
"""
		let expected = """
<table>
<thead>
<tr>
<th>A</th>
<th>B</th>
<th>C</th>
<th>D</th>
<th>E</th>
<th>F</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>2</td>
<td>3</td>
<td>4</td>
<td>5</td>
<td>6</td>
</tr>
<tr>
<td>a</td>
<td>b</td>
<td>c</td>
<td>d</td>
<td>e</td>
<td>f</td>
</tr>
</tbody>
</table>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

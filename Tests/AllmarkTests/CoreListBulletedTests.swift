@testable import Allmark
import Testing

struct CoreListBulletedTests {
	@Test func simpleBulletedListWithDashes() async {
		let input = """

		- Item

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func simpleBulletedListWithPlus() async {
		let input = """

		+ Item

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func simpleBulletedListWithAsterisks() async {
		let input = """

		* Item

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithMultipleItems() async {
		let input = """

		- Item 1
		- Item 2
		- Item 3

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		<li>Item 3</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func tightBulletedList() async {
		let input = """

		- Item 1
		- Item 2

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func looseBulletedListWithBlankLines() async {
		let input = """

		- Item 1

		- Item 2

		"""

		let expected = """
		<ul>
		<li>
		<p>Item 1</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func nestedBulletedLists() async {
		let input = """

		- Item 1
		  - Nested item
		- Item 2

		"""

		let expected = """
		<ul>
		<li>Item 1
		<ul>
		<li>Nested item</li>
		</ul>
		</li>
		<li>Item 2</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func deepNestedBulletedLists() async {
		let input = """

		- Level 1
		  - Level 2
		    - Level 3

		"""

		let expected = """
		<ul>
		<li>Level 1
		<ul>
		<li>Level 2
		<ul>
		<li>Level 3</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListInBlockquote() async {
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
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func emptyListItem() async {
		let input = """

		-

		"""

		let expected = """
		<ul>
		<li></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithParagraphs() async {
		let input = """

		- Item 1

		  Paragraph in item 1

		- Item 2

		"""

		let expected = """
		<ul>
		<li>
		<p>Item 1</p>
		<p>Paragraph in item 1</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListPrecededByParagraph() async {
		let input = """

		Paragraph

		- Item

		"""

		let expected = """
		<p>Paragraph</p>
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListFollowedByParagraph() async {
		let input = """

		- Item

		Paragraph

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>
		<p>Paragraph</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func mixedBulletMarkersShouldNotBeSameList() async {
		let input = """

		- Item 1
		+ Item 2

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		</ul>
		<ul>
		<li>Item 2</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithCodeBlock() async {
		let input = """

		- Item

		  ```
		  code
		  ```

		"""

		let expected = """
		<ul>
		<li>
		<p>Item</p>
		<pre><code>code
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithInlineFormatting() async {
		let input = """

		- Item with *emphasis*

		"""

		let expected = """
		<ul>
		<li>Item with <em>emphasis</em></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithBold() async {
		let input = """

		- Item with **bold**

		"""

		let expected = """
		<ul>
		<li>Item with <strong>bold</strong></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListItemWithMultipleParagraphsLoose() async {
		let input = """

		- Item 1

		  Second paragraph

		- Item 2

		"""

		let expected = """
		<ul>
		<li>
		<p>Item 1</p>
		<p>Second paragraph</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithLinks() async {
		let input = """

		- [Link](https://example.com)

		"""

		let expected = """
		<ul>
		<li><a href="https://example.com">Link</a></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithCodeSpan() async {
		let input = """

		- `inline code`

		"""

		let expected = """
		<ul>
		<li><code>inline code</code></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListAtEndOfDocument() async {
		let input = """

		- Item 1
		- Item 2

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func multipleSeparateBulletedLists() async {
		let input = """

		- List 1 item 1
		- List 1 item 2

		- List 2 item 1
		- List 2 item 2

		"""

		let expected = """
		<ul>
		<li>
		<p>List 1 item 1</p>
		</li>
		<li>
		<p>List 1 item 2</p>
		</li>
		<li>
		<p>List 2 item 1</p>
		</li>
		<li>
		<p>List 2 item 2</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListItemWithLeadingSpacesStillAList() async {
		let input = """

		   - Item

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListItemWith4SpacesIndentShouldBeCode() async {
		let input = """

		    - Item

		"""

		let expected = """
		<pre><code>- Item
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithOnlySpacesAfterMarker() async {
		let input = """

		-    Item

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func nestedListsWithDifferentMarkers() async {
		let input = """

		- Dash
		  + Plus
		    * Star

		"""

		let expected = """
		<ul>
		<li>Dash
		<ul>
		<li>Plus
		<ul>
		<li>Star</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListFollowedImmediatelyByOrderedList() async {
		let input = """

		- Item 1
		- Item 2
		1. Ordered 1
		2. Ordered 2

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>
		<ol>
		<li>Ordered 1</li>
		<li>Ordered 2</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func bulletedListWithThematicBreakInItem() async {
		let input = """

		- Item 1

		  ---

		- Item 2

		"""

		let expected = """
		<ul>
		<li>
		<p>Item 1</p>
		<hr />
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}
}

import Testing
@testable import allmark

struct ListOrderedTests {
	@Test func simpleOrderedListWithPeriodDelimiter() async {
		let input = "1. Item"
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func simpleOrderedListWithParenDelimiter() async {
		let input = "1) Item"
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListStartingAt1() async {
		let input = "1. Item"
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListStartingAt2() async {
		let input = "2. Item"
		let expected = """
		<ol start="2">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListStartingAt10() async {
		let input = "10. Item"
		let expected = """
		<ol start="10">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListStartingAt0() async {
		let input = "0. Item"
		let expected = """
		<ol start="0">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithLargeStartNumber() async {
		let input = "123456789. Item"
		let expected = """
		<ol start="123456789">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithTooLargeNumber() async {
		let input = "1234567890. Item"
		let expected = """
		<p>1234567890. Item</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithLeadingZeros() async {
		let input = "003. Item"
		let expected = """
		<ol start="3">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithMultipleItems() async {
		let input = """
		1. Item 1
		2. Item 2
		3. Item 3
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		<li>Item 3</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithSequentialNumbersDisregarded() async {
		let input = """
		1. Item 1
		1. Item 2
		1. Item 3
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		<li>Item 3</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithMixedNumbersDisregarded() async {
		let input = """
		1. Item 1
		5. Item 2
		3. Item 3
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		<li>Item 3</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tightOrderedList() async {
		let input = """
		1. Item 1
		2. Item 2
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func looseOrderedListWithBlankLines() async {
		let input = """
		1. Item 1

		2. Item 2
		"""
		let expected = """
		<ol>
		<li>
		<p>Item 1</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func nestedOrderedList() async {
		let input = """
		1. Item 1
		   1. Nested item
		2. Item 2
		"""
		let expected = """
		<ol>
		<li>Item 1
		<ol>
		<li>Nested item</li>
		</ol>
		</li>
		<li>Item 2</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func deepNestedOrderedList() async {
		let input = """
		1. Level 1
		   1. Level 2
		      1. Level 3
		"""
		let expected = """
		<ol>
		<li>Level 1
		<ol>
		<li>Level 2
		<ol>
		<li>Level 3</li>
		</ol>
		</li>
		</ol>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListInBlockquote() async {
		let input = """
		> 1. Item 1
		> 2. Item 2
		"""
		let expected = """
		<blockquote>
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		</ol>
		</blockquote>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyOrderedListItem() async {
		let input = "1."
		let expected = """
		<ol>
		<li></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithParagraphs() async {
		let input = """
		1. Item 1

		   Paragraph in item 1

		2. Item 2
		"""
		let expected = """
		<ol>
		<li>
		<p>Item 1</p>
		<p>Paragraph in item 1</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListPrecededByParagraph() async {
		let input = """
		Paragraph

		1. Item
		"""
		let expected = """
		<p>Paragraph</p>
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListFollowedByParagraph() async {
		let input = """
		1. Item

		Paragraph
		"""
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		<p>Paragraph</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func mixedDelimitersShouldNotBeSameList() async {
		let input = """
		1. Item 1
		1) Item 2
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		</ol>
		<ol>
		<li>Item 2</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithCodeBlock() async {
		let input = """
		1. Item

		   ```
		   code
		   ```
		"""
		let expected = """
		<ol>
		<li>
		<p>Item</p>
		<pre><code>code
		</code></pre>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithInlineFormatting() async {
		let input = "1. Item with *emphasis*"
		let expected = """
		<ol>
		<li>Item with <em>emphasis</em></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithBold() async {
		let input = "1. Item with **bold**"
		let expected = """
		<ol>
		<li>Item with <strong>bold</strong></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListItemWithMultipleParagraphs() async {
		let input = """
		1. Item 1

		   Second paragraph

		2. Item 2
		"""
		let expected = """
		<ol>
		<li>
		<p>Item 1</p>
		<p>Second paragraph</p>
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithLinks() async {
		let input = "1. [Link](https://example.com)"
		let expected = """
		<ol>
		<li><a href="https://example.com">Link</a></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithCodeSpan() async {
		let input = "1. `inline code`"
		let expected = """
		<ol>
		<li><code>inline code</code></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListAtEndOfDocument() async {
		let input = """
		1. Item 1
		2. Item 2
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleSeparateOrderedLists() async {
		let input = """
		1. List 1 item 1
		2. List 1 item 2

		1. List 2 item 1
		2. List 2 item 2
		"""
		let expected = """
		<ol>
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
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListItemWithLeadingSpaces() async {
		let input = "   1. Item"
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListItemWith4SpacesIndentShouldBeCode() async {
		let input = "    1. Item"
		let expected = """
		<pre><code>1. Item
		</code></pre>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithOnlySpacesAfterMarker() async {
		let input = "1.    Item"
		let expected = """
		<ol>
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func nestedOrderedAndBulletedLists() async {
		let input = """
		1. Ordered
		   - Bulleted
		      1. Nested ordered
		"""
		let expected = """
		<ol>
		<li>Ordered
		<ul>
		<li>Bulleted
		<ol>
		<li>Nested ordered</li>
		</ol>
		</li>
		</ul>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListFollowedByBulletedList() async {
		let input = """
		1. Item 1
		2. Item 2
		- Bullet 1
		- Bullet 2
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		</ol>
		<ul>
		<li>Bullet 1</li>
		<li>Bullet 2</li>
		</ul>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithParenDelimiterMultipleItems() async {
		let input = """
		1) Item 1
		2) Item 2
		3) Item 3
		"""
		let expected = """
		<ol>
		<li>Item 1</li>
		<li>Item 2</li>
		<li>Item 3</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithParenDelimiterStartingAt5() async {
		let input = "5) Item"
		let expected = """
		<ol start="5">
		<li>Item</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListItemWithNestedBulletedList() async {
		let input = """
		1. Item
		   - Nested bullet
		   - Another bullet
		"""
		let expected = """
		<ol>
		<li>Item
		<ul>
		<li>Nested bullet</li>
		<li>Another bullet</li>
		</ul>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func notAnOrderedListTextAfterNumber() async {
		let input = "1.5 is a number"
		let expected = """
		<p>1.5 is a number</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func notAnOrderedListNoSpaceAfterDelimiter() async {
		let input = "1.Item"
		let expected = """
		<p>1.Item</p>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListAtEndOfLineWithoutSpace() async {
		let input = "1."
		let expected = """
		<ol>
		<li></li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func orderedListWithThematicBreakInItem() async {
		let input = """
		1. Item 1

		   ---

		2. Item 2
		"""
		let expected = """
		<ol>
		<li>
		<p>Item 1</p>
		<hr />
		</li>
		<li>
		<p>Item 2</p>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

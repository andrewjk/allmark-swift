@testable import Allmark
import Testing

struct CoreThematicBreakTests {
	@Test func simpleThematicBreakWithDashes() async {
		let input = """

		---

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func simpleThematicBreakWithAsterisks() async {
		let input = """

		***

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func simpleThematicBreakWithUnderscores() async {
		let input = """

		___

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWith4Dashes() async {
		let input = """

		----

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWith5Asterisks() async {
		let input = """

		*****

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithSpacesBetweenCharacters() async {
		let input = """

		- - -

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithTabsBetweenCharacters() async {
		let input = """

		*	*	*

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWith1SpaceIndent() async {
		let input = """

		 ---

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWith3SpaceIndent() async {
		let input = """

		   ---

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWith4SpaceIndentShouldBeCode() async {
		let input = """

		    ---

		"""

		let expected = """
		<pre><code>---
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakFollowedByParagraphWithoutBlankLine() async {
		let input = """

		---
		Paragraph

		"""

		let expected = """
		<hr />
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func multipleThematicBreaks() async {
		let input = """

		---

		***

		"""

		let expected = """
		<hr />
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidOnly2Dashes() async {
		let input = """

		--

		"""

		let expected = """
		<p>--</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidOnly2Asterisks() async {
		let input = """

		**

		"""

		let expected = """
		<p>**</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidOnly2Underscores() async {
		let input = """

		__

		"""

		let expected = """
		<p>__</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidMixedCharacters() async {
		let input = """

		-*-

		"""

		let expected = """
		<p>-*-</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidMixedDashesAndAsterisks() async {
		let input = """

		---***

		"""

		let expected = """
		<p>---***</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakInBlockquote() async {
		let input = """

		> ---

		"""

		let expected = """
		<blockquote>
		<hr />
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakInListItem() async {
		let input = """

		- Item
		---

		"""

		let expected = """
		<ul>
		<li>Item</li>
		</ul>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithTrailingSpaces() async {
		let input = """

		---   

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithTrailingTabs() async {
		let input = """

		***		

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakAfterListWithoutBlankLine() async {
		let input = """

		- Item 1
		- Item 2
		---

		"""

		let expected = """
		<ul>
		<li>Item 1</li>
		<li>Item 2</li>
		</ul>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakBeforeListWithoutBlankLine() async {
		let input = """

		---
		- Item

		"""

		let expected = """
		<hr />
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakAtEndOfDocument() async {
		let input = """

		> Quote
		---

		"""

		let expected = """
		<blockquote>
		<p>Quote</p>
		</blockquote>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakBetweenParagraphs() async {
		let input = """

		Paragraph 1

		---

		Paragraph 2

		"""

		let expected = """
		<p>Paragraph 1</p>
		<hr />
		<p>Paragraph 2</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakBetweenParagraphsWithoutBlankLines() async {
		let input = """

		Paragraph 1

		---
		Paragraph 2

		"""

		let expected = """
		<p>Paragraph 1</p>
		<hr />
		<p>Paragraph 2</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakAfterHeading() async {
		let input = """

		# Heading
		---

		"""

		let expected = """
		<h1>Heading</h1>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakBeforeHeading() async {
		let input = """

		---
		# Heading

		"""

		let expected = """
		<hr />
		<h1>Heading</h1>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithCodeBlockAbove() async {
		let input = """

		```
		code
		```
		---

		"""

		let expected = """
		<pre><code>code
		</code></pre>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithCodeBlockBelow() async {
		let input = """

		---
		```
		code
		```

		"""

		let expected = """
		<hr />
		<pre><code>code
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakInNestedBlockquote() async {
		let input = """

		> Quote
		>
		> ---
		> More quote

		"""

		let expected = """
		<blockquote>
		<p>Quote</p>
		<hr />
		<p>More quote</p>
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithVeryLongSequence() async {
		let input = """

		--------------------------------------------------

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidStartsWithDashButHasSpaces() async {
		let input = """

		-   -   -

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithInlineElementsAbove() async {
		let input = """

		Text with *emphasis*

		---

		"""

		let expected = """
		<p>Text with <em>emphasis</em></p>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithInlineElementsBelow() async {
		let input = """

		---
		Text with **bold**

		"""

		let expected = """
		<hr />
		<p>Text with <strong>bold</strong></p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakBetweenBlockquotes() async {
		let input = """

		> Quote 1

		---

		> Quote 2

		"""

		let expected = """
		<blockquote>
		<p>Quote 1</p>
		</blockquote>
		<hr />
		<blockquote>
		<p>Quote 2</p>
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithSetextHeading() async {
		let input = """

		Heading
		=======
		---

		"""

		let expected = """
		<h1>Heading</h1>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakAfterOrderedList() async {
		let input = """

		1. First
		2. Second
		---

		"""

		let expected = """
		<ol>
		<li>First</li>
		<li>Second</li>
		</ol>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func emptyThematicBreakShouldNotMatch() async {
		let input = """



		"""

		let expected = """

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func textThatLooksLikeThematicBreakButHasOtherContent() async {
		let input = """

		--- text

		"""

		let expected = """
		<p>--- text</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakPrecededByCodeFence() async {
		let input = """

		```
		code
		```
		---

		"""

		let expected = """
		<pre><code>code
		</code></pre>
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidLessThan3CharsWithSpaces() async {
		let input = """

		- -

		"""

		let expected = """
		<ul>
		<li>
		<ul>
		<li></li>
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakAfterLooseList() async {
		let input = """

		- Item 1

		- Item 2
		---

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
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakInFencedCodeBlockShouldNotBeInterpreted() async {
		let input = """

		```
		---
		```

		"""

		let expected = """
		<pre><code>---
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakWithMixedSpacing() async {
		let input = """

		  *  *  *  

		"""

		let expected = """
		<hr />

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func thematicBreakNotValidTextAfterSpaces() async {
		let input = """

		---   text

		"""

		let expected = """
		<p>---   text</p>

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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}
}

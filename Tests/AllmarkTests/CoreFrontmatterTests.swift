@testable import Allmark
import Testing

struct CoreFrontmatterTests {
	@Test func frontmatterWithYAMLDelimiters() async {
		let input = """

		---
		title: Test
		date: 2024-01-01
		---

		# Heading

		Content

		"""

		let expected = """
		<h1>Heading</h1>
		<p>Content</p>

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

	@Test func frontmatterAtDocumentStartOnly() async {
		let input = """

		# Heading

		---
		title: Test
		---

		Content

		"""

		let expected = """
		<h1>Heading</h1>
		<hr />
		<h2>title: Test</h2>
		<p>Content</p>

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

	@Test func frontmatterWithSingleLineContent() async {
		let input = """

		---
		title: Test
		---

		# Heading

		"""

		let expected = """
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

	@Test func frontmatterWithMultipleLines() async {
		let input = """

		---
		title: Test
		date: 2024-01-01
		author: John Doe
		tags:
		  - one
		  - two
		---

		# Heading

		"""

		let expected = """
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

	@Test func frontmatterWithClosingDelimiterOnSeparateLine() async {
		let input = """

		---
		title: Test

		---

		# Heading

		"""

		let expected = """
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

	@Test func frontmatterWithContentFollowingClosingDelimiter() async {
		let input = """

		---
		title: Test
		---
		Content here

		"""

		let expected = """
		<p>Content here</p>

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

	@Test func paragraphAfterFrontmatterFollowedByBlankLine() async {
		let input = """

		---
		title: Test
		---

		a
		b

		"""

		let expected = """
		<p>a
		b</p>

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

	@Test func paragraphAfterFrontmatterFollowedByLineWithSpaces() async {
		let input = """

		---
		title: Test
		---
		 
		a
		b

		"""

		let expected = """
		<p>a
		b</p>

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

	@Test func paragraphAfterFrontmatterFollowedByLineWithTabs() async {
		let input = """

		---
		title: Test
		---
			
		a
		b

		"""

		let expected = """
		<p>a
		b</p>

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

	@Test func multipleWhitespaceOnlyLinesAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---
		 
			
		   
		a
		b

		"""

		let expected = """
		<p>a
		b</p>

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

	@Test func indentedCodeAfterFrontmatterBlankLine() async {
		let input = """

		---
		title: Test
		---

		    hello

		"""

		let expected = """
		<pre><code>hello
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

	@Test func thematicBreakAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---

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

	@Test func listAfterWhitespaceOnlyLineAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---
		 
		- a
		- b

		"""

		let expected = """
		<ul>
		<li>a</li>
		<li>b</li>
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

	@Test func paragraphsSplitByBlankLineAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---

		a

		b

		"""

		let expected = """
		<p>a</p>
		<p>b</p>

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

	@Test func horizontalRuleAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---

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

	@Test func frontmatterBlockAfterFrontmatter() async {
		let input = """

		---
		title: Test
		---

		---
		x
		---

		a

		"""

		let expected = """
		<hr />
		<h2>x</h2>
		<p>a</p>

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

	@Test func closingDelimiterAtEndOfFile() async {
		let input = """

		---
		title: Test
		---

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

	@Test func emptyFrontmatterAtEndOfFile() async {
		let input = """

		---
		---

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

	@Test func indentedFrontmatterIsNotRecognized() async {
		let input = """

		  ---
		title: Test
		---

		a

		"""

		let expected = """
		<hr />
		<h2>title: Test</h2>
		<p>a</p>

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

	@Test func closingDelimiterMustBeOnItsOwnLine() async {
		let input = """

		---
		title: Test
		foo---
		bar

		"""

		let expected = """
		<hr />
		<p>title: Test
		foo---
		bar</p>

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

	@Test func fourDashLineIsNotAClosingDelimiter() async {
		let input = """

		---
		title: Test
		----

		a

		"""

		let expected = """
		<hr />
		<h2>title: Test</h2>
		<p>a</p>

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

	@Test func frontmatterAfterBlankLines() async {
		let input = """


		---
		title: Test
		---

		a

		"""

		let expected = """
		<p>a</p>

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

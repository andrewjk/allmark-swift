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
		}
	}
}

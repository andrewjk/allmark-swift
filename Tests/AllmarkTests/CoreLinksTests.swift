@testable import Allmark
import Testing

struct CoreLinksTests {
	@Test func basicInlineLink() async {
		let input = """

		[Google](https://google.com)

		"""

		let expected = """
		<p><a href="https://google.com">Google</a></p>

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

	@Test func linkWithTitle() async {
		let input = """

		[Google](https://google.com "Search Engine")

		"""

		let expected = """
		<p><a href="https://google.com" title="Search Engine">Google</a></p>

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

	@Test func linkWithSingleQuotedTitle() async {
		let input = """

		[Google](https://google.com 'Search Engine')

		"""

		let expected = """
		<p><a href="https://google.com" title="Search Engine">Google</a></p>

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

	@Test func linkInParagraph() async {
		let input = """

		Visit [Google](https://google.com) for search.

		"""

		let expected = """
		<p>Visit <a href="https://google.com">Google</a> for search.</p>

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

	@Test func multipleLinksInOneLine() async {
		let input = """

		[Google](https://google.com) and [GitHub](https://github.com)

		"""

		let expected = """
		<p><a href="https://google.com">Google</a> and <a href="https://github.com">GitHub</a></p>

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

	@Test func linkWithEmphasis() async {
		let input = """

		[*Google*](https://google.com)

		"""

		let expected = """
		<p><a href="https://google.com"><em>Google</em></a></p>

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

	@Test func emphasisAroundLink() async {
		let input = """

		*[Google](https://google.com)*

		"""

		let expected = """
		<p><em><a href="https://google.com">Google</a></em></p>

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

	@Test func linkWithCodeInText() async {
		let input = """

		[`const`](https://example.com)

		"""

		let expected = """
		<p><a href="https://example.com"><code>const</code></a></p>

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

	@Test func linkInListItem() async {
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

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: coreRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func linkInHeading() async {
		let input = """

		# See [Google](https://google.com)

		"""

		let expected = """
		<h1>See <a href="https://google.com">Google</a></h1>

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

	@Test func referenceLinkDefinitionAndUsage() async {
		let input = """

		[Google][google]

		[google]: https://google.com

		"""

		let expected = """
		<p><a href="https://google.com">Google</a></p>

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

	@Test func referenceLinkWithImplicitLabel() async {
		let input = """

		[Google][]

		[Google]: https://google.com

		"""

		let expected = """
		<p><a href="https://google.com">Google</a></p>

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

	@Test func referenceLinkWithTitle() async {
		let input = """

		[Google][google]

		[google]: https://google.com "Search Engine"

		"""

		let expected = """
		<p><a href="https://google.com" title="Search Engine">Google</a></p>

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

	@Test func multipleReferenceLinks() async {
		let input = """

		[Google][google] and [GitHub][github]

		[google]: https://google.com
		[github]: https://github.com

		"""

		let expected = """
		<p><a href="https://google.com">Google</a> and <a href="https://github.com">GitHub</a></p>

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

	@Test func autolinkWithHttp() async {
		let input = """

		<http://example.com>

		"""

		let expected = """
		<p><a href="http://example.com">http://example.com</a></p>

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

	@Test func autolinkWithHttps() async {
		let input = """

		<https://example.com>

		"""

		let expected = """
		<p><a href="https://example.com">https://example.com</a></p>

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

	@Test func autolinkWithFtp() async {
		let input = """

		<ftp://example.com>

		"""

		let expected = """
		<p><a href="ftp://example.com">ftp://example.com</a></p>

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

	@Test func emailAutolink() async {
		let input = """

		<user@example.com>

		"""

		let expected = """
		<p><a href="mailto:user@example.com">user@example.com</a></p>

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

	@Test func linkWithSpecialCharactersInURL() async {
		let input = """

		[Link](https://example.com/path?query=value&other=123#anchor)

		"""

		let expected = """
		<p><a href="https://example.com/path?query=value&amp;other=123#anchor">Link</a></p>

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

	@Test func linkWithParenthesesInURL() async {
		let input = """

		[Link](https://example.com/path(with)parentheses)

		"""

		let expected = """
		<p><a href="https://example.com/path(with)parentheses">Link</a></p>

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

	@Test func linkWithSpacesInTitle() async {
		let input = """

		[Link](https://example.com "This is a title")

		"""

		let expected = """
		<p><a href="https://example.com" title="This is a title">Link</a></p>

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

	@Test func linkWithEscapedBracketsInText() async {
		let input = """

		[[link]](https://example.com)

		"""

		let expected = """
		<p><a href="https://example.com">[link]</a></p>

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

	@Test func emptyLinkText() async {
		let input = """

		[](https://example.com)

		"""

		let expected = """
		<p><a href="https://example.com"></a></p>

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

	@Test func linkWithUnderscoreInURL() async {
		let input = """

		[Link](https://example.com/path_with_underscore)

		"""

		let expected = """
		<p><a href="https://example.com/path_with_underscore">Link</a></p>

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

	@Test func relativeURL() async {
		let input = """

		[Link](/path/to/page)

		"""

		let expected = """
		<p><a href="/path/to/page">Link</a></p>

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

	@Test func linkWithPercentEncoding() async {
		let input = """

		[Link](https://example.com/path%20with%20spaces)

		"""

		let expected = """
		<p><a href="https://example.com/path%20with%20spaces">Link</a></p>

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

@testable import Allmark
import Testing

struct ExtSubscriptTests {
	@Test func subscriptSingle() async {
		let input = """

		This should be ~down~ below everything else.

		"""

		let expected = """
		<p>This should be <sub>down</sub> below everything else.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptDouble() async {
		let input = """

		This should be ~~down~~ below everything else.

		"""

		let expected = """
		<p>This should be <del>down</del> below everything else.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptTriple() async {
		let input = """

		This should be ~~~down~~~ below everything else.

		"""

		let expected = """
		<p>This should be ~~~down~~~ below everything else.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptSingleCharacter() async {
		let input = """

		H~2~O

		"""

		let expected = """
		<p>H<sub>2</sub>O</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithNumbers() async {
		let input = """

		x~1~ + x~2~

		"""

		let expected = """
		<p>x<sub>1</sub> + x<sub>2</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func multipleSubscriptsInOneLine() async {
		let input = """

		a~i~ + b~j~ = c~k~

		"""

		let expected = """
		<p>a<sub>i</sub> + b<sub>j</sub> = c<sub>k</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptAtStartOfParagraph() async {
		let input = """

		~note~ This is important.

		"""

		let expected = """
		<p><sub>note</sub> This is important.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptAtEndOfParagraph() async {
		let input = """

		See index~1~

		"""

		let expected = """
		<p>See index<sub>1</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithPunctuation() async {
		let input = """

		Hello~world!~

		"""

		let expected = """
		<p>Hello<sub>world!</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithSpaces() async {
		let input = """

		text ~with spaces~ more

		"""

		let expected = """
		<p>text <sub>with spaces</sub> more</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithSpecialCharacters() async {
		let input = """

		math~i+j~

		"""

		let expected = """
		<p>math<sub>i+j</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptAdjacentToText() async {
		let input = """

		test~ing~test

		"""

		let expected = """
		<p>test<sub>ing</sub>test</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func emptySubscript() async {
		let input = """

		text~~text

		"""

		let expected = """
		<p>text~~text</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithMarkdownInside() async {
		let input = """

		text ~**bold**~

		"""

		let expected = """
		<p>text <sub><strong>bold</strong></sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithCodeInside() async {
		let input = """

		text ~`code`~

		"""

		let expected = """
		<p>text <sub><code>code</code></sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func escapedTildeShouldNotBeSubscript() async {
		let input = """

		text \\~not subscript\\~

		"""

		let expected = """
		<p>text ~not subscript~</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func unmatchedOpeningTilde() async {
		let input = """

		text ~not closed

		"""

		let expected = """
		<p>text ~not closed</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func unmatchedClosingTilde() async {
		let input = """

		text not opened~

		"""

		let expected = """
		<p>text not opened~</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptInListItem() async {
		let input = """

		- Item with ~subscript~

		"""

		let expected = """
		<ul>
		<li>Item with <sub>subscript</sub></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptInBlockquote() async {
		let input = """

		> Quote with ~subscript~

		"""

		let expected = """
		<blockquote>
		<p>Quote with <sub>subscript</sub></p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func strikethroughVsSubscriptPrecedence() async {
		let input = """

		This is ~~deleted~~ text.

		"""

		let expected = """
		<p>This is <del>deleted</del> text.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func subscriptWithTildeInside() async {
		let input = """

		text ~tilde ~ inside~

		"""

		let expected = """
		<p>text <sub>tilde ~ inside</sub></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}

	@Test func strikethroughStillWorks() async {
		let input = """

		text ~~struck~~, not subscripted

		"""

		let expected = """
		<p>text <del>struck</del>, not subscripted</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: extendedRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)
		}
	}
}

@testable import Allmark
import Testing

struct CoreFencedCodeTests {
	@Test func simpleCodeFenceWithBackticks() async {
		let input = """

		```
		code
		```

		"""

		let expected = """
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

	@Test func simpleCodeFenceWithTildes() async {
		let input = """

		~~~
		code
		~~~

		"""

		let expected = """
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

	@Test func codeFenceWith4Backticks() async {
		let input = """

		````
		code
		````

		"""

		let expected = """
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

	@Test func codeFenceWith5Tildes() async {
		let input = """

		~~~~~
		code
		~~~~~

		"""

		let expected = """
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

	@Test func codeFenceWithLanguageSpecifier() async {
		let input = """

		```javascript
		const x = 1;
		```

		"""

		let expected = """
		<pre><code class="language-javascript">const x = 1;
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

	@Test func codeFenceWithLanguageSpecifierAndExtraText() async {
		let input = """

		```javascript extra
		const x = 1;
		```

		"""

		let expected = """
		<pre><code class="language-javascript">const x = 1;
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

	@Test func codeFenceWithEmptyContent() async {
		let input = """

		```
		```

		"""

		let expected = """
		<pre><code></code></pre>

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

	@Test func codeFenceWithMultiLineContent() async {
		let input = """

		```
		line 1
		line 2
		line 3
		```

		"""

		let expected = """
		<pre><code>line 1
		line 2
		line 3
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

	@Test func codeFenceWith1SpaceIndent() async {
		let input = """

		 ```
		code
		```

		"""

		let expected = """
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

	@Test func codeFenceWith3SpaceIndent() async {
		let input = """

		   ```
		code
		```

		"""

		let expected = """
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

	@Test func codeFenceWith4SpaceIndentShouldBeCode() async {
		let input = """

		    ```
		code
		```

		"""

		let expected = """
		<pre><code>```
		</code></pre>
		<p>code</p>
		<pre><code></code></pre>

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

	@Test func codeFenceInterruptsParagraph() async {
		let input = """

		Paragraph
		```
		code
		```

		"""

		let expected = """
		<p>Paragraph</p>
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

	@Test func codeFenceWithoutSpaceAfterOpening() async {
		let input = """

		```code
		```

		"""

		let expected = """
		<pre><code class="language-code"></code></pre>

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

	@Test func codeFenceWithBlankLineInContent() async {
		let input = """

		```
		line 1

		line 2
		```

		"""

		let expected = """
		<pre><code>line 1

		line 2
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

	@Test func codeFenceNotValidOnly2Backticks() async {
		let input = """

		``
		code
		``

		"""

		let expected = """
		<p><code>code</code></p>

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

	@Test func codeFenceNotValidOnly2Tildes() async {
		let input = """

		~~
		code
		~~

		"""

		let expected = """
		<p>~~
		code
		~~</p>

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

	@Test func codeFenceNotValidMixedBackticksAndTildes() async {
		let input = """

		`~`
		code
		`~`

		"""

		let expected = """
		<p><code>~</code>
		code
		<code>~</code></p>

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

	@Test func codeFenceNotValidInfoStringWithBackticks() async {
		let input = """

		```code with backtick`
		code
		```

		"""

		let expected = """
		<p>```code with backtick`
		code</p>
		<pre><code></code></pre>

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

	@Test func codeFenceWithBackticksInContent() async {
		let input = """

		```
		code with `backticks`
		```

		"""

		let expected = """
		<pre><code>code with `backticks`
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

	@Test func codeFenceWithTildesInContent() async {
		let input = """

		~~~
		code with ~tildes~
		~~~

		"""

		let expected = """
		<pre><code>code with ~tildes~
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

	@Test func codeFencePrecededByParagraphWithoutBlankLine() async {
		let input = """

		Paragraph
		```
		code
		```

		"""

		let expected = """
		<p>Paragraph</p>
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

	@Test func codeFenceFollowedByParagraphWithoutBlankLine() async {
		let input = """

		```
		code
		```
		Paragraph

		"""

		let expected = """
		<pre><code>code
		</code></pre>
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

	@Test func multipleCodeFences() async {
		let input = """

		```
		code1
		```

		```
		code2
		```

		"""

		let expected = """
		<pre><code>code1
		</code></pre>
		<pre><code>code2
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

	@Test func codeFenceWithInlineMarkdownInContent() async {
		let input = """

		```
		*not italic*
		**not bold**
		```

		"""

		let expected = """
		<pre><code>*not italic*
		**not bold**
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

	@Test func codeFenceAtEndOfDocument() async {
		let input = """

		```
		code
		```

		"""

		let expected = """
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

	@Test func codeFenceInBlockquote() async {
		let input = """

		> ```
		code
		```

		"""

		let expected = """
		<blockquote>
		<pre><code></code></pre>
		</blockquote>
		<p>code</p>
		<pre><code></code></pre>

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

	@Test func codeFenceInListItem() async {
		let input = """

		- ```
		code
		```

		"""

		let expected = """
		<ul>
		<li>
		<pre><code></code></pre>
		</li>
		</ul>
		<p>code</p>
		<pre><code></code></pre>

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

	@Test func codeFenceWithTrailingSpacesAfterOpening() async {
		let input = """

		```   
		code
		```

		"""

		let expected = """
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

	@Test func codeFenceWithTrailingSpacesAfterClosing() async {
		let input = """

		```
		code
		```   

		"""

		let expected = """
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

	@Test func codeFenceWithVeryLongOpening() async {
		let input = """

		``````````
		code
		``````````

		"""

		let expected = """
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

	@Test func codeFenceWithShorterClosing() async {
		let input = """

		`````
		code
		```

		"""

		let expected = """
		<pre><code>code
		```
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

	@Test func codeFenceNotValidClosingFenceShorterThanOpening() async {
		let input = """

		```
		code
		``

		"""

		let expected = """
		<pre><code>code
		``
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

	@Test func codeFenceWithLanguageContainingNumbers() async {
		let input = """

		```python3
		import x
		```

		"""

		let expected = """
		<pre><code class="language-python3">import x
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

	@Test func codeFenceWithLanguageContainingDashes() async {
		let input = """

		```c++
		int main() {}
		```

		"""

		let expected = """
		<pre><code class="language-c++">int main() {}
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

	@Test func codeFenceWithTrailingWhitespaceOnClosingFence() async {
		let input = """

		```
		code
		```   

		"""

		let expected = """
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

	@Test func codeFenceBetweenParagraphs() async {
		let input = """

		Paragraph 1

		```
		code
		```

		Paragraph 2

		"""

		let expected = """
		<p>Paragraph 1</p>
		<pre><code>code
		</code></pre>
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

	@Test func codeFenceWithBackslashInInfoString() async {
		let input = """

		```javascript\\test
		code
		```

		"""

		let expected = """
		<pre><code class="language-javascript\\test">code
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

	@Test func codeFenceWithHTMLEntitiesInInfo() async {
		let input = """

		```&lt;test&gt;
		code
		```

		"""

		let expected = """
		<pre><code class="language-&lt;test&gt;">code
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

	@Test func codeFenceWithIndentedContentLines() async {
		let input = """

		 ```
		    indented
		not indented
		```

		"""

		let expected = """
		<pre><code>   indented
		not indented
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

	@Test func codeFenceNotValidSpaceBetweenFenceChars() async {
		let input = """

		` ` `
		code
		` ` `

		"""

		let expected = """
		<p><code> </code> <code>code</code> <code> </code></p>

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

	@Test func codeFenceWithOnlyInfoString() async {
		let input = """

		```javascript
		```

		"""

		let expected = """
		<pre><code class="language-javascript"></code></pre>

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

	@Test func codeFenceWithSetextHeadingAbove() async {
		let input = """

		Heading
		=======
		```
		code
		```

		"""

		let expected = """
		<h1>Heading</h1>
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

	@Test func codeFenceWithATXHeadingBelow() async {
		let input = """

		```
		code
		```
		# Heading

		"""

		let expected = """
		<pre><code>code
		</code></pre>
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
}

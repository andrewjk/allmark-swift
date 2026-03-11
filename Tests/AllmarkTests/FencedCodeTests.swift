import Testing
@testable import Allmark

struct FencedCodeTests {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func codeFenceWithMultilineContent() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func codeFenceWithVeryLongOpening() async {
		let input = """
		``````````````
		code
		``````````````
		"""
		let expected = """
		<pre><code>code
		</code></pre>
		"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func codeFenceWithAtxHeadingBelow() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

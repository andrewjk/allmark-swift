import Testing
@testable import allmark

struct IndentedCodeTests {
	@Test func simple4SpaceIndentedCode() async {
		let input = "    code here"
		let expected = """
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tabIndentedCode() async {
		let input = "\tcode here"
		let expected = """
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multilineIndentedCode() async {
		let input = """
		    line 1
		    line 2
		    line 3
		"""
		let expected = """
		<pre><code>line 1
		line 2
		line 3
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func lessThan4SpacesShouldBeParagraph() async {
		let input = "   code here"
		let expected = """
		<p>code here</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func fiveSpaceIndentedCode() async {
		let input = "     code here"
		let expected = """
		<pre><code> code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func eightSpaceIndentedCode() async {
		let input = "        code here"
		let expected = """
		<pre><code>    code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockWithBlankLineInMiddle() async {
		let input = """
		    line 1

		    line 2
		"""
		let expected = """
		<pre><code>line 1

		line 2
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockInterruptsParagraphWithBlankLine() async {
		let input = """
		Paragraph

		    code here
		"""
		let expected = """
		<p>Paragraph</p>
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockDoesNotInterruptParagraphWithoutBlankLine() async {
		let input = """
		Paragraph
		    code here
		"""
		let expected = """
		<p>Paragraph
		code here</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockWithTrailingSpaces() async {
		let input = "    code here  "
		let expected = """
		<pre><code>code here  
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func mixed4SpaceAnd8SpaceIndentation() async {
		let input = """
		    line 1
		        line 2
		"""
		let expected = """
		<pre><code>line 1
		    line 2
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithBackticks() async {
		let input = "    `code`"
		let expected = """
		<pre><code>`code`
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithTildes() async {
		let input = "    ~code~"
		let expected = """
		<pre><code>~code~
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithAsterisks() async {
		let input = "    **bold**"
		let expected = """
		<pre><code>**bold**
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeInBlockquote() async {
		let input = ">     code here"
		let expected = """
		<blockquote>
		<pre><code>code here
		</code></pre>
		</blockquote>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeInListItem() async {
		let input = "-     code here"
		let expected = """
		<ul>
		<li>
		<pre><code>code here
		</code></pre>
		</li>
		</ul>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeInOrderedList() async {
		let input = "1.     code here"
		let expected = """
		<ol>
		<li>
		<pre><code>code here
		</code></pre>
		</li>
		</ol>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeFollowedByParagraph() async {
		let input = """
		    code here

		Paragraph
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<p>Paragraph</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func paragraphFollowedByIndentedCode() async {
		let input = """
		Paragraph

		    code here
		"""
		let expected = """
		<p>Paragraph</p>
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleIndentedCodeBlocks() async {
		let input = """
		    code 1

		    code 2
		"""
		let expected = """
		<pre><code>code 1

		code 2
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithSpecialCharacters() async {
		let input = "    <>& \"'\\"
		let expected = """
		<pre><code>&lt;&gt;&amp; &quot;'\\
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithMixedIndentation() async {
		let input = """
		    line 1
		      line 2
		  line 3
		"""
		let expected = """
		<pre><code>line 1
		  line 2
		</code></pre>
		<p>line 3</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockAfterHeading() async {
		let input = """
		# Heading

		    code here
		"""
		let expected = """
		<h1>Heading</h1>
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockBeforeHeading() async {
		let input = """
		    code here

		# Heading
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<h1>Heading</h1>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockAfterThematicBreak() async {
		let input = """
		---

		    code here
		"""
		let expected = """
		<hr />
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockBeforeThematicBreak() async {
		let input = """
		    code here

		---
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<hr />
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithFencedCodeBlockAbove() async {
		let input = """
		```
		 fenced code
		```
		    indented code
		"""
		let expected = """
		<pre><code> fenced code
		</code></pre>
		<pre><code>indented code
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithFencedCodeBlockBelow() async {
		let input = """
		    indented code
		```
		 fenced code
		```
		"""
		let expected = """
		<pre><code>indented code
		</code></pre>
		<pre><code> fenced code
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithAtxHeadingAbove() async {
		let input = """
		# Heading

		    code here
		"""
		let expected = """
		<h1>Heading</h1>
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithAtxHeadingBelow() async {
		let input = """
		    code here

		# Heading
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<h1>Heading</h1>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithSetextHeadingAbove() async {
		let input = """
		Heading
		=======

		    code here
		"""
		let expected = """
		<h1>Heading</h1>
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithSetextHeadingBelow() async {
		let input = """
		    code here

		Heading
		=======
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<h1>Heading</h1>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodePrecededByParagraphWithoutBlankLine() async {
		let input = """
		Paragraph
		    code here
		"""
		let expected = """
		<p>Paragraph
		code here</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func paragraphPrecededByIndentedCodeWithoutBlankLine() async {
		let input = """
		    code here
		Paragraph
		"""
		let expected = """
		<pre><code>code here
		</code></pre>
		<p>Paragraph</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithHTMLEntities() async {
		let input = "    &lt;code&gt;"
		let expected = """
		<pre><code>&amp;lt;code&amp;gt;
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockInNestedList() async {
		let input = """
		-     code 1
		-     code 2
		"""
		let expected = """
		<ul>
		<li>
		<pre><code>code 1
		</code></pre>
		</li>
		<li>
		<pre><code>code 2
		</code></pre>
		</li>
		</ul>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockAtEndOfDocument() async {
		let input = "    code here"
		let expected = """
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeBlockWithVaryingIndentation() async {
		let input = """
		    level 1
		      level 2
		  level 3
		"""
		let expected = """
		<pre><code>level 1
		  level 2
		</code></pre>
		<p>level 3</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func singleTabIndented() async {
		let input = "\tcode here"
		let expected = """
		<pre><code>code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func mixedTabAndSpaceIndentation() async {
		let input = "\t    code here"
		let expected = """
		<pre><code>    code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func threeSpacesShouldBeParagraph() async {
		let input = "   code here"
		let expected = """
		<p>code here</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func sixSpacesIndentedCode() async {
		let input = "      code here"
		let expected = """
		<pre><code>  code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func twelveSpacesIndentedCode() async {
		let input = "            code here"
		let expected = """
		<pre><code>        code here
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func codeBlockWithUnicodeCharacters() async {
		let input = "    hello 世界"
		let expected = """
		<pre><code>hello 世界
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithInlineLink() async {
		let input = "    [link](https://example.com)"
		let expected = """
		<pre><code>[link](https://example.com)
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithInlineImage() async {
		let input = "    ![alt](image.png)"
		let expected = """
		<pre><code>![alt](image.png)
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithEmphasis() async {
		let input = "    *italic*"
		let expected = """
		<pre><code>*italic*
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithStrong() async {
		let input = "    **bold**"
		let expected = """
		<pre><code>**bold**
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func indentedCodeWithInlineCode() async {
		let input = "    `inline code`"
		let expected = """
		<pre><code>`inline code`
		</code></pre>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyIndentedCodeBlock() async {
		let input = "    \n    "
		let expected = ""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected)
		}
	}

	@Test func indentedCodeBlockWithOnlyWhitespace() async {
		let input = "    \n    \n    "
		let expected = ""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected)
		}
	}
}

@testable import Allmark
import Testing

struct CoreHtmlBlockTests {
	@Test func hTMLScriptTagSingleLine() async {
		let input = """

		<script>alert('hi');</script>

		"""

		let expected = """
		<script>alert('hi');</script>

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

	@Test func hTMLScriptTagMultiLine() async {
		let input = """

		<script>
		alert('hi');
		alert('bye');
		</script>

		"""

		let expected = """
		<script>
		alert('hi');
		alert('bye');
		</script>

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

	@Test func hTMLPreTag() async {
		let input = """

		<pre>code here</pre>

		"""

		let expected = """
		<pre>code here</pre>

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

	@Test func hTMLStyleTag() async {
		let input = """

		<style>body { color: red; }</style>

		"""

		let expected = """
		<style>body { color: red; }</style>

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

	// TODO:
	/* @Test */ func hTMLTextareaTag() async {
		let input = """

		<textarea>Type here</textarea>

		"""

		let expected = """
		<p><textarea>Type here</textarea></p>

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

	@Test func hTMLCommentSingleLine() async {
		let input = """

		<!-- This is a comment -->

		"""

		let expected = """
		<!-- This is a comment -->

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

	@Test func hTMLCommentMultiLine() async {
		let input = """

		<!--
		This is a
		multi-line comment
		-->

		"""

		let expected = """
		<!--
		This is a
		multi-line comment
		-->

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

	@Test func hTMLProcessingInstruction() async {
		let input = """

		<?php echo 'hello'; ?>

		"""

		let expected = """
		<?php echo 'hello'; ?>

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

	@Test func hTMLDeclarationDOCTYPE() async {
		let input = """

		<!DOCTYPE html>

		"""

		let expected = """
		<!DOCTYPE html>

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

	@Test func hTMLCDATASection() async {
		let input = """

		<![CDATA[<greeting>Hello</greeting>]]>

		"""

		let expected = """
		<![CDATA[<greeting>Hello</greeting>]]>

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

	@Test func hTMLBlockLevelDivTag() async {
		let input = """

		<div>Content</div>

		"""

		let expected = """
		<div>Content</div>

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

	@Test func hTMLDivWithBlankLineAfter() async {
		let input = """

		<div>Content</div>

		Next paragraph

		"""

		let expected = """
		<div>Content</div>
		<p>Next paragraph</p>

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

	@Test func hTMLParagraphTag() async {
		let input = """

		<p>HTML paragraph</p>

		"""

		let expected = """
		<p>HTML paragraph</p>

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

	@Test func hTMLHeadingTags() async {
		let input = """

		<h1>Heading</h1>

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

	@Test func hTMLListTags() async {
		let input = """

		<ul>
		<li>Item</li>
		</ul>

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

	@Test func hTMLTableTag() async {
		let input = """

		<table><tr><td>Cell</td></tr></table>

		"""

		let expected = """
		<table><tr><td>Cell</td></tr></table>

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

	@Test func hTMLBlockWithIndentationLessThan4Spaces() async {
		let input = """

		   <div>Indented</div>

		"""

		let expected = """
		   <div>Indented</div>

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

	@Test func hTMLBlockWith4SpaceIndentShouldBeCode() async {
		let input = """

		    <div>Code</div>

		"""

		let expected = """
		<pre><code>&lt;div&gt;Code&lt;/div&gt;
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

	@Test func hTMLClosingTagAlone() async {
		let input = """

		</div>

		"""

		let expected = """
		</div>

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

	@Test func hTMLSelfClosingTag() async {
		let input = """

		<br />

		"""

		let expected = """
		<br />

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

	@Test func hTMLImgTag() async {
		let input = """

		<img src="image.jpg" alt="Image">

		"""

		let expected = """
		<img src="image.jpg" alt="Image">

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

	@Test func hTMLHrTag() async {
		let input = """

		<hr />

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
		}
	}

	@Test func hTMLBlockFollowedByMarkdown() async {
		let input = """

		<div>HTML</div>

		# Markdown Heading

		"""

		let expected = """
		<div>HTML</div>
		<h1>Markdown Heading</h1>

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

	@Test func paragraphBeforeHTMLBlockType7ShouldNotInterrupt() async {
		let input = """

		Paragraph text
		<span>inline</span>

		"""

		let expected = """
		<p>Paragraph text
		<span>inline</span></p>

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

	@Test func hTMLCommentInParagraph() async {
		let input = """

		Text <!-- comment --> more text

		"""

		let expected = """
		<p>Text <!-- comment --> more text</p>

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

	@Test func multipleHTMLBlocks() async {
		let input = """

		<div>First</div>

		<div>Second</div>

		"""

		let expected = """
		<div>First</div>
		<div>Second</div>

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

	@Test func hTMLBlockWithAttributes() async {
		let input = """

		<div class="container" id="main">Content</div>

		"""

		let expected = """
		<div class="container" id="main">Content</div>

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

	@Test func hTMLScriptTagWithAttributes() async {
		let input = """

		<script src="script.js" async></script>

		"""

		let expected = """
		<script src="script.js" async></script>

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

	@Test func hTMLFormTag() async {
		let input = """

		<form action="/submit"> <input type="text"> </form>

		"""

		let expected = """
		<form action="/submit"> <input type="text"> </form>

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

	@Test func hTMLBlockquoteTag() async {
		let input = """

		<blockquote>Quote</blockquote>

		"""

		let expected = """
		<blockquote>Quote</blockquote>

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

	@Test func hTMLAddressTag() async {
		let input = """

		<address>123 Main St</address>

		"""

		let expected = """
		<address>123 Main St</address>

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

	@Test func hTMLArticleTag() async {
		let input = """

		<article>Content</article>

		"""

		let expected = """
		<article>Content</article>

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

	@Test func hTMLAsideTag() async {
		let input = """

		<aside>Sidebar</aside>

		"""

		let expected = """
		<aside>Sidebar</aside>

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

	@Test func hTMLSectionTag() async {
		let input = """

		<section>Section</section>

		"""

		let expected = """
		<section>Section</section>

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

	@Test func hTMLNavTag() async {
		let input = """

		<nav>Menu</nav>

		"""

		let expected = """
		<nav>Menu</nav>

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

	@Test func hTMLFooterTag() async {
		let input = """

		<footer>Copyright</footer>

		"""

		let expected = """
		<footer>Copyright</footer>

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

	@Test func hTMLHeaderTag() async {
		let input = """

		<header>Header</header>

		"""

		let expected = """
		<header>Header</header>

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

	@Test func hTMLMainTag() async {
		let input = """

		<main>Main</main>

		"""

		let expected = """
		<main>Main</main>

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

	@Test func hTMLFigureTag() async {
		let input = """

		<figure><img src="img.jpg"></figure>

		"""

		let expected = """
		<figure><img src="img.jpg"></figure>

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

	@Test func hTMLFigcaptionTag() async {
		let input = """

		<figcaption>Caption</figcaption>

		"""

		let expected = """
		<figcaption>Caption</figcaption>

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

	@Test func hTMLDetailsAndSummaryTags() async {
		let input = """

		<details><summary>Click</summary>Content</details>

		"""

		let expected = """
		<details><summary>Click</summary>Content</details>

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

	@Test func hTMLDialogTag() async {
		let input = """

		<dialog>Dialog content</dialog>

		"""

		let expected = """
		<dialog>Dialog content</dialog>

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

	@Test func hTMLFieldsetTag() async {
		let input = """

		<fieldset>Field</fieldset>

		"""

		let expected = """
		<fieldset>Field</fieldset>

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

	@Test func hTMLLegendTag() async {
		let input = """

		<legend>Legend</legend>

		"""

		let expected = """
		<legend>Legend</legend>

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

	@Test func hTMLDlDtDdTags() async {
		let input = """

		<dl><dt>Term</dt><dd>Definition</dd></dl>

		"""

		let expected = """
		<dl><dt>Term</dt><dd>Definition</dd></dl>

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

	@Test func hTMLLinkTagEmpty() async {
		let input = """

		<link rel="stylesheet" href="style.css">

		"""

		let expected = """
		<link rel="stylesheet" href="style.css">

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

	@Test func hTMLBaseTag() async {
		let input = """

		<base href="https://example.com/">

		"""

		let expected = """
		<base href="https://example.com/">

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

	@Test func hTMLBasefontTag() async {
		let input = """

		<basefont face="Arial">

		"""

		let expected = """
		<basefont face="Arial">

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

	@Test func hTMLCenterTag() async {
		let input = """

		<center>Centered</center>

		"""

		let expected = """
		<center>Centered</center>

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

	@Test func hTMLColAndColgroupTags() async {
		let input = """

		<colgroup><col span="2"></colgroup>

		"""

		let expected = """
		<colgroup><col span="2"></colgroup>

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

	@Test func hTMLTbodyTheadTfootTrThTdTags() async {
		let input = """

		<table><thead><tr><th>Header</th></tr></thead><tbody><tr><td>Data</td></tr></tbody></table>

		"""

		let expected = """
		<table><thead><tr><th>Header</th></tr></thead><tbody><tr><td>Data</td></tr></tbody></table>

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

	@Test func hTMLCaptionTag() async {
		let input = """

		<caption>Table caption</caption>

		"""

		let expected = """
		<caption>Table caption</caption>

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

	@Test func hTMLSourceTag() async {
		let input = """

		<source src="video.mp4" type="video/mp4">

		"""

		let expected = """
		<source src="video.mp4" type="video/mp4">

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

	@Test func hTMLTrackTag() async {
		let input = """

		<track src="captions.vtt" kind="captions">

		"""

		let expected = """
		<track src="captions.vtt" kind="captions">

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

	@Test func hTMLFramesetFrameNoframesTags() async {
		let input = """

		<frameset><frame src="frame.html"></frameset>

		"""

		let expected = """
		<frameset><frame src="frame.html"></frameset>

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

	@Test func hTMLNoframesTag() async {
		let input = """

		<noframes>No frames</noframes>

		"""

		let expected = """
		<noframes>No frames</noframes>

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

	@Test func hTMLIframeTag() async {
		let input = """

		<iframe src="page.html"></iframe>

		"""

		let expected = """
		<iframe src="page.html"></iframe>

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

	@Test func hTMLParamTag() async {
		let input = """

		<param name="autoplay" value="true">

		"""

		let expected = """
		<param name="autoplay" value="true">

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

	@Test func hTMLDirTag() async {
		let input = """

		<dir><li>Item</li></dir>

		"""

		let expected = """
		<dir><li>Item</li></dir>

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

	@Test func hTMLMenuAndMenuitemTags() async {
		let input = """

		<menu><menuitem>Item</menuitem></menu>

		"""

		let expected = """
		<menu><menuitem>Item</menuitem></menu>

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

	@Test func hTMLOptgroupAndOptionTags() async {
		let input = """

		<select><optgroup label="Group"><option>Item</option></optgroup></select>

		"""

		let expected = """
		<p><select><optgroup label="Group"><option>Item</option></optgroup></select></p>

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

	@Test func hTMLTitleTagInBodyNotHead() async {
		let input = """

		<title>Page Title</title>

		"""

		let expected = """
		<title>Page Title</title>

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

	@Test func hTMLBlockWithLineBreaksInside() async {
		let input = """

		<div>
		Line 1
		Line 2
		Line 3
		</div>

		"""

		let expected = """
		<div>
		Line 1
		Line 2
		Line 3
		</div>

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

	@Test func hTMLBlockInsideList() async {
		let input = """

		- Item

		  <div>HTML</div>

		"""

		let expected = """
		<ul>
		<li>
		<p>Item</p>
		<div>HTML</div>
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

	@Test func hTMLBlockInsideBlockquote() async {
		let input = """

		> <div>HTML</div>

		"""

		let expected = """
		<blockquote>
		<div>HTML</div>
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

	@Test func hTMLCaseInsensitiveUppercase() async {
		let input = """

		<DIV>Content</DIV>

		"""

		let expected = """
		<DIV>Content</DIV>

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

	@Test func hTMLScriptTagWithMixedCase() async {
		let input = """

		<SCRIPT>alert('hi');</SCRIPT>

		"""

		let expected = """
		<SCRIPT>alert('hi');</SCRIPT>

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

	@Test func hTMLBlockWithNoContent() async {
		let input = """

		<div></div>

		"""

		let expected = """
		<div></div>

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

	@Test func hTMLCustomTagNonBlockLevel() async {
		let input = """

		<custom-tag>Content</custom-tag>

		"""

		let expected = """
		<p><custom-tag>Content</custom-tag></p>

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

	@Test func hTMLCommentEndingOnSameLine() async {
		let input = """

		<!-- comment -->

		"""

		let expected = """
		<!-- comment -->

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

	@Test func hTMLCommentWithMultipleDashes() async {
		let input = """

		<!-- --- comment --- -->

		"""

		let expected = """
		<!-- --- comment --- -->

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

	@Test func hTMLCDATAWithEmbeddedBrackets() async {
		let input = """

		<![CDATA[<test>data</test>]]>

		"""

		let expected = """
		<![CDATA[<test>data</test>]]>

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

	@Test func hTMLDOCTYPEWithPublicIdentifier() async {
		let input = """

		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

		"""

		let expected = """
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

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

	@Test func hTMLBlockContinuesUntilBlankLineType6() async {
		let input = """

		<div>Line 1
		Line 2
		Line 3

		Next

		"""

		let expected = """
		<div>Line 1
		Line 2
		Line 3
		<p>Next</p>

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

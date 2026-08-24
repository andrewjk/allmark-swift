@testable import Allmark
import Testing

struct SpecGfmTests {
	@Test func example1Line368Foobazbim() async {
		let input = """

			foo	baz		bim

		"""

		let expected = """
		<pre><code>foo	baz		bim
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example2Line375Foobazbim() async {
		let input = """

		  	foo	baz		bim

		"""

		let expected = """
		<pre><code>foo	baz		bim
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example3Line382AanA() async {
		let input = """

		    a	a
		    ὐ	a

		"""

		let expected = """
		<pre><code>a	a
		ὐ	a
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example4Line395Foonnbar() async {
		let input = """

		  - foo

			bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<p>bar</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example5Line408Foonnbar() async {
		let input = """

		- foo

				bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<pre><code>  bar
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example6Line431Foo() async {
		let input = """

		>		foo

		"""

		let expected = """
		<blockquote>
		<pre><code>  foo
		</code></pre>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example7Line440Foo() async {
		let input = """

		-		foo

		"""

		let expected = """
		<ul>
		<li>
		<pre><code>  foo
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example8Line452Foonbar() async {
		let input = """

		    foo
			bar

		"""

		let expected = """
		<pre><code>foo
		bar
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example9Line461FoonBarnBaz() async {
		let input = """

		 - foo
		   - bar
			 - baz

		"""

		let expected = """
		<ul>
		<li>foo
		<ul>
		<li>bar
		<ul>
		<li>baz</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example10Line479Foo() async {
		let input = """

		#	Foo

		"""

		let expected = """
		<h1>Foo</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example11Line485() async {
		let input = """

		*	*	*	

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example12Line512OnenTwo() async {
		let input = """

		- `one
		- two`

		"""

		let expected = """
		<ul>
		<li>`one</li>
		<li>two`</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example13Line551NN() async {
		let input = """

		***
		---
		___

		"""

		let expected = """
		<hr />
		<hr />
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example14Line564() async {
		let input = """

		+++

		"""

		let expected = """
		<p>+++</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example15Line571() async {
		let input = """

		===

		"""

		let expected = """
		<p>===</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example16Line580Nn() async {
		let input = """

		--
		**
		__

		"""

		let expected = """
		<p>--
		**
		__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example17Line593NN() async {
		let input = """

		 ***
		  ***
		   ***

		"""

		let expected = """
		<hr />
		<hr />
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example18Line606() async {
		let input = """

		    ***

		"""

		let expected = """
		<pre><code>***
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example19Line614Foon() async {
		let input = """

		Foo
		    ***

		"""

		let expected = """
		<p>Foo
		***</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example20Line625() async {
		let input = """

		_____________________________________

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example21Line634() async {
		let input = """

		 - - -

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example22Line641() async {
		let input = """

		 **  * ** * ** * **

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example23Line648() async {
		let input = """

		-     -      -      -

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example24Line657() async {
		let input = """

		- - - -    

		"""

		let expected = """
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example25Line666AnnaNnA() async {
		let input = """

		_ _ _ _ a

		a------

		---a---

		"""

		let expected = """
		<p>_ _ _ _ a</p>
		<p>a------</p>
		<p>---a---</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example26Line682() async {
		let input = """

		 *-*

		"""

		let expected = """
		<p><em>-</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example27Line691FoonnBar() async {
		let input = """

		- foo
		***
		- bar

		"""

		let expected = """
		<ul>
		<li>foo</li>
		</ul>
		<hr />
		<ul>
		<li>bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example28Line708Foonnbar() async {
		let input = """

		Foo
		***
		bar

		"""

		let expected = """
		<p>Foo</p>
		<hr />
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example29Line725FoonNbar() async {
		let input = """

		Foo
		---
		bar

		"""

		let expected = """
		<h2>Foo</h2>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example30Line738FoonNBar() async {
		let input = """

		* Foo
		* * *
		* Bar

		"""

		let expected = """
		<ul>
		<li>Foo</li>
		</ul>
		<hr />
		<ul>
		<li>Bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example31Line755Foon() async {
		let input = """

		- Foo
		- * * *

		"""

		let expected = """
		<ul>
		<li>Foo</li>
		<li>
		<hr />
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example32Line784FoonFoonFoonFoonFoonFoo() async {
		let input = """

		# foo
		## foo
		### foo
		#### foo
		##### foo
		###### foo

		"""

		let expected = """
		<h1>foo</h1>
		<h2>foo</h2>
		<h3>foo</h3>
		<h4>foo</h4>
		<h5>foo</h5>
		<h6>foo</h6>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example33Line803Foo() async {
		let input = """

		####### foo

		"""

		let expected = """
		<p>####### foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example34Line8185Boltnnhashtag() async {
		let input = """

		#5 bolt

		#hashtag

		"""

		let expected = """
		<p>#5 bolt</p>
		<p>#hashtag</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example35Line830Foo() async {
		let input = """

		\\## foo

		"""

		let expected = """
		<p>## foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example36Line839FooBarBaz() async {
		let input = """

		# foo *bar* \\*baz\\*

		"""

		let expected = """
		<h1>foo <em>bar</em> *baz*</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example37Line848Foo() async {
		let input = """

		#                  foo                     

		"""

		let expected = """
		<h1>foo</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example38Line857FoonFoonFoo() async {
		let input = """

		 ### foo
		  ## foo
		   # foo

		"""

		let expected = """
		<h3>foo</h3>
		<h2>foo</h2>
		<h1>foo</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example39Line870Foo() async {
		let input = """

		    # foo

		"""

		let expected = """
		<pre><code># foo
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example40Line878FoonBar() async {
		let input = """

		foo
		    # bar

		"""

		let expected = """
		<p>foo
		# bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example41Line889FooNBar() async {
		let input = """

		## foo ##
		  ###   bar    ###

		"""

		let expected = """
		<h2>foo</h2>
		<h3>bar</h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example42Line900FooNFoo() async {
		let input = """

		# foo ##################################
		##### foo ##

		"""

		let expected = """
		<h1>foo</h1>
		<h5>foo</h5>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example43Line911Foo() async {
		let input = """

		### foo ###     

		"""

		let expected = """
		<h3>foo</h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example44Line922FooB() async {
		let input = """

		### foo ### b

		"""

		let expected = """
		<h3>foo ### b</h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example45Line931Foo() async {
		let input = """

		# foo#

		"""

		let expected = """
		<h1>foo#</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example46Line941FooNFooNFoo() async {
		let input = """

		### foo \\###
		## foo #\\##
		# foo \\#

		"""

		let expected = """
		<h3>foo ###</h3>
		<h2>foo ###</h2>
		<h1>foo #</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example47Line955NFoon() async {
		let input = """

		****
		## foo
		****

		"""

		let expected = """
		<hr />
		<h2>foo</h2>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example48Line966FooBarnBaznBarFoo() async {
		let input = """

		Foo bar
		# baz
		Bar foo

		"""

		let expected = """
		<p>Foo bar</p>
		<h1>baz</h1>
		<p>Bar foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example49Line979Nn() async {
		let input = """

		## 
		#
		### ###

		"""

		let expected = """
		<h2></h2>
		<h1></h1>
		<h3></h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example50Line1019FooBarnnnFooBarn() async {
		let input = """

		Foo *bar*
		=========

		Foo *bar*
		---------

		"""

		let expected = """
		<h1>Foo <em>bar</em></h1>
		<h2>Foo <em>bar</em></h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example51Line1033FooBarnbazn() async {
		let input = """

		Foo *bar
		baz*
		====

		"""

		let expected = """
		<h1>Foo <em>bar
		baz</em></h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example52Line1047FooBarnbazn() async {
		let input = """

		  Foo *bar
		baz*	
		====

		"""

		let expected = """
		<h1>Foo <em>bar
		baz</em></h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example53Line1059FoonNnFoon() async {
		let input = """

		Foo
		-------------------------

		Foo
		==

		"""

		let expected = """
		<h2>Foo</h2>
		<h1>Foo</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example54Line1074FoonNnFoonNnFoon() async {
		let input = """

		   Foo
		---

		  Foo
		-----

		  Foo
		  ===

		"""

		let expected = """
		<h2>Foo</h2>
		<h2>Foo</h2>
		<h1>Foo</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example55Line1092FoonNnFoon() async {
		let input = """

		    Foo
		    ---

		    Foo
		---

		"""

		let expected = """
		<pre><code>Foo
		---

		Foo
		</code></pre>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example56Line1111Foon() async {
		let input = """

		Foo
		   ----      

		"""

		let expected = """
		<h2>Foo</h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example57Line1121Foon() async {
		let input = """

		Foo
		    ---

		"""

		let expected = """
		<p>Foo
		---</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example58Line1132FoonNnFoon() async {
		let input = """

		Foo
		= =

		Foo
		--- -

		"""

		let expected = """
		<p>Foo
		= =</p>
		<p>Foo</p>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example59Line1148FooN() async {
		let input = """

		Foo  
		-----

		"""

		let expected = """
		<h2>Foo</h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example60Line1158Foon() async {
		let input = """

		Foo\\
		----

		"""

		let expected = """
		<h2>Foo\\</h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example61Line1169FoonNnnaTitleaLotnNofDashes() async {
		let input = """

		`Foo
		----
		`

		<a title="a lot
		---
		of dashes"/>

		"""

		let expected = """
		<h2>`Foo</h2>
		<p>`</p>
		<h2>&lt;a title=&quot;a lot</h2>
		<p>of dashes&quot;/&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example62Line1188Foon() async {
		let input = """

		> Foo
		---

		"""

		let expected = """
		<blockquote>
		<p>Foo</p>
		</blockquote>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example63Line1199Foonbarn() async {
		let input = """

		> foo
		bar
		===

		"""

		let expected = """
		<blockquote>
		<p>foo
		bar
		===</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example64Line1212Foon() async {
		let input = """

		- Foo
		---

		"""

		let expected = """
		<ul>
		<li>Foo</li>
		</ul>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example65Line1227FoonBarn() async {
		let input = """

		Foo
		Bar
		---

		"""

		let expected = """
		<h2>Foo
		Bar</h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example66Line1240FoonNBarnNBaz() async {
		let input = """

		Foo
		---
		Bar
		---
		Baz

		"""

		let expected = """
		<h2>Foo</h2>
		<h2>Bar</h2>
		<p>Baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example67Line1257N() async {
		let input = """


		====

		"""

		let expected = """
		<p>====</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	// TODO:
	/* @Test */ func example68Line1269N() async {
		let input = """

		---
		---

		"""

		let expected = """
		<hr />
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example69Line1278Foon() async {
		let input = """

		- foo
		-----

		"""

		let expected = """
		<ul>
		<li>foo</li>
		</ul>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example70Line1289Foon() async {
		let input = """

		    foo
		---

		"""

		let expected = """
		<pre><code>foo
		</code></pre>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example71Line1299Foon() async {
		let input = """

		> foo
		-----

		"""

		let expected = """
		<blockquote>
		<p>foo</p>
		</blockquote>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example72Line1313Foon() async {
		let input = """

		\\> foo
		------

		"""

		let expected = """
		<h2>&gt; foo</h2>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example73Line1344FoonnbarnNbaz() async {
		let input = """

		Foo

		bar
		---
		baz

		"""

		let expected = """
		<p>Foo</p>
		<h2>bar</h2>
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example74Line1360FoonbarnnNnbaz() async {
		let input = """

		Foo
		bar

		---

		baz

		"""

		let expected = """
		<p>Foo
		bar</p>
		<hr />
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example75Line1378FoonbarnNbaz() async {
		let input = """

		Foo
		bar
		* * *
		baz

		"""

		let expected = """
		<p>Foo
		bar</p>
		<hr />
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example76Line1393FoonbarnNbaz() async {
		let input = """

		Foo
		bar
		\\---
		baz

		"""

		let expected = """
		<p>Foo
		bar
		---
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example77Line1421ASimplenIndentedCodeBlock() async {
		let input = """

		    a simple
		      indented code block

		"""

		let expected = """
		<pre><code>a simple
		  indented code block
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example78Line1435FoonnBar() async {
		let input = """

		  - foo

		    bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<p>bar</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example79Line14491FoonnBar() async {
		let input = """

		1.  foo

		    - bar

		"""

		let expected = """
		<ol>
		<li>
		<p>foo</p>
		<ul>
		<li>bar</li>
		</ul>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example80Line1469AnHinnOne() async {
		let input = """

		    <a/>
		    *hi*

		    - one

		"""

		let expected = """
		<pre><code>&lt;a/&gt;
		*hi*

		- one
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example81Line1485Chunk1nnChunk2nNNNChunk3() async {
		let input = """

		    chunk1

		    chunk2
		  
		 
		 
		    chunk3

		"""

		let expected = """
		<pre><code>chunk1

		chunk2



		chunk3
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example82Line1508Chunk1nNChunk2() async {
		let input = """

		    chunk1
		      
		      chunk2

		"""

		let expected = """
		<pre><code>chunk1
		  
		  chunk2
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example83Line1523FoonBarn() async {
		let input = """

		Foo
		    bar


		"""

		let expected = """
		<p>Foo
		bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example84Line1537Foonbar() async {
		let input = """

		    foo
		bar

		"""

		let expected = """
		<pre><code>foo
		</code></pre>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example85Line1550HeadingnFoonHeadingnNFoon() async {
		let input = """

		# Heading
		    foo
		Heading
		------
		    foo
		----

		"""

		let expected = """
		<h1>Heading</h1>
		<pre><code>foo
		</code></pre>
		<h2>Heading</h2>
		<pre><code>foo
		</code></pre>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example86Line1570FoonBar() async {
		let input = """

		        foo
		    bar

		"""

		let expected = """
		<pre><code>    foo
		bar
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example87Line1583NNFoonN() async {
		let input = """


		    
		    foo
		    


		"""

		let expected = """
		<pre><code>foo
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example88Line1597Foo() async {
		let input = """

		    foo  

		"""

		let expected = """
		<pre><code>foo  
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example89Line1652NnN() async {
		let input = """

		```
		<
		 >
		```

		"""

		let expected = """
		<pre><code>&lt;
		 &gt;
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example90Line1666NnN() async {
		let input = """

		~~~
		<
		 >
		~~~

		"""

		let expected = """
		<pre><code>&lt;
		 &gt;
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example91Line1679Nfoon() async {
		let input = """

		``
		foo
		``

		"""

		let expected = """
		<p><code>foo</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example92Line1690Naaann() async {
		let input = """

		```
		aaa
		~~~
		```

		"""

		let expected = """
		<pre><code>aaa
		~~~
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example93Line1702Naaann() async {
		let input = """

		~~~
		aaa
		```
		~~~

		"""

		let expected = """
		<pre><code>aaa
		```
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example94Line1716Naaann() async {
		let input = """

		````
		aaa
		```
		``````

		"""

		let expected = """
		<pre><code>aaa
		```
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example95Line1728Naaann() async {
		let input = """

		~~~~
		aaa
		~~~
		~~~~

		"""

		let expected = """
		<pre><code>aaa
		~~~
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example96Line1743() async {
		let input = """

		```

		"""

		let expected = """
		<pre><code></code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example97Line1750Nnnaaa() async {
		let input = """

		`````

		```
		aaa

		"""

		let expected = """
		<pre><code>
		```
		aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example98Line1763NAaannbbb() async {
		let input = """

		> ```
		> aaa

		bbb

		"""

		let expected = """
		<blockquote>
		<pre><code>aaa
		</code></pre>
		</blockquote>
		<p>bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example99Line1779NnN() async {
		let input = """

		```

		  
		```

		"""

		let expected = """
		<pre><code>
		  
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example100Line1793N() async {
		let input = """

		```
		```

		"""

		let expected = """
		<pre><code></code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example101Line1805NAaanaaan() async {
		let input = """

		 ```
		 aaa
		aaa
		```

		"""

		let expected = """
		<pre><code>aaa
		aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example102Line1817NaaanAaanaaan() async {
		let input = """

		  ```
		aaa
		  aaa
		aaa
		  ```

		"""

		let expected = """
		<pre><code>aaa
		aaa
		aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example103Line1831NAaanAaanAaan() async {
		let input = """

		   ```
		   aaa
		    aaa
		  aaa
		   ```

		"""

		let expected = """
		<pre><code>aaa
		 aaa
		aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example104Line1847NAaan() async {
		let input = """

		    ```
		    aaa
		    ```

		"""

		let expected = """
		<pre><code>```
		aaa
		```
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example105Line1862Naaan() async {
		let input = """

		```
		aaa
		  ```

		"""

		let expected = """
		<pre><code>aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example106Line1872Naaan() async {
		let input = """

		   ```
		aaa
		  ```

		"""

		let expected = """
		<pre><code>aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example107Line1884Naaan() async {
		let input = """

		```
		aaa
		    ```

		"""

		let expected = """
		<pre><code>aaa
		    ```
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example108Line1898Naaa() async {
		let input = """

		``` ```
		aaa

		"""

		let expected = """
		<p><code> </code>
		aaa</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example109Line1907Naaan() async {
		let input = """

		~~~~~~
		aaa
		~~~ ~~

		"""

		let expected = """
		<pre><code>aaa
		~~~ ~~
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example110Line1921Foonnbarnnbaz() async {
		let input = """

		foo
		```
		bar
		```
		baz

		"""

		let expected = """
		<p>foo</p>
		<pre><code>bar
		</code></pre>
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example111Line1938FoonNnbarnnBaz() async {
		let input = """

		foo
		---
		~~~
		bar
		~~~
		# baz

		"""

		let expected = """
		<h2>foo</h2>
		<pre><code>bar
		</code></pre>
		<h1>baz</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example112Line1960RubyndefFooxnReturn3nendn() async {
		let input = """

		```ruby
		def foo(x)
		  return 3
		end
		```

		"""

		let expected = """
		<pre><code class="language-ruby">def foo(x)
		  return 3
		end
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example113Line1974RubyStartline3NdefFooxnReturn3nendn() async {
		let input = """

		~~~~    ruby startline=3 $%@#$
		def foo(x)
		  return 3
		end
		~~~~~~~

		"""

		let expected = """
		<pre><code class="language-ruby">def foo(x)
		  return 3
		end
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example114Line1988N() async {
		let input = """

		````;
		````

		"""

		let expected = """
		<pre><code class="language-;"></code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example115Line1998AaNfoo() async {
		let input = """

		``` aa ```
		foo

		"""

		let expected = """
		<p><code>aa</code>
		foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example116Line2009AaNfoon() async {
		let input = """

		~~~ aa ``` ~~~
		foo
		~~~

		"""

		let expected = """
		<pre><code class="language-aa">foo
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example117Line2021NAaan() async {
		let input = """

		```
		``` aaa
		```

		"""

		let expected = """
		<pre><code>``` aaa
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example118Line2100TabletrtdnprenHellonnworldnprentdtrtable() async {
		let input = """

		<table><tr><td>
		<pre>
		**Hello**,

		_world_.
		</pre>
		</td></tr></table>

		"""

		let expected = """
		<table><tr><td>
		<pre>
		**Hello**,
		<p><em>world</em>.
		</pre></p>
		</td></tr></table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example119Line2129TablenTrnTdnHinTdnTrntablennokay() async {
		let input = """

		<table>
		  <tr>
		    <td>
		           hi
		    </td>
		  </tr>
		</table>

		okay.

		"""

		let expected = """
		<table>
		  <tr>
		    <td>
		           hi
		    </td>
		  </tr>
		</table>
		<p>okay.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example120Line2151DivnHellonFooa() async {
		let input = """

		 <div>
		  *hello*
		         <foo><a>

		"""

		let expected = """
		 <div>
		  *hello*
		         <foo><a>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example121Line2164Divnfoo() async {
		let input = """

		</div>
		*foo*

		"""

		let expected = """
		</div>
		*foo*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example122Line2175DIVCLASSfoonnMarkdownnnDIV() async {
		let input = """

		<DIV CLASS="foo">

		*Markdown*

		</DIV>

		"""

		let expected = """
		<DIV CLASS="foo">
		<p><em>Markdown</em></p>
		</DIV>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example123Line2191DivIdfoonClassbarndiv() async {
		let input = """

		<div id="foo"
		  class="bar">
		</div>

		"""

		let expected = """
		<div id="foo"
		  class="bar">
		</div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example124Line2202DivIdfooClassbarnBazndiv() async {
		let input = """

		<div id="foo" class="bar
		  baz">
		</div>

		"""

		let expected = """
		<div id="foo" class="bar
		  baz">
		</div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example125Line2214Divnfoonnbar() async {
		let input = """

		<div>
		*foo*

		*bar*

		"""

		let expected = """
		<div>
		*foo*
		<p><em>bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example126Line2230DivIdfoonhi() async {
		let input = """

		<div id="foo"
		*hi*

		"""

		let expected = """
		<div id="foo"
		*hi*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example127Line2239DivClassnfoo() async {
		let input = """

		<div class
		foo

		"""

		let expected = """
		<div class
		foo

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example128Line2251DivNfoo() async {
		let input = """

		<div *???-&&&-<---
		*foo*

		"""

		let expected = """
		<div *???-&&&-<---
		*foo*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example129Line2263DivaHrefbarfooadiv() async {
		let input = """

		<div><a href="bar">*foo*</a></div>

		"""

		let expected = """
		<div><a href="bar">*foo*</a></div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example130Line2270Tabletrtdnfoontdtrtable() async {
		let input = """

		<table><tr><td>
		foo
		</td></tr></table>

		"""

		let expected = """
		<table><tr><td>
		foo
		</td></tr></table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example131Line2287DivdivnCnintX33n() async {
		let input = """

		<div></div>
		``` c
		int x = 33;
		```

		"""

		let expected = """
		<div></div>
		``` c
		int x = 33;
		```

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example132Line2304AHreffoonbarna() async {
		let input = """

		<a href="foo">
		*bar*
		</a>

		"""

		let expected = """
		<a href="foo">
		*bar*
		</a>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example133Line2317WarningnbarnWarning() async {
		let input = """

		<Warning>
		*bar*
		</Warning>

		"""

		let expected = """
		<Warning>
		*bar*
		</Warning>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example134Line2328IClassfoonbarni() async {
		let input = """

		<i class="foo">
		*bar*
		</i>

		"""

		let expected = """
		<i class="foo">
		*bar*
		</i>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example135Line2339Insnbar() async {
		let input = """

		</ins>
		*bar*

		"""

		let expected = """
		</ins>
		*bar*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example136Line2354Delnfoondel() async {
		let input = """

		<del>
		*foo*
		</del>

		"""

		let expected = """
		<del>
		*foo*
		</del>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example137Line2369Delnnfoonndel() async {
		let input = """

		<del>

		*foo*

		</del>

		"""

		let expected = """
		<del>
		<p><em>foo</em></p>
		</del>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example138Line2387Delfoodel() async {
		let input = """

		<del>*foo*</del>

		"""

		let expected = """
		<p><del><em>foo</em></del></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example139Line2403PreLanguagehaskellcodenimportTextHTMLTagSoupnnmainIONmainPrintParseTagsTagsncodeprenokay() async {
		let input = """

		<pre language="haskell"><code>
		import Text.HTML.TagSoup

		main :: IO ()
		main = print $ parseTags tags
		</code></pre>
		okay

		"""

		let expected = """
		<pre language="haskell"><code>
		import Text.HTML.TagSoup

		main :: IO ()
		main = print $ parseTags tags
		</code></pre>
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example140Line2424ScriptTypetextjavascriptnJavaScriptExamplenndocumentgetElementByIddemoinnerHTMLHelloJavaScriptnscriptnokay() async {
		let input = """

		<script type="text/javascript">
		// JavaScript example

		document.getElementById("demo").innerHTML = "Hello JavaScript!";
		</script>
		okay

		"""

		let expected = """
		<script type="text/javascript">
		// JavaScript example

		document.getElementById("demo").innerHTML = "Hello JavaScript!";
		</script>
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example141Line2443StylenTypetextcssnh1ColorrednnpColorbluenstylenokay() async {
		let input = """

		<style
		  type="text/css">
		h1 {color:red;}

		p {color:blue;}
		</style>
		okay

		"""

		let expected = """
		<style
		  type="text/css">
		h1 {color:red;}

		p {color:blue;}
		</style>
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example142Line2466StylenTypetextcssnnfoo() async {
		let input = """

		<style
		  type="text/css">

		foo

		"""

		let expected = """
		<style
		  type="text/css">

		foo

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example143Line2479DivnFoonnbar() async {
		let input = """

		> <div>
		> foo

		bar

		"""

		let expected = """
		<blockquote>
		<div>
		foo
		</blockquote>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example144Line2493DivnFoo() async {
		let input = """

		- <div>
		- foo

		"""

		let expected = """
		<ul>
		<li>
		<div>
		</li>
		<li>foo</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example145Line2508Stylepcolorredstylenfoo() async {
		let input = """

		<style>p{color:red;}</style>
		*foo*

		"""

		let expected = """
		<style>p{color:red;}</style>
		<p><em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example146Line2517FooBarnbaz() async {
		let input = """

		<!-- foo -->*bar*
		*baz*

		"""

		let expected = """
		<!-- foo -->*bar*
		<p><em>baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example147Line2529Scriptnfoonscript1Bar() async {
		let input = """

		<script>
		foo
		</script>1. *bar*

		"""

		let expected = """
		<script>
		foo
		</script>1. *bar*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example148Line2542FoonnbarnBazNokay() async {
		let input = """

		<!-- Foo

		bar
		   baz -->
		okay

		"""

		let expected = """
		<!-- Foo

		bar
		   baz -->
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example149Line2560PhpnnEchoNnnokay() async {
		let input = """

		<?php

		  echo '>';

		?>
		okay

		"""

		let expected = """
		<?php

		  echo '>';

		?>
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example150Line2579DOCTYPEHtml() async {
		let input = """

		<!DOCTYPE html>

		"""

		let expected = """
		<!DOCTYPE html>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example151Line2588CDATAnfunctionMatchwoabnnIfABA0ThenNReturn1nnElseNnReturn0nNnnokay() async {
		let input = """

		<![CDATA[
		function matchwo(a,b)
		{
		  if (a < b && a < 0) then {
		    return 1;

		  } else {

		    return 0;
		  }
		}
		]]>
		okay

		"""

		let expected = """
		<![CDATA[
		function matchwo(a,b)
		{
		  if (a < b && a < 0) then {
		    return 1;

		  } else {

		    return 0;
		  }
		}
		]]>
		<p>okay</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example152Line2621FooNnFoo() async {
		let input = """

		  <!-- foo -->

		    <!-- foo -->

		"""

		let expected = """
		  <!-- foo -->
		<pre><code>&lt;!-- foo --&gt;
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example153Line2632DivnnDiv() async {
		let input = """

		  <div>

		    <div>

		"""

		let expected = """
		  <div>
		<pre><code>&lt;div&gt;
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example154Line2646Foondivnbarndiv() async {
		let input = """

		Foo
		<div>
		bar
		</div>

		"""

		let expected = """
		<p>Foo</p>
		<div>
		bar
		</div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example155Line2663Divnbarndivnfoo() async {
		let input = """

		<div>
		bar
		</div>
		*foo*

		"""

		let expected = """
		<div>
		bar
		</div>
		*foo*

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example156Line2678FoonaHrefbarnbaz() async {
		let input = """

		Foo
		<a href="bar">
		baz

		"""

		let expected = """
		<p>Foo
		<a href="bar">
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example157Line2719DivnnEmphasizedTextnndiv() async {
		let input = """

		<div>

		*Emphasized* text.

		</div>

		"""

		let expected = """
		<div>
		<p><em>Emphasized</em> text.</p>
		</div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example158Line2732DivnEmphasizedTextndiv() async {
		let input = """

		<div>
		*Emphasized* text.
		</div>

		"""

		let expected = """
		<div>
		*Emphasized* text.
		</div>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example159Line2754TablenntrnntdnHintdnntrnntable() async {
		let input = """

		<table>

		<tr>

		<td>
		Hi
		</td>

		</tr>

		</table>

		"""

		let expected = """
		<table>
		<tr>
		<td>
		Hi
		</td>
		</tr>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example160Line2781TablennTrnnTdnHinTdnnTrnntable() async {
		let input = """

		<table>

		  <tr>

		    <td>
		      Hi
		    </td>

		  </tr>

		</table>

		"""

		let expected = """
		<table>
		  <tr>
		<pre><code>&lt;td&gt;
		  Hi
		&lt;/td&gt;
		</code></pre>
		  </tr>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example161Line2829FooUrlTitlennfoo() async {
		let input = """

		[foo]: /url "title"

		[foo]

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example162Line2838FooNUrlNTheTitleNnfoo() async {
		let input = """

		   [foo]: 
		      /url  
		           'the title'  

		[foo]

		"""

		let expected = """
		<p><a href="/url" title="the title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example163Line2849FoobarmyurlTitleWithParensnnFoobar() async {
		let input = """

		[Foo*bar\\]]:my_(url) 'title (with parens)'

		[Foo*bar\\]]

		"""

		let expected = """
		<p><a href="my_(url)" title="title (with parens)">Foo*bar]</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example164Line2858FooBarnmyUrlntitlennFooBar() async {
		let input = """

		[Foo bar]:
		<my url>
		'title'

		[Foo bar]

		"""

		let expected = """
		<p><a href="my%20url" title="title">Foo bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example165Line2871FooUrlNtitlenline1nline2nnnfoo() async {
		let input = """

		[foo]: /url '
		title
		line1
		line2
		'

		[foo]

		"""

		let expected = """
		<p><a href="/url" title="
		title
		line1
		line2
		">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example166Line2890FooUrlTitlennwithBlankLinennfoo() async {
		let input = """

		[foo]: /url 'title

		with blank line'

		[foo]

		"""

		let expected = """
		<p>[foo]: /url 'title</p>
		<p>with blank line'</p>
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example167Line2905Foonurlnnfoo() async {
		let input = """

		[foo]:
		/url

		[foo]

		"""

		let expected = """
		<p><a href="/url">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example168Line2917Foonnfoo() async {
		let input = """

		[foo]:

		[foo]

		"""

		let expected = """
		<p>[foo]:</p>
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example169Line2929FooNnfoo() async {
		let input = """

		[foo]: <>

		[foo]

		"""

		let expected = """
		<p><a href="">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example170Line2940FooBarbaznnfoo() async {
		let input = """

		[foo]: <bar>(baz)

		[foo]

		"""

		let expected = """
		<p>[foo]: <bar>(baz)</p>
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example171Line2953FooUrlbarbazFoobarbaznnfoo() async {
		let input = """

		[foo]: /url\\bar\\*baz "foo\\"bar\\baz"

		[foo]

		"""

		let expected = """
		<p><a href="/url%5Cbar*baz" title="foo&quot;bar\\baz">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example172Line2964FoonnfooUrl() async {
		let input = """

		[foo]

		[foo]: url

		"""

		let expected = """
		<p><a href="url">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example173Line2976FoonnfooFirstnfooSecond() async {
		let input = """

		[foo]

		[foo]: first
		[foo]: second

		"""

		let expected = """
		<p><a href="first">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example174Line2989FOOUrlnnFoo() async {
		let input = """

		[FOO]: /url

		[Foo]

		"""

		let expected = """
		<p><a href="/url">Foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example175Line2998Nn() async {
		let input = """

		[ΑΓΩ]: /φου

		[αγω]

		"""

		let expected = """
		<p><a href="/%CF%86%CE%BF%CF%85">αγω</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example176Line3010FooUrl() async {
		let input = """

		[foo]: /url

		"""

		let expected = """

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example177Line3018NfoonUrlnbar() async {
		let input = """

		[
		foo
		]: /url
		bar

		"""

		let expected = """
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example178Line3031FooUrlTitleOk() async {
		let input = """

		[foo]: /url "title" ok

		"""

		let expected = """
		<p>[foo]: /url &quot;title&quot; ok</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example179Line3040FooUrlntitleOk() async {
		let input = """

		[foo]: /url
		"title" ok

		"""

		let expected = """
		<p>&quot;title&quot; ok</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example180Line3051FooUrlTitlennfoo() async {
		let input = """

		    [foo]: /url "title"

		[foo]

		"""

		let expected = """
		<pre><code>[foo]: /url &quot;title&quot;
		</code></pre>
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example181Line3065NfooUrlnnnfoo() async {
		let input = """

		```
		[foo]: /url
		```

		[foo]

		"""

		let expected = """
		<pre><code>[foo]: /url
		</code></pre>
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example182Line3080FoonbarBaznnbar() async {
		let input = """

		Foo
		[bar]: /baz

		[bar]

		"""

		let expected = """
		<p>Foo
		[bar]: /baz</p>
		<p>[bar]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example183Line3095FoonfooUrlnBar() async {
		let input = """

		# [Foo]
		[foo]: /url
		> bar

		"""

		let expected = """
		<h1><a href="/url">Foo</a></h1>
		<blockquote>
		<p>bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example184Line3106FooUrlnbarnnfoo() async {
		let input = """

		[foo]: /url
		bar
		===
		[foo]

		"""

		let expected = """
		<h1>bar</h1>
		<p><a href="/url">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example185Line3116FooUrlnnfoo() async {
		let input = """

		[foo]: /url
		===
		[foo]

		"""

		let expected = """
		<p>===
		<a href="/url">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example186Line3129FooFooUrlFoonbarBarUrlnBarnbazBazUrlnnfoonbarnbaz() async {
		let input = """

		[foo]: /foo-url "foo"
		[bar]: /bar-url
		  "bar"
		[baz]: /baz-url

		[foo],
		[bar],
		[baz]

		"""

		let expected = """
		<p><a href="/foo-url" title="foo">foo</a>,
		<a href="/bar-url" title="bar">bar</a>,
		<a href="/baz-url">baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example187Line3150FoonnFooUrl() async {
		let input = """

		[foo]

		> [foo]: /url

		"""

		let expected = """
		<p><a href="/url">foo</a></p>
		<blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example188Line3167FooUrl() async {
		let input = """

		[foo]: /url

		"""

		let expected = """

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example189Line3184Aaannbbb() async {
		let input = """

		aaa

		bbb

		"""

		let expected = """
		<p>aaa</p>
		<p>bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example190Line3196Aaanbbbnncccnddd() async {
		let input = """

		aaa
		bbb

		ccc
		ddd

		"""

		let expected = """
		<p>aaa
		bbb</p>
		<p>ccc
		ddd</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example191Line3212Aaannnbbb() async {
		let input = """

		aaa


		bbb

		"""

		let expected = """
		<p>aaa</p>
		<p>bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example192Line3225AaanBbb() async {
		let input = """

		  aaa
		 bbb

		"""

		let expected = """
		<p>aaa
		bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example193Line3237AaanBbbnCcc() async {
		let input = """

		aaa
		             bbb
		                                       ccc

		"""

		let expected = """
		<p>aaa
		bbb
		ccc</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example194Line3251Aaanbbb() async {
		let input = """

		   aaa
		bbb

		"""

		let expected = """
		<p>aaa
		bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example195Line3260Aaanbbb() async {
		let input = """

		    aaa
		bbb

		"""

		let expected = """
		<pre><code>aaa
		</code></pre>
		<p>bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example196Line3274AaaNbbb() async {
		let input = """

		aaa     
		bbb     

		"""

		let expected = """
		<p>aaa<br />
		bbb</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example197Line3291NnaaanNnAaann() async {
		let input = """

		  

		aaa
		  

		# aaa

		  

		"""

		let expected = """
		<p>aaa</p>
		<h1>aaa</h1>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example198Line3326FooBarNNBazBim() async {
		let input = """

		| foo | bar |
		| --- | --- |
		| baz | bim |

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>foo</th>
		<th>bar</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>baz</td>
		<td>bim</td>
		</tr>
		</tbody>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example199Line3350AbcDefghiNNbarBaz() async {
		let input = """

		| abc | defghi |
		:-: | -----------:
		bar | baz

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th align="center">abc</th>
		<th align="right">defghi</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td align="center">bar</td>
		<td align="right">baz</td>
		</tr>
		</tbody>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example200Line3374FooNNBAzNBIm() async {
		let input = """

		| f\\|oo  |
		| ------ |
		| b `\\|` az |
		| b **\\|** im |

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>f|oo</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>b <code>|</code> az</td>
		</tr>
		<tr>
		<td>b <strong>|</strong> im</td>
		</tr>
		</tbody>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example201Line3400AbcDefNNBarBazNBar() async {
		let input = """

		| abc | def |
		| --- | --- |
		| bar | baz |
		> bar

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>abc</th>
		<th>def</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>bar</td>
		<td>baz</td>
		</tr>
		</tbody>
		</table>
		<blockquote>
		<p>bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example202Line3425AbcDefNNBarBazNbarnnbar() async {
		let input = """

		| abc | def |
		| --- | --- |
		| bar | baz |
		bar

		bar

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>abc</th>
		<th>def</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>bar</td>
		<td>baz</td>
		</tr>
		<tr>
		<td>bar</td>
		<td></td>
		</tr>
		</tbody>
		</table>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example203Line3457AbcDefNNBar() async {
		let input = """

		| abc | def |
		| --- |
		| bar |

		"""

		let expected = """
		<p>| abc | def |
		| --- |
		| bar |</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example204Line3471AbcDefNNBarNBarBazBoo() async {
		let input = """

		| abc | def |
		| --- | --- |
		| bar |
		| bar | baz | boo |

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>abc</th>
		<th>def</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>bar</td>
		<td></td>
		</tr>
		<tr>
		<td>bar</td>
		<td>baz</td>
		</tr>
		</tbody>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example205Line3499AbcDefN() async {
		let input = """

		| abc | def |
		| --- | --- |

		"""

		let expected = """
		<table>
		<thead>
		<tr>
		<th>abc</th>
		<th>def</th>
		</tr>
		</thead>
		</table>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example206Line3565FoonBarnBaz() async {
		let input = """

		> # Foo
		> bar
		> baz

		"""

		let expected = """
		<blockquote>
		<h1>Foo</h1>
		<p>bar
		baz</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example207Line3580FoonbarnBaz() async {
		let input = """

		># Foo
		>bar
		> baz

		"""

		let expected = """
		<blockquote>
		<h1>Foo</h1>
		<p>bar
		baz</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example208Line3595FoonBarnBaz() async {
		let input = """

		   > # Foo
		   > bar
		 > baz

		"""

		let expected = """
		<blockquote>
		<h1>Foo</h1>
		<p>bar
		baz</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example209Line3610FoonBarnBaz() async {
		let input = """

		    > # Foo
		    > bar
		    > baz

		"""

		let expected = """
		<pre><code>&gt; # Foo
		&gt; bar
		&gt; baz
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example210Line3625FoonBarnbaz() async {
		let input = """

		> # Foo
		> bar
		baz

		"""

		let expected = """
		<blockquote>
		<h1>Foo</h1>
		<p>bar
		baz</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example211Line3641BarnbaznFoo() async {
		let input = """

		> bar
		baz
		> foo

		"""

		let expected = """
		<blockquote>
		<p>bar
		baz
		foo</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example212Line3665Foon() async {
		let input = """

		> foo
		---

		"""

		let expected = """
		<blockquote>
		<p>foo</p>
		</blockquote>
		<hr />

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example213Line3685FoonBar() async {
		let input = """

		> - foo
		- bar

		"""

		let expected = """
		<blockquote>
		<ul>
		<li>foo</li>
		</ul>
		</blockquote>
		<ul>
		<li>bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example214Line3703FoonBar() async {
		let input = """

		>     foo
		    bar

		"""

		let expected = """
		<blockquote>
		<pre><code>foo
		</code></pre>
		</blockquote>
		<pre><code>bar
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example215Line3716Nfoon() async {
		let input = """

		> ```
		foo
		```

		"""

		let expected = """
		<blockquote>
		<pre><code></code></pre>
		</blockquote>
		<p>foo</p>
		<pre><code></code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example216Line3732FoonBar() async {
		let input = """

		> foo
		    - bar

		"""

		let expected = """
		<blockquote>
		<p>foo
		- bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example217Line3756() async {
		let input = """

		>

		"""

		let expected = """
		<blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example218Line3764NN() async {
		let input = """

		>
		>  
		> 

		"""

		let expected = """
		<blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example219Line3776NFoon() async {
		let input = """

		>
		> foo
		>  

		"""

		let expected = """
		<blockquote>
		<p>foo</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example220Line3789FoonnBar() async {
		let input = """

		> foo

		> bar

		"""

		let expected = """
		<blockquote>
		<p>foo</p>
		</blockquote>
		<blockquote>
		<p>bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example221Line3811FoonBar() async {
		let input = """

		> foo
		> bar

		"""

		let expected = """
		<blockquote>
		<p>foo
		bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example222Line3824FoonnBar() async {
		let input = """

		> foo
		>
		> bar

		"""

		let expected = """
		<blockquote>
		<p>foo</p>
		<p>bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example223Line3838FoonBar() async {
		let input = """

		foo
		> bar

		"""

		let expected = """
		<p>foo</p>
		<blockquote>
		<p>bar</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example224Line3852AaannBbb() async {
		let input = """

		> aaa
		***
		> bbb

		"""

		let expected = """
		<blockquote>
		<p>aaa</p>
		</blockquote>
		<hr />
		<blockquote>
		<p>bbb</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example225Line3870Barnbaz() async {
		let input = """

		> bar
		baz

		"""

		let expected = """
		<blockquote>
		<p>bar
		baz</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example226Line3881Barnnbaz() async {
		let input = """

		> bar

		baz

		"""

		let expected = """
		<blockquote>
		<p>bar</p>
		</blockquote>
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example227Line3893Barnnbaz() async {
		let input = """

		> bar
		>
		baz

		"""

		let expected = """
		<blockquote>
		<p>bar</p>
		</blockquote>
		<p>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example228Line3909Foonbar() async {
		let input = """

		> > > foo
		bar

		"""

		let expected = """
		<blockquote>
		<blockquote>
		<blockquote>
		<p>foo
		bar</p>
		</blockquote>
		</blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example229Line3924FoonBarnbaz() async {
		let input = """

		>>> foo
		> bar
		>>baz

		"""

		let expected = """
		<blockquote>
		<blockquote>
		<blockquote>
		<p>foo
		bar
		baz</p>
		</blockquote>
		</blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example230Line3946CodennNotCode() async {
		let input = """

		>     code

		>    not code

		"""

		let expected = """
		<blockquote>
		<pre><code>code
		</code></pre>
		</blockquote>
		<blockquote>
		<p>not code</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example231Line4000AParagraphnwithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		A paragraph
		with two lines.

		    indented code

		> A block quote.

		"""

		let expected = """
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example232Line40221AParagraphnWithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		1.  A paragraph
		    with two lines.

		        indented code

		    > A block quote.

		"""

		let expected = """
		<ol>
		<li>
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example233Line4055OnennTwo() async {
		let input = """

		- one

		 two

		"""

		let expected = """
		<ul>
		<li>one</li>
		</ul>
		<p>two</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example234Line4067OnennTwo() async {
		let input = """

		- one

		  two

		"""

		let expected = """
		<ul>
		<li>
		<p>one</p>
		<p>two</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example235Line4081OnennTwo() async {
		let input = """

		 -    one

		     two

		"""

		let expected = """
		<ul>
		<li>one</li>
		</ul>
		<pre><code> two
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example236Line4094OnennTwo() async {
		let input = """

		 -    one

		      two

		"""

		let expected = """
		<ul>
		<li>
		<p>one</p>
		<p>two</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example237Line41161OnennTwo() async {
		let input = """

		   > > 1.  one
		>>
		>>     two

		"""

		let expected = """
		<blockquote>
		<blockquote>
		<ol>
		<li>
		<p>one</p>
		<p>two</p>
		</li>
		</ol>
		</blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example238Line4143OnennTwo() async {
		let input = """

		>>- one
		>>
		  >  > two

		"""

		let expected = """
		<blockquote>
		<blockquote>
		<ul>
		<li>one</li>
		</ul>
		<p>two</p>
		</blockquote>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example239Line4162Onenn2two() async {
		let input = """

		-one

		2.two

		"""

		let expected = """
		<p>-one</p>
		<p>2.two</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example240Line4175FoonnnBar() async {
		let input = """

		- foo


		  bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<p>bar</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example241Line41921FoonnNBarnNnBaznnBam() async {
		let input = """

		1.  foo

		    ```
		    bar
		    ```

		    baz

		    > bam

		"""

		let expected = """
		<ol>
		<li>
		<p>foo</p>
		<pre><code>bar
		</code></pre>
		<p>baz</p>
		<blockquote>
		<p>bam</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example242Line4220FoonnBarnnnBaz() async {
		let input = """

		- Foo

		      bar


		      baz

		"""

		let expected = """
		<ul>
		<li>
		<p>Foo</p>
		<pre><code>bar


		baz
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example243Line4242123456789Ok() async {
		let input = """

		123456789. ok

		"""

		let expected = """
		<ol start="123456789">
		<li>ok</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example244Line42511234567890NotOk() async {
		let input = """

		1234567890. not ok

		"""

		let expected = """
		<p>1234567890. not ok</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example245Line42600Ok() async {
		let input = """

		0. ok

		"""

		let expected = """
		<ol start="0">
		<li>ok</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example246Line4269003Ok() async {
		let input = """

		003. ok

		"""

		let expected = """
		<ol start="3">
		<li>ok</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example247Line42801NotOk() async {
		let input = """

		-1. not ok

		"""

		let expected = """
		<p>-1. not ok</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example248Line4303FoonnBar() async {
		let input = """

		- foo

		      bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<pre><code>bar
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example249Line432010FoonnBar() async {
		let input = """

		  10.  foo

		           bar

		"""

		let expected = """
		<ol start="10">
		<li>
		<p>foo</p>
		<pre><code>bar
		</code></pre>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example250Line4339IndentedCodennparagraphnnMoreCode() async {
		let input = """

		    indented code

		paragraph

		    more code

		"""

		let expected = """
		<pre><code>indented code
		</code></pre>
		<p>paragraph</p>
		<pre><code>more code
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example251Line43541IndentedCodennParagraphnnMoreCode() async {
		let input = """

		1.     indented code

		   paragraph

		       more code

		"""

		let expected = """
		<ol>
		<li>
		<pre><code>indented code
		</code></pre>
		<p>paragraph</p>
		<pre><code>more code
		</code></pre>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example252Line43761IndentedCodennParagraphnnMoreCode() async {
		let input = """

		1.      indented code

		   paragraph

		       more code

		"""

		let expected = """
		<ol>
		<li>
		<pre><code> indented code
		</code></pre>
		<p>paragraph</p>
		<pre><code>more code
		</code></pre>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example253Line4403Foonnbar() async {
		let input = """

		   foo

		bar

		"""

		let expected = """
		<p>foo</p>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example254Line4413FoonnBar() async {
		let input = """

		-    foo

		  bar

		"""

		let expected = """
		<ul>
		<li>foo</li>
		</ul>
		<p>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example255Line4430FoonnBar() async {
		let input = """

		-  foo

		   bar

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<p>bar</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example256Line4458NFoonNNBarnNNBaz() async {
		let input = """

		-
		  foo
		-
		  ```
		  bar
		  ```
		-
		      baz

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li>
		<pre><code>bar
		</code></pre>
		</li>
		<li>
		<pre><code>baz
		</code></pre>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example257Line4484NFoo() async {
		let input = """

		-   
		  foo

		"""

		let expected = """
		<ul>
		<li>foo</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example258Line4498NnFoo() async {
		let input = """

		-

		  foo

		"""

		let expected = """
		<ul>
		<li></li>
		</ul>
		<p>foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example259Line4512FoonNBar() async {
		let input = """

		- foo
		-
		- bar

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li></li>
		<li>bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example260Line4527FoonNBar() async {
		let input = """

		- foo
		-   
		- bar

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li></li>
		<li>bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example261Line45421Foon2n3Bar() async {
		let input = """

		1. foo
		2.
		3. bar

		"""

		let expected = """
		<ol>
		<li>foo</li>
		<li></li>
		<li>bar</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example262Line4557() async {
		let input = """

		*

		"""

		let expected = """
		<ul>
		<li></li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example263Line4567Foonnnfoon1() async {
		let input = """

		foo
		*

		foo
		1.

		"""

		let expected = """
		<p>foo
		*</p>
		<p>foo
		1.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example264Line45891AParagraphnWithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		 1.  A paragraph
		     with two lines.

		         indented code

		     > A block quote.

		"""

		let expected = """
		<ol>
		<li>
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example265Line46131AParagraphnWithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		  1.  A paragraph
		      with two lines.

		          indented code

		      > A block quote.

		"""

		let expected = """
		<ol>
		<li>
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example266Line46371AParagraphnWithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		   1.  A paragraph
		       with two lines.

		           indented code

		       > A block quote.

		"""

		let expected = """
		<ol>
		<li>
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example267Line46611AParagraphnWithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		    1.  A paragraph
		        with two lines.

		            indented code

		        > A block quote.

		"""

		let expected = """
		<pre><code>1.  A paragraph
		    with two lines.

		        indented code

		    &gt; A block quote.
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example268Line46911AParagraphnwithTwoLinesnnIndentedCodennABlockQuote() async {
		let input = """

		  1.  A paragraph
		with two lines.

		          indented code

		      > A block quote.

		"""

		let expected = """
		<ol>
		<li>
		<p>A paragraph
		with two lines.</p>
		<pre><code>indented code
		</code></pre>
		<blockquote>
		<p>A block quote.</p>
		</blockquote>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example269Line47151AParagraphnWithTwoLines() async {
		let input = """

		  1.  A paragraph
		    with two lines.

		"""

		let expected = """
		<ol>
		<li>A paragraph
		with two lines.</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example270Line47281BlockquotencontinuedHere() async {
		let input = """

		> 1. > Blockquote
		continued here.

		"""

		let expected = """
		<blockquote>
		<ol>
		<li>
		<blockquote>
		<p>Blockquote
		continued here.</p>
		</blockquote>
		</li>
		</ol>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example271Line47451BlockquotenContinuedHere() async {
		let input = """

		> 1. > Blockquote
		> continued here.

		"""

		let expected = """
		<blockquote>
		<ol>
		<li>
		<blockquote>
		<p>Blockquote
		continued here.</p>
		</blockquote>
		</li>
		</ol>
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example272Line4773FoonBarnBaznBoo() async {
		let input = """

		- foo
		  - bar
		    - baz
		      - boo

		"""

		let expected = """
		<ul>
		<li>foo
		<ul>
		<li>bar
		<ul>
		<li>baz
		<ul>
		<li>boo</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example273Line4799FoonBarnBaznBoo() async {
		let input = """

		- foo
		 - bar
		  - baz
		   - boo

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li>bar</li>
		<li>baz</li>
		<li>boo</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example274Line481610FoonBar() async {
		let input = """

		10) foo
		    - bar

		"""

		let expected = """
		<ol start="10">
		<li>foo
		<ul>
		<li>bar</li>
		</ul>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example275Line483210FoonBar() async {
		let input = """

		10) foo
		   - bar

		"""

		let expected = """
		<ol start="10">
		<li>foo</li>
		</ol>
		<ul>
		<li>bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example276Line4847Foo() async {
		let input = """

		- - foo

		"""

		let expected = """
		<ul>
		<li>
		<ul>
		<li>foo</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example277Line486012Foo() async {
		let input = """

		1. - 2. foo

		"""

		let expected = """
		<ol>
		<li>
		<ul>
		<li>
		<ol start="2">
		<li>foo</li>
		</ol>
		</li>
		</ul>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example278Line4879FoonBarnNBaz() async {
		let input = """

		- # Foo
		- Bar
		  ---
		  baz

		"""

		let expected = """
		<ul>
		<li>
		<h1>Foo</h1>
		</li>
		<li>
		<h2>Bar</h2>
		baz</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example279Line5108FoonXBar() async {
		let input = """

		- [ ] foo
		- [x] bar

		"""

		let expected = """
		<ul>
		<li><input type="checkbox" disabled="" /> foo</li>
		<li><input type="checkbox" checked="" disabled="" /> bar</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example280Line5120XFoonBarnXBaznBim() async {
		let input = """

		- [x] foo
		  - [ ] bar
		  - [x] baz
		- [ ] bim

		"""

		let expected = """
		<ul>
		<li><input type="checkbox" checked="" disabled="" /> foo
		<ul>
		<li><input type="checkbox" disabled="" /> bar</li>
		<li><input type="checkbox" checked="" disabled="" /> baz</li>
		</ul>
		</li>
		<li><input type="checkbox" disabled="" /> bim</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example281Line5172FoonBarnBaz() async {
		let input = """

		- foo
		- bar
		+ baz

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li>bar</li>
		</ul>
		<ul>
		<li>baz</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example282Line51871Foon2Barn3Baz() async {
		let input = """

		1. foo
		2. bar
		3) baz

		"""

		let expected = """
		<ol>
		<li>foo</li>
		<li>bar</li>
		</ol>
		<ol start="3">
		<li>baz</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example283Line5206FoonBarnBaz() async {
		let input = """

		Foo
		- bar
		- baz

		"""

		let expected = """
		<p>Foo</p>
		<ul>
		<li>bar</li>
		<li>baz</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example284Line5283TheNumberOfWindowsInMyHouseIsn14TheNumberOfDoorsIs6() async {
		let input = """

		The number of windows in my house is
		14.  The number of doors is 6.

		"""

		let expected = """
		<p>The number of windows in my house is
		14.  The number of doors is 6.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example285Line5293TheNumberOfWindowsInMyHouseIsn1TheNumberOfDoorsIs6() async {
		let input = """

		The number of windows in my house is
		1.  The number of doors is 6.

		"""

		let expected = """
		<p>The number of windows in my house is</p>
		<ol>
		<li>The number of doors is 6.</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example286Line5307FoonnBarnnnBaz() async {
		let input = """

		- foo

		- bar


		- baz

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		</li>
		<li>
		<p>bar</p>
		</li>
		<li>
		<p>baz</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example287Line5328FoonBarnBaznnnBim() async {
		let input = """

		- foo
		  - bar
		    - baz


		      bim

		"""

		let expected = """
		<ul>
		<li>foo
		<ul>
		<li>bar
		<ul>
		<li>
		<p>baz</p>
		<p>bim</p>
		</li>
		</ul>
		</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example288Line5358FoonBarnnNnBaznBim() async {
		let input = """

		- foo
		- bar

		<!-- -->

		- baz
		- bim

		"""

		let expected = """
		<ul>
		<li>foo</li>
		<li>bar</li>
		</ul>
		<!-- -->
		<ul>
		<li>baz</li>
		<li>bim</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example289Line5379FoonnNotcodennFoonnNnCode() async {
		let input = """

		-   foo

		    notcode

		-   foo

		<!-- -->

		    code

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<p>notcode</p>
		</li>
		<li>
		<p>foo</p>
		</li>
		</ul>
		<!-- -->
		<pre><code>code
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example290Line5410AnBnCnDnEnFnG() async {
		let input = """

		- a
		 - b
		  - c
		   - d
		  - e
		 - f
		- g

		"""

		let expected = """
		<ul>
		<li>a</li>
		<li>b</li>
		<li>c</li>
		<li>d</li>
		<li>e</li>
		<li>f</li>
		<li>g</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example291Line54311Ann2Bnn3C() async {
		let input = """

		1. a

		  2. b

		   3. c

		"""

		let expected = """
		<ol>
		<li>
		<p>a</p>
		</li>
		<li>
		<p>b</p>
		</li>
		<li>
		<p>c</p>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example292Line5455AnBnCnDnE() async {
		let input = """

		- a
		 - b
		  - c
		   - d
		    - e

		"""

		let expected = """
		<ul>
		<li>a</li>
		<li>b</li>
		<li>c</li>
		<li>d
		- e</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example293Line54751Ann2Bnn3C() async {
		let input = """

		1. a

		  2. b

		    3. c

		"""

		let expected = """
		<ol>
		<li>
		<p>a</p>
		</li>
		<li>
		<p>b</p>
		</li>
		</ol>
		<pre><code>3. c
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example294Line5498AnBnnC() async {
		let input = """

		- a
		- b

		- c

		"""

		let expected = """
		<ul>
		<li>
		<p>a</p>
		</li>
		<li>
		<p>b</p>
		</li>
		<li>
		<p>c</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example295Line5520AnnnC() async {
		let input = """

		* a
		*

		* c

		"""

		let expected = """
		<ul>
		<li>
		<p>a</p>
		</li>
		<li></li>
		<li>
		<p>c</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example296Line5542AnBnnCnD() async {
		let input = """

		- a
		- b

		  c
		- d

		"""

		let expected = """
		<ul>
		<li>
		<p>a</p>
		</li>
		<li>
		<p>b</p>
		<p>c</p>
		</li>
		<li>
		<p>d</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example297Line5564AnBnnRefUrlnD() async {
		let input = """

		- a
		- b

		  [ref]: /url
		- d

		"""

		let expected = """
		<ul>
		<li>
		<p>a</p>
		</li>
		<li>
		<p>b</p>
		</li>
		<li>
		<p>d</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example298Line5587AnNBnnnNC() async {
		let input = """

		- a
		- ```
		  b


		  ```
		- c

		"""

		let expected = """
		<ul>
		<li>a</li>
		<li>
		<pre><code>b


		</code></pre>
		</li>
		<li>c</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example299Line5613AnBnnCnD() async {
		let input = """

		- a
		  - b

		    c
		- d

		"""

		let expected = """
		<ul>
		<li>a
		<ul>
		<li>
		<p>b</p>
		<p>c</p>
		</li>
		</ul>
		</li>
		<li>d</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example300Line5637AnBnNC() async {
		let input = """

		* a
		  > b
		  >
		* c

		"""

		let expected = """
		<ul>
		<li>a
		<blockquote>
		<p>b</p>
		</blockquote>
		</li>
		<li>c</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example301Line5657AnBnNCnND() async {
		let input = """

		- a
		  > b
		  ```
		  c
		  ```
		- d

		"""

		let expected = """
		<ul>
		<li>a
		<blockquote>
		<p>b</p>
		</blockquote>
		<pre><code>c
		</code></pre>
		</li>
		<li>d</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example302Line5680A() async {
		let input = """

		- a

		"""

		let expected = """
		<ul>
		<li>a</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example303Line5689AnB() async {
		let input = """

		- a
		  - b

		"""

		let expected = """
		<ul>
		<li>a
		<ul>
		<li>b</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example304Line57061NFoonNnBar() async {
		let input = """

		1. ```
		   foo
		   ```

		   bar

		"""

		let expected = """
		<ol>
		<li>
		<pre><code>foo
		</code></pre>
		<p>bar</p>
		</li>
		</ol>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example305Line5725FoonBarnnBaz() async {
		let input = """

		* foo
		  * bar

		  baz

		"""

		let expected = """
		<ul>
		<li>
		<p>foo</p>
		<ul>
		<li>bar</li>
		</ul>
		<p>baz</p>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example306Line5743AnBnCnnDnEnF() async {
		let input = """

		- a
		  - b
		  - c

		- d
		  - e
		  - f

		"""

		let expected = """
		<ul>
		<li>
		<p>a</p>
		<ul>
		<li>b</li>
		<li>c</li>
		</ul>
		</li>
		<li>
		<p>d</p>
		<ul>
		<li>e</li>
		<li>f</li>
		</ul>
		</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example307Line5777Hilo() async {
		let input = """

		`hi`lo`

		"""

		let expected = """
		<p><code>hi</code>lo`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example308Line5791() async {
		let input = """

		\\!\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~

		"""

		let expected = """
		<p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example309Line5801Aa3() async {
		let input = """

		\\	\\A\\a\\ \\3\\φ\\«

		"""

		let expected = """
		<p>\\	\\A\\a\\ \\3\\φ\\«</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example310Line5811NotEmphasizednbrNotATagnnotALinkfoonnotCoden1NotAListnNotAListnNotAHeadingnfooUrlNotAReferencenoumlNotACharacterEntity() async {
		let input = """

		\\*not emphasized*
		\\<br/> not a tag
		\\[not a link](/foo)
		\\`not code`
		1\\. not a list
		\\* not a list
		\\# not a heading
		\\[foo]: /url "not a reference"
		\\&ouml; not a character entity

		"""

		let expected = """
		<p>*not emphasized*
		&lt;br/&gt; not a tag
		[not a link](/foo)
		`not code`
		1. not a list
		* not a list
		# not a heading
		[foo]: /url &quot;not a reference&quot;
		&amp;ouml; not a character entity</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example311Line5836Emphasis() async {
		let input = """

		\\\\*emphasis*

		"""

		let expected = """
		<p>\\<em>emphasis</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example312Line5845Foonbar() async {
		let input = """

		foo\\
		bar

		"""

		let expected = """
		<p>foo<br />
		bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example313Line5857() async {
		let input = """

		`` \\[\\` ``

		"""

		let expected = """
		<p><code>\\[\\`</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example314Line5864() async {
		let input = """

		    \\[\\]

		"""

		let expected = """
		<pre><code>\\[\\]
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example315Line5872Nn() async {
		let input = """

		~~~
		\\[\\]
		~~~

		"""

		let expected = """
		<pre><code>\\[\\]
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example316Line5882Httpexamplecomfind() async {
		let input = """

		<http://example.com?find=\\*>

		"""

		let expected = """
		<p><a href="http://example.com?find=%5C*">http://example.com?find=\\*</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example317Line5889AHrefbar() async {
		let input = """

		<a href="/bar\\/)">

		"""

		let expected = """
		<a href="/bar\\/)">

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example318Line5899FoobarTitle() async {
		let input = """

		[foo](/bar\\* "ti\\*tle")

		"""

		let expected = """
		<p><a href="/bar*" title="ti*tle">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example319Line5906FoonnfooBarTitle() async {
		let input = """

		[foo]

		[foo]: /bar\\* "ti\\*tle"

		"""

		let expected = """
		<p><a href="/bar*" title="ti*tle">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example320Line5915Foobarnfoon() async {
		let input = """

		``` foo\\+bar
		foo
		```

		"""

		let expected = """
		<pre><code class="language-foo+bar">foo
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example321Line5952NbspAmpCopyAEligDcaronnfrac34HilbertSpaceDifferentialDnClockwiseContourIntegralNgE() async {
		let input = """

		&nbsp; &amp; &copy; &AElig; &Dcaron;
		&frac34; &HilbertSpace; &DifferentialD;
		&ClockwiseContourIntegral; &ngE;

		"""

		let expected = """
		<p>  &amp; © Æ Ď
		¾ ℋ ⅆ
		∲ ≧̸</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example322Line59713512349920() async {
		let input = """

		&#35; &#1234; &#992; &#0;

		"""

		let expected = """
		<p># Ӓ Ϡ �</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example323Line5984X22XD06Xcab() async {
		let input = """

		&#X22; &#XD06; &#xcab;

		"""

		let expected = """
		<p>&quot; ആ ಫ</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example324Line5993NbspXXn987654321nabcdef0nThisIsNotDefinedHi() async {
		let input = """

		&nbsp &x; &#; &#x;
		&#987654321;
		&#abcdef0;
		&ThisIsNotDefined; &hi?;

		"""

		let expected = """
		<p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
		&amp;#987654321;
		&amp;#abcdef0;
		&amp;ThisIsNotDefined; &amp;hi?;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example325Line6010Copy() async {
		let input = """

		&copy

		"""

		let expected = """
		<p>&amp;copy</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example326Line6020MadeUpEntity() async {
		let input = """

		&MadeUpEntity;

		"""

		let expected = """
		<p>&amp;MadeUpEntity;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example327Line6031AHrefoumloumlhtml() async {
		let input = """

		<a href="&ouml;&ouml;.html">

		"""

		let expected = """
		<a href="&ouml;&ouml;.html">

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example328Line6038FoofoumloumlFoumlouml() async {
		let input = """

		[foo](/f&ouml;&ouml; "f&ouml;&ouml;")

		"""

		let expected = """
		<p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example329Line6045FoonnfooFoumloumlFoumlouml() async {
		let input = """

		[foo]

		[foo]: /f&ouml;&ouml; "f&ouml;&ouml;"

		"""

		let expected = """
		<p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example330Line6054Foumloumlnfoon() async {
		let input = """

		``` f&ouml;&ouml;
		foo
		```

		"""

		let expected = """
		<pre><code class="language-föö">foo
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example331Line6067Foumlouml() async {
		let input = """

		`f&ouml;&ouml;`

		"""

		let expected = """
		<p><code>f&amp;ouml;&amp;ouml;</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example332Line6074Foumlfouml() async {
		let input = """

		    f&ouml;f&ouml;

		"""

		let expected = """
		<pre><code>f&amp;ouml;f&amp;ouml;
		</code></pre>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example333Line608642foo42nfoo() async {
		let input = """

		&#42;foo&#42;
		*foo*

		"""

		let expected = """
		<p>*foo*
		<em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example334Line609442FoonnFoo() async {
		let input = """

		&#42; foo

		* foo

		"""

		let expected = """
		<p>* foo</p>
		<ul>
		<li>foo</li>
		</ul>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example335Line6105Foo1010bar() async {
		let input = """

		foo&#10;&#10;bar

		"""

		let expected = """
		<p>foo

		bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example336Line61139foo() async {
		let input = """

		&#9;foo

		"""

		let expected = """
		<p>	foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example337Line6120AurlQuottitquot() async {
		let input = """

		[a](url &quot;tit&quot;)

		"""

		let expected = """
		<p>[a](url &quot;tit&quot;)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example338Line6148Foo() async {
		let input = """

		`foo`

		"""

		let expected = """
		<p><code>foo</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example339Line6159FooBar() async {
		let input = """

		`` foo ` bar ``

		"""

		let expected = """
		<p><code>foo ` bar</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example340Line6169() async {
		let input = """

		` `` `

		"""

		let expected = """
		<p><code>``</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example341Line6177() async {
		let input = """

		`  ``  `

		"""

		let expected = """
		<p><code> `` </code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example342Line6186A() async {
		let input = """

		` a`

		"""

		let expected = """
		<p><code> a</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example343Line6195B() async {
		let input = """

		` b `

		"""

		let expected = """
		<p><code> b </code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example344Line6203N() async {
		let input = """

		` `
		`  `

		"""

		let expected = """
		<p><code> </code>
		<code>  </code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example345Line6214NfoonbarNbazn() async {
		let input = """

		``
		foo
		bar  
		baz
		``

		"""

		let expected = """
		<p><code>foo bar   baz</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example346Line6224NfooN() async {
		let input = """

		``
		foo 
		``

		"""

		let expected = """
		<p><code>foo </code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example347Line6235FooBarNbaz() async {
		let input = """

		`foo   bar 
		baz`

		"""

		let expected = """
		<p><code>foo   bar  baz</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example348Line6252Foobar() async {
		let input = """

		`foo\\`bar`

		"""

		let expected = """
		<p><code>foo\\</code>bar`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example349Line6263Foobar() async {
		let input = """

		``foo`bar``

		"""

		let expected = """
		<p><code>foo`bar</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example350Line6269FooBar() async {
		let input = """

		` foo `` bar `

		"""

		let expected = """
		<p><code>foo `` bar</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example351Line6281Foo() async {
		let input = """

		*foo`*`

		"""

		let expected = """
		<p>*foo<code>*</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example352Line6290NotALinkfoo() async {
		let input = """

		[not a `link](/foo`)

		"""

		let expected = """
		<p>[not a <code>link](/foo</code>)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example353Line6300AHref() async {
		let input = """

		`<a href="`">`

		"""

		let expected = """
		<p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example354Line6309AHref() async {
		let input = """

		<a href="`">`

		"""

		let expected = """
		<p><a href="`">`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example355Line6318Httpfoobarbaz() async {
		let input = """

		`<http://foo.bar.`baz>`

		"""

		let expected = """
		<p><code>&lt;http://foo.bar.</code>baz&gt;`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example356Line6327Httpfoobarbaz() async {
		let input = """

		<http://foo.bar.`baz>`

		"""

		let expected = """
		<p><a href="http://foo.bar.%60baz">http://foo.bar.`baz</a>`</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example357Line6337Foo() async {
		let input = """

		```foo``

		"""

		let expected = """
		<p>```foo``</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example358Line6344Foo() async {
		let input = """

		`foo

		"""

		let expected = """
		<p>`foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example359Line6353Foobar() async {
		let input = """

		`foo``bar``

		"""

		let expected = """
		<p>`foo<code>bar</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example360Line6570FooBar() async {
		let input = """

		*foo bar*

		"""

		let expected = """
		<p><em>foo bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example361Line6580AFooBar() async {
		let input = """

		a * foo bar*

		"""

		let expected = """
		<p>a * foo bar*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example362Line6591Afoo() async {
		let input = """

		a*"foo"*

		"""

		let expected = """
		<p>a*&quot;foo&quot;*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example363Line6600A() async {
		let input = """

		* a *

		"""

		let expected = """
		<p>* a *</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example364Line6609Foobar() async {
		let input = """

		foo*bar*

		"""

		let expected = """
		<p>foo<em>bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example365Line66165678() async {
		let input = """

		5*6*78

		"""

		let expected = """
		<p>5<em>6</em>78</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example366Line6625FooBar() async {
		let input = """

		_foo bar_

		"""

		let expected = """
		<p><em>foo bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example367Line6635FooBar() async {
		let input = """

		_ foo bar_

		"""

		let expected = """
		<p>_ foo bar_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example368Line6645Afoo() async {
		let input = """

		a_"foo"_

		"""

		let expected = """
		<p>a_&quot;foo&quot;_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example369Line6654Foobar() async {
		let input = """

		foo_bar_

		"""

		let expected = """
		<p>foo_bar_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example370Line66615678() async {
		let input = """

		5_6_78

		"""

		let expected = """
		<p>5_6_78</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example371Line6668() async {
		let input = """

		пристаням_стремятся_

		"""

		let expected = """
		<p>пристаням_стремятся_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example372Line6678Aabbcc() async {
		let input = """

		aa_"bb"_cc

		"""

		let expected = """
		<p>aa_&quot;bb&quot;_cc</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example373Line6689FooBar() async {
		let input = """

		foo-_(bar)_

		"""

		let expected = """
		<p>foo-<em>(bar)</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example374Line6701Foo() async {
		let input = """

		_foo*

		"""

		let expected = """
		<p>_foo*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example375Line6711FooBar() async {
		let input = """

		*foo bar *

		"""

		let expected = """
		<p>*foo bar *</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example376Line6720FooBarn() async {
		let input = """

		*foo bar
		*

		"""

		let expected = """
		<p>*foo bar
		*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example377Line6733Foo() async {
		let input = """

		*(*foo)

		"""

		let expected = """
		<p>*(*foo)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example378Line6743Foo() async {
		let input = """

		*(*foo*)*

		"""

		let expected = """
		<p><em>(<em>foo</em>)</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example379Line6752Foobar() async {
		let input = """

		*foo*bar

		"""

		let expected = """
		<p><em>foo</em>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example380Line6765FooBar() async {
		let input = """

		_foo bar _

		"""

		let expected = """
		<p>_foo bar _</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example381Line6775Foo() async {
		let input = """

		_(_foo)

		"""

		let expected = """
		<p>_(_foo)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example382Line6784Foo() async {
		let input = """

		_(_foo_)_

		"""

		let expected = """
		<p><em>(<em>foo</em>)</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example383Line6793Foobar() async {
		let input = """

		_foo_bar

		"""

		let expected = """
		<p>_foo_bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example384Line6800() async {
		let input = """

		_пристаням_стремятся

		"""

		let expected = """
		<p>_пристаням_стремятся</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example385Line6807Foobarbaz() async {
		let input = """

		_foo_bar_baz_

		"""

		let expected = """
		<p><em>foo_bar_baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example386Line6818Bar() async {
		let input = """

		_(bar)_.

		"""

		let expected = """
		<p><em>(bar)</em>.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example387Line6827FooBar() async {
		let input = """

		**foo bar**

		"""

		let expected = """
		<p><strong>foo bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example388Line6837FooBar() async {
		let input = """

		** foo bar**

		"""

		let expected = """
		<p>** foo bar**</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example389Line6848Afoo() async {
		let input = """

		a**"foo"**

		"""

		let expected = """
		<p>a**&quot;foo&quot;**</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example390Line6857Foobar() async {
		let input = """

		foo**bar**

		"""

		let expected = """
		<p>foo<strong>bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example391Line6866FooBar() async {
		let input = """

		__foo bar__

		"""

		let expected = """
		<p><strong>foo bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example392Line6876FooBar() async {
		let input = """

		__ foo bar__

		"""

		let expected = """
		<p>__ foo bar__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example393Line6884NfooBar() async {
		let input = """

		__
		foo bar__

		"""

		let expected = """
		<p>__
		foo bar__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example394Line6896Afoo() async {
		let input = """

		a__"foo"__

		"""

		let expected = """
		<p>a__&quot;foo&quot;__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example395Line6905Foobar() async {
		let input = """

		foo__bar__

		"""

		let expected = """
		<p>foo__bar__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example396Line69125678() async {
		let input = """

		5__6__78

		"""

		let expected = """
		<p>5__6__78</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example397Line6919() async {
		let input = """

		пристаням__стремятся__

		"""

		let expected = """
		<p>пристаням__стремятся__</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example398Line6926FooBarBaz() async {
		let input = """

		__foo, __bar__, baz__

		"""

		let expected = """
		<p><strong>foo, <strong>bar</strong>, baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example399Line6937FooBar() async {
		let input = """

		foo-__(bar)__

		"""

		let expected = """
		<p>foo-<strong>(bar)</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example400Line6950FooBar() async {
		let input = """

		**foo bar **

		"""

		let expected = """
		<p>**foo bar **</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example401Line6963Foo() async {
		let input = """

		**(**foo)

		"""

		let expected = """
		<p>**(**foo)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example402Line6973Foo() async {
		let input = """

		*(**foo**)*

		"""

		let expected = """
		<p><em>(<strong>foo</strong>)</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example403Line6980GomphocarpusGomphocarpusPhysocarpusSynnAsclepiasPhysocarpa() async {
		let input = """

		**Gomphocarpus (*Gomphocarpus physocarpus*, syn.
		*Asclepias physocarpa*)**

		"""

		let expected = """
		<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.
		<em>Asclepias physocarpa</em>)</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example404Line6989FooBarFoo() async {
		let input = """

		**foo "*bar*" foo**

		"""

		let expected = """
		<p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example405Line6998Foobar() async {
		let input = """

		**foo**bar

		"""

		let expected = """
		<p><strong>foo</strong>bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example406Line7010FooBar() async {
		let input = """

		__foo bar __

		"""

		let expected = """
		<p>__foo bar __</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example407Line7020Foo() async {
		let input = """

		__(__foo)

		"""

		let expected = """
		<p>__(__foo)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example408Line7030Foo() async {
		let input = """

		_(__foo__)_

		"""

		let expected = """
		<p><em>(<strong>foo</strong>)</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example409Line7039Foobar() async {
		let input = """

		__foo__bar

		"""

		let expected = """
		<p>__foo__bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example410Line7046() async {
		let input = """

		__пристаням__стремятся

		"""

		let expected = """
		<p>__пристаням__стремятся</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example411Line7053Foobarbaz() async {
		let input = """

		__foo__bar__baz__

		"""

		let expected = """
		<p><strong>foo__bar__baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example412Line7064Bar() async {
		let input = """

		__(bar)__.

		"""

		let expected = """
		<p><strong>(bar)</strong>.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example413Line7076FooBarurl() async {
		let input = """

		*foo [bar](/url)*

		"""

		let expected = """
		<p><em>foo <a href="/url">bar</a></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example414Line7083Foonbar() async {
		let input = """

		*foo
		bar*

		"""

		let expected = """
		<p><em>foo
		bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example415Line7095FooBarBaz() async {
		let input = """

		_foo __bar__ baz_

		"""

		let expected = """
		<p><em>foo <strong>bar</strong> baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example416Line7102FooBarBaz() async {
		let input = """

		_foo _bar_ baz_

		"""

		let expected = """
		<p><em>foo <em>bar</em> baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example417Line7109FooBar() async {
		let input = """

		__foo_ bar_

		"""

		let expected = """
		<p><em><em>foo</em> bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example418Line7116FooBar() async {
		let input = """

		*foo *bar**

		"""

		let expected = """
		<p><em>foo <em>bar</em></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example419Line7123FooBarBaz() async {
		let input = """

		*foo **bar** baz*

		"""

		let expected = """
		<p><em>foo <strong>bar</strong> baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example420Line7129Foobarbaz() async {
		let input = """

		*foo**bar**baz*

		"""

		let expected = """
		<p><em>foo<strong>bar</strong>baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example421Line7153Foobar() async {
		let input = """

		*foo**bar*

		"""

		let expected = """
		<p><em>foo**bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example422Line7166FooBar() async {
		let input = """

		***foo** bar*

		"""

		let expected = """
		<p><em><strong>foo</strong> bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example423Line7173FooBar() async {
		let input = """

		*foo **bar***

		"""

		let expected = """
		<p><em>foo <strong>bar</strong></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example424Line7180Foobar() async {
		let input = """

		*foo**bar***

		"""

		let expected = """
		<p><em>foo<strong>bar</strong></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example425Line7191Foobarbaz() async {
		let input = """

		foo***bar***baz

		"""

		let expected = """
		<p>foo<em><strong>bar</strong></em>baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example426Line7197Foobarbaz() async {
		let input = """

		foo******bar*********baz

		"""

		let expected = """
		<p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example427Line7206FooBarBazBimBop() async {
		let input = """

		*foo **bar *baz* bim** bop*

		"""

		let expected = """
		<p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example428Line7213FooBarurl() async {
		let input = """

		*foo [*bar*](/url)*

		"""

		let expected = """
		<p><em>foo <a href="/url"><em>bar</em></a></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example429Line7222IsNotAnEmptyEmphasis() async {
		let input = """

		** is not an empty emphasis

		"""

		let expected = """
		<p>** is not an empty emphasis</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example430Line7229IsNotAnEmptyStrongEmphasis() async {
		let input = """

		**** is not an empty strong emphasis

		"""

		let expected = """
		<p>**** is not an empty strong emphasis</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example431Line7242FooBarurl() async {
		let input = """

		**foo [bar](/url)**

		"""

		let expected = """
		<p><strong>foo <a href="/url">bar</a></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example432Line7249Foonbar() async {
		let input = """

		**foo
		bar**

		"""

		let expected = """
		<p><strong>foo
		bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example433Line7261FooBarBaz() async {
		let input = """

		__foo _bar_ baz__

		"""

		let expected = """
		<p><strong>foo <em>bar</em> baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example434Line7268FooBarBaz() async {
		let input = """

		__foo __bar__ baz__

		"""

		let expected = """
		<p><strong>foo <strong>bar</strong> baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example435Line7275FooBar() async {
		let input = """

		____foo__ bar__

		"""

		let expected = """
		<p><strong><strong>foo</strong> bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example436Line7282FooBar() async {
		let input = """

		**foo **bar****

		"""

		let expected = """
		<p><strong>foo <strong>bar</strong></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example437Line7289FooBarBaz() async {
		let input = """

		**foo *bar* baz**

		"""

		let expected = """
		<p><strong>foo <em>bar</em> baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example438Line7296Foobarbaz() async {
		let input = """

		**foo*bar*baz**

		"""

		let expected = """
		<p><strong>foo<em>bar</em>baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example439Line7303FooBar() async {
		let input = """

		***foo* bar**

		"""

		let expected = """
		<p><strong><em>foo</em> bar</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example440Line7310FooBar() async {
		let input = """

		**foo *bar***

		"""

		let expected = """
		<p><strong>foo <em>bar</em></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example441Line7319FooBarBaznbimBop() async {
		let input = """

		**foo *bar **baz**
		bim* bop**

		"""

		let expected = """
		<p><strong>foo <em>bar <strong>baz</strong>
		bim</em> bop</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example442Line7328FooBarurl() async {
		let input = """

		**foo [*bar*](/url)**

		"""

		let expected = """
		<p><strong>foo <a href="/url"><em>bar</em></a></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example443Line7337IsNotAnEmptyEmphasis() async {
		let input = """

		__ is not an empty emphasis

		"""

		let expected = """
		<p>__ is not an empty emphasis</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example444Line7344IsNotAnEmptyStrongEmphasis() async {
		let input = """

		____ is not an empty strong emphasis

		"""

		let expected = """
		<p>____ is not an empty strong emphasis</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example445Line7354Foo() async {
		let input = """

		foo ***

		"""

		let expected = """
		<p>foo ***</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example446Line7361Foo() async {
		let input = """

		foo *\\**

		"""

		let expected = """
		<p>foo <em>*</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example447Line7368Foo() async {
		let input = """

		foo *_*

		"""

		let expected = """
		<p>foo <em>_</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example448Line7375Foo() async {
		let input = """

		foo *****

		"""

		let expected = """
		<p>foo *****</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example449Line7382Foo() async {
		let input = """

		foo **\\***

		"""

		let expected = """
		<p>foo <strong>*</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example450Line7389Foo() async {
		let input = """

		foo **_**

		"""

		let expected = """
		<p>foo <strong>_</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example451Line7400Foo() async {
		let input = """

		**foo*

		"""

		let expected = """
		<p>*<em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example452Line7407Foo() async {
		let input = """

		*foo**

		"""

		let expected = """
		<p><em>foo</em>*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example453Line7414Foo() async {
		let input = """

		***foo**

		"""

		let expected = """
		<p>*<strong>foo</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example454Line7421Foo() async {
		let input = """

		****foo*

		"""

		let expected = """
		<p>***<em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example455Line7428Foo() async {
		let input = """

		**foo***

		"""

		let expected = """
		<p><strong>foo</strong>*</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example456Line7435Foo() async {
		let input = """

		*foo****

		"""

		let expected = """
		<p><em>foo</em>***</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example457Line7445Foo() async {
		let input = """

		foo ___

		"""

		let expected = """
		<p>foo ___</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example458Line7452Foo() async {
		let input = """

		foo _\\__

		"""

		let expected = """
		<p>foo <em>_</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example459Line7459Foo() async {
		let input = """

		foo _*_

		"""

		let expected = """
		<p>foo <em>*</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example460Line7466Foo() async {
		let input = """

		foo _____

		"""

		let expected = """
		<p>foo _____</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example461Line7473Foo() async {
		let input = """

		foo __\\___

		"""

		let expected = """
		<p>foo <strong>_</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example462Line7480Foo() async {
		let input = """

		foo __*__

		"""

		let expected = """
		<p>foo <strong>*</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example463Line7487Foo() async {
		let input = """

		__foo_

		"""

		let expected = """
		<p>_<em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example464Line7498Foo() async {
		let input = """

		_foo__

		"""

		let expected = """
		<p><em>foo</em>_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example465Line7505Foo() async {
		let input = """

		___foo__

		"""

		let expected = """
		<p>_<strong>foo</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example466Line7512Foo() async {
		let input = """

		____foo_

		"""

		let expected = """
		<p>___<em>foo</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example467Line7519Foo() async {
		let input = """

		__foo___

		"""

		let expected = """
		<p><strong>foo</strong>_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example468Line7526Foo() async {
		let input = """

		_foo____

		"""

		let expected = """
		<p><em>foo</em>___</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example469Line7536Foo() async {
		let input = """

		**foo**

		"""

		let expected = """
		<p><strong>foo</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example470Line7543Foo() async {
		let input = """

		*_foo_*

		"""

		let expected = """
		<p><em><em>foo</em></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example471Line7550Foo() async {
		let input = """

		__foo__

		"""

		let expected = """
		<p><strong>foo</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example472Line7557Foo() async {
		let input = """

		_*foo*_

		"""

		let expected = """
		<p><em><em>foo</em></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example473Line7567Foo() async {
		let input = """

		****foo****

		"""

		let expected = """
		<p><strong><strong>foo</strong></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example474Line7574Foo() async {
		let input = """

		____foo____

		"""

		let expected = """
		<p><strong><strong>foo</strong></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example475Line7585Foo() async {
		let input = """

		******foo******

		"""

		let expected = """
		<p><strong><strong><strong>foo</strong></strong></strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example476Line7594Foo() async {
		let input = """

		***foo***

		"""

		let expected = """
		<p><em><strong>foo</strong></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example477Line7601Foo() async {
		let input = """

		_____foo_____

		"""

		let expected = """
		<p><em><strong><strong>foo</strong></strong></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example478Line7610FooBarBaz() async {
		let input = """

		*foo _bar* baz_

		"""

		let expected = """
		<p><em>foo _bar</em> baz_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example479Line7617FooBarBazBimBam() async {
		let input = """

		*foo __bar *baz bim__ bam*

		"""

		let expected = """
		<p><em>foo <strong>bar *baz bim</strong> bam</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example480Line7626FooBarBaz() async {
		let input = """

		**foo **bar baz**

		"""

		let expected = """
		<p>**foo <strong>bar baz</strong></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example481Line7633FooBarBaz() async {
		let input = """

		*foo *bar baz*

		"""

		let expected = """
		<p>*foo <em>bar baz</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example482Line7642Barurl() async {
		let input = """

		*[bar*](/url)

		"""

		let expected = """
		<p>*<a href="/url">bar*</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example483Line7649FooBarurl() async {
		let input = """

		_foo [bar_](/url)

		"""

		let expected = """
		<p>_foo <a href="/url">bar_</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example484Line7656ImgSrcfooTitle() async {
		let input = """

		*<img src="foo" title="*"/>

		"""

		let expected = """
		<p>*<img src="foo" title="*"/></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example485Line7663AHref() async {
		let input = """

		**<a href="**">

		"""

		let expected = """
		<p>**<a href="**"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example486Line7670AHref() async {
		let input = """

		__<a href="__">

		"""

		let expected = """
		<p>__<a href="__"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example487Line7677A() async {
		let input = """

		*a `*`*

		"""

		let expected = """
		<p><em>a <code>*</code></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example488Line7684A() async {
		let input = """

		_a `_`_

		"""

		let expected = """
		<p><em>a <code>_</code></em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example489Line7691Ahttpfoobarq() async {
		let input = """

		**a<http://foo.bar/?q=**>

		"""

		let expected = """
		<p>**a<a href="http://foo.bar/?q=**">http://foo.bar/?q=**</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example490Line7698Ahttpfoobarq() async {
		let input = """

		__a<http://foo.bar/?q=__>

		"""

		let expected = """
		<p>__a<a href="http://foo.bar/?q=__">http://foo.bar/?q=__</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example491Line7714HiHelloWorld() async {
		let input = """

		~~Hi~~ Hello, world!

		"""

		let expected = """
		<p><del>Hi</del> Hello, world!</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example492Line7723ThisHasAnnnewParagraph() async {
		let input = """

		This ~~has a

		new paragraph~~.

		"""

		let expected = """
		<p>This ~~has a</p>
		<p>new paragraph~~.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example493Line7734ThisWillNotStrike() async {
		let input = """

		This will ~~~not~~~ strike.

		"""

		let expected = """
		<p>This will ~~~not~~~ strike.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example494Line7817LinkuriTitle() async {
		let input = """

		[link](/uri "title")

		"""

		let expected = """
		<p><a href="/uri" title="title">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example495Line7826Linkuri() async {
		let input = """

		[link](/uri)

		"""

		let expected = """
		<p><a href="/uri">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example496Line7835Link() async {
		let input = """

		[link]()

		"""

		let expected = """
		<p><a href="">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example497Line7842Link() async {
		let input = """

		[link](<>)

		"""

		let expected = """
		<p><a href="">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example498Line7851LinkmyUri() async {
		let input = """

		[link](/my uri)

		"""

		let expected = """
		<p>[link](/my uri)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example499Line7857LinkmyUri() async {
		let input = """

		[link](</my uri>)

		"""

		let expected = """
		<p><a href="/my%20uri">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example500Line7866Linkfoonbar() async {
		let input = """

		[link](foo
		bar)

		"""

		let expected = """
		<p>[link](foo
		bar)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example501Line7874Linkfoonbar() async {
		let input = """

		[link](<foo
		bar>)

		"""

		let expected = """
		<p>[link](<foo
		bar>)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example502Line7885Abc() async {
		let input = """

		[a](<b)c>)

		"""

		let expected = """
		<p><a href="b)c">a</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example503Line7893Linkfoo() async {
		let input = """

		[link](<foo\\>)

		"""

		let expected = """
		<p>[link](&lt;foo&gt;)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example504Line7902Abcnabcnabc() async {
		let input = """

		[a](<b)c
		[a](<b)c>
		[a](<b>c)

		"""

		let expected = """
		<p>[a](&lt;b)c
		[a](&lt;b)c&gt;
		[a](<b>c)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example505Line7914Linkfoo() async {
		let input = """

		[link](\\(foo\\))

		"""

		let expected = """
		<p><a href="(foo)">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example506Line7923Linkfooandbar() async {
		let input = """

		[link](foo(and(bar)))

		"""

		let expected = """
		<p><a href="foo(and(bar))">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example507Line7932Linkfooandbar() async {
		let input = """

		[link](foo\\(and\\(bar\\))

		"""

		let expected = """
		<p><a href="foo(and(bar)">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example508Line7939Linkfooandbar() async {
		let input = """

		[link](<foo(and(bar)>)

		"""

		let expected = """
		<p><a href="foo(and(bar)">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example509Line7949Linkfoo() async {
		let input = """

		[link](foo\\)\\:)

		"""

		let expected = """
		<p><a href="foo):">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example510Line7958Linkfragmentnnlinkhttpexamplecomfragmentnnlinkhttpexamplecomfoo3frag() async {
		let input = """

		[link](#fragment)

		[link](http://example.com#fragment)

		[link](http://example.com?foo=3#frag)

		"""

		let expected = """
		<p><a href="#fragment">link</a></p>
		<p><a href="http://example.com#fragment">link</a></p>
		<p><a href="http://example.com?foo=3#frag">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example511Line7974Linkfoobar() async {
		let input = """

		[link](foo\\bar)

		"""

		let expected = """
		<p><a href="foo%5Cbar">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example512Line7990Linkfoo20bauml() async {
		let input = """

		[link](foo%20b&auml;)

		"""

		let expected = """
		<p><a href="foo%20b%C3%A4">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example513Line8001Linktitle() async {
		let input = """

		[link]("title")

		"""

		let expected = """
		<p><a href="%22title%22">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example514Line8010LinkurlTitlenlinkurlTitlenlinkurlTitle() async {
		let input = """

		[link](/url "title")
		[link](/url 'title')
		[link](/url (title))

		"""

		let expected = """
		<p><a href="/url" title="title">link</a>
		<a href="/url" title="title">link</a>
		<a href="/url" title="title">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example515Line8024LinkurlTitleQuot() async {
		let input = """

		[link](/url "title \\"&quot;")

		"""

		let expected = """
		<p><a href="/url" title="title &quot;&quot;">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example516Line8034LinkurlTitle() async {
		let input = """

		[link](/url "title")

		"""

		let expected = """
		<p><a href="/url%C2%A0%22title%22">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example517Line8043LinkurlTitleAndTitle() async {
		let input = """

		[link](/url "title "and" title")

		"""

		let expected = """
		<p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example518Line8052LinkurlTitleAndTitle() async {
		let input = """

		[link](/url 'title "and" title')

		"""

		let expected = """
		<p><a href="/url" title="title &quot;and&quot; title">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example519Line8076LinkUrinTitle() async {
		let input = """

		[link](   /uri
		  "title"  )

		"""

		let expected = """
		<p><a href="/uri" title="title">link</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example520Line8087LinkUri() async {
		let input = """

		[link] (/uri)

		"""

		let expected = """
		<p>[link] (/uri)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example521Line8097LinkFooBaruri() async {
		let input = """

		[link [foo [bar]]](/uri)

		"""

		let expected = """
		<p><a href="/uri">link [foo [bar]]</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example522Line8104LinkBaruri() async {
		let input = """

		[link] bar](/uri)

		"""

		let expected = """
		<p>[link] bar](/uri)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example523Line8111LinkBaruri() async {
		let input = """

		[link [bar](/uri)

		"""

		let expected = """
		<p>[link <a href="/uri">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example524Line8118LinkBaruri() async {
		let input = """

		[link \\[bar](/uri)

		"""

		let expected = """
		<p><a href="/uri">link [bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example525Line8127LinkFooBarUri() async {
		let input = """

		[link *foo **bar** `#`*](/uri)

		"""

		let expected = """
		<p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example526Line8134Moonmoonjpguri() async {
		let input = """

		[![moon](moon.jpg)](/uri)

		"""

		let expected = """
		<p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example527Line8143FooBaruriuri() async {
		let input = """

		[foo [bar](/uri)](/uri)

		"""

		let expected = """
		<p>[foo <a href="/uri">bar</a>](/uri)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example528Line8150FooBarBazuriuriuri() async {
		let input = """

		[foo *[bar [baz](/uri)](/uri)*](/uri)

		"""

		let expected = """
		<p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example529Line8157Foouri1uri2uri3() async {
		let input = """

		![[[foo](uri1)](uri2)](uri3)

		"""

		let expected = """
		<p><img src="uri3" alt="[foo](uri2)" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example530Line8167Foouri() async {
		let input = """

		*[foo*](/uri)

		"""

		let expected = """
		<p>*<a href="/uri">foo*</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example531Line8174FooBarbaz() async {
		let input = """

		[foo *bar](baz*)

		"""

		let expected = """
		<p><a href="baz*">foo *bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	// TODO:
	/* @Test */ func example532Line8184FooBarBaz() async {
		let input = """

		*foo [bar* baz]

		"""

		let expected = """
		<p><em>foo [bar</em> baz]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example533Line8194FooBarAttrbaz() async {
		let input = """

		[foo <bar attr="](baz)">

		"""

		let expected = """
		<p>[foo <bar attr="](baz)"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example534Line8201Foouri() async {
		let input = """

		[foo`](/uri)`

		"""

		let expected = """
		<p>[foo<code>](/uri)</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example535Line8208Foohttpexamplecomsearchuri() async {
		let input = """

		[foo<http://example.com/?search=](uri)>

		"""

		let expected = """
		<p>[foo<a href="http://example.com/?search=%5D(uri)">http://example.com/?search=](uri)</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example536Line8246FoobarnnbarUrlTitle() async {
		let input = """

		[foo][bar]

		[bar]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example537Line8261LinkFooBarrefnnrefUri() async {
		let input = """

		[link [foo [bar]]][ref]

		[ref]: /uri

		"""

		let expected = """
		<p><a href="/uri">link [foo [bar]]</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example538Line8270LinkBarrefnnrefUri() async {
		let input = """

		[link \\[bar][ref]

		[ref]: /uri

		"""

		let expected = """
		<p><a href="/uri">link [bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example539Line8281LinkFooBarRefnnrefUri() async {
		let input = """

		[link *foo **bar** `#`*][ref]

		[ref]: /uri

		"""

		let expected = """
		<p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example540Line8290MoonmoonjpgrefnnrefUri() async {
		let input = """

		[![moon](moon.jpg)][ref]

		[ref]: /uri

		"""

		let expected = """
		<p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example541Line8301FooBarurirefnnrefUri() async {
		let input = """

		[foo [bar](/uri)][ref]

		[ref]: /uri

		"""

		let expected = """
		<p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example542Line8310FooBarBazrefrefnnrefUri() async {
		let input = """

		[foo *bar [baz][ref]*][ref]

		[ref]: /uri

		"""

		let expected = """
		<p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example543Line8325FoorefnnrefUri() async {
		let input = """

		*[foo*][ref]

		[ref]: /uri

		"""

		let expected = """
		<p>*<a href="/uri">foo*</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example544Line8334FooBarrefnnrefUri() async {
		let input = """

		[foo *bar][ref]

		[ref]: /uri

		"""

		let expected = """
		<p><a href="/uri">foo *bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example545Line8346FooBarAttrrefnnrefUri() async {
		let input = """

		[foo <bar attr="][ref]">

		[ref]: /uri

		"""

		let expected = """
		<p>[foo <bar attr="][ref]"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example546Line8355FoorefnnrefUri() async {
		let input = """

		[foo`][ref]`

		[ref]: /uri

		"""

		let expected = """
		<p>[foo<code>][ref]</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example547Line8364FoohttpexamplecomsearchrefnnrefUri() async {
		let input = """

		[foo<http://example.com/?search=][ref]>

		[ref]: /uri

		"""

		let expected = """
		<p>[foo<a href="http://example.com/?search=%5D%5Bref%5D">http://example.com/?search=][ref]</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example548Line8375FooBaRnnbarUrlTitle() async {
		let input = """

		[foo][BaR]

		[bar]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example549Line8386IsARussianWordnnUrl() async {
		let input = """

		[Толпой][Толпой] is a Russian word.

		[ТОЛПОЙ]: /url

		"""

		let expected = """
		<p><a href="/url">Толпой</a> is a Russian word.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example550Line8398FoonBarUrlnnBazFooBar() async {
		let input = """

		[Foo
		  bar]: /url

		[Baz][Foo bar]

		"""

		let expected = """
		<p><a href="/url">Baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example551Line8411FooBarnnbarUrlTitle() async {
		let input = """

		[foo] [bar]

		[bar]: /url "title"

		"""

		let expected = """
		<p>[foo] <a href="/url" title="title">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example552Line8420FoonbarnnbarUrlTitle() async {
		let input = """

		[foo]
		[bar]

		[bar]: /url "title"

		"""

		let expected = """
		<p>[foo]
		<a href="/url" title="title">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example553Line8461FooUrl1nnfooUrl2nnbarfoo() async {
		let input = """

		[foo]: /url1

		[foo]: /url2

		[bar][foo]

		"""

		let expected = """
		<p><a href="/url1">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example554Line8476BarfoonnfooUrl() async {
		let input = """

		[bar][foo\\!]

		[foo!]: /url

		"""

		let expected = """
		<p>[bar][foo!]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example555Line8488FoorefnnrefUri() async {
		let input = """

		[foo][ref[]

		[ref[]: /uri

		"""

		let expected = """
		<p>[foo][ref[]</p>
		<p>[ref[]: /uri</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example556Line8498FoorefbarnnrefbarUri() async {
		let input = """

		[foo][ref[bar]]

		[ref[bar]]: /uri

		"""

		let expected = """
		<p>[foo][ref[bar]]</p>
		<p>[ref[bar]]: /uri</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example557Line8508FoonnfooUrl() async {
		let input = """

		[[[foo]]]

		[[[foo]]]: /url

		"""

		let expected = """
		<p>[[[foo]]]</p>
		<p>[[[foo]]]: /url</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example558Line8518FoorefnnrefUri() async {
		let input = """

		[foo][ref\\[]

		[ref\\[]: /uri

		"""

		let expected = """
		<p><a href="/uri">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example559Line8529BarUrinnbar() async {
		let input = """

		[bar\\\\]: /uri

		[bar\\\\]

		"""

		let expected = """
		<p><a href="/uri">bar\\</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example560Line8540NnUri() async {
		let input = """

		[]

		[]: /uri

		"""

		let expected = """
		<p>[]</p>
		<p>[]: /uri</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example561Line8550NNnnUri() async {
		let input = """

		[
		 ]

		[
		 ]: /uri

		"""

		let expected = """
		<p>[
		]</p>
		<p>[
		]: /uri</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example562Line8573FoonnfooUrlTitle() async {
		let input = """

		[foo][]

		[foo]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example563Line8582FooBarnnfooBarUrlTitle() async {
		let input = """

		[*foo* bar][]

		[*foo* bar]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title"><em>foo</em> bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example564Line8593FoonnfooUrlTitle() async {
		let input = """

		[Foo][]

		[foo]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">Foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example565Line8606FooNnnfooUrlTitle() async {
		let input = """

		[foo] 
		[]

		[foo]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a>
		[]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example566Line8626FoonnfooUrlTitle() async {
		let input = """

		[foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example567Line8635FooBarnnfooBarUrlTitle() async {
		let input = """

		[*foo* bar]

		[*foo* bar]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title"><em>foo</em> bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example568Line8644FooBarnnfooBarUrlTitle() async {
		let input = """

		[[*foo* bar]]

		[*foo* bar]: /url "title"

		"""

		let expected = """
		<p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example569Line8653BarFoonnfooUrl() async {
		let input = """

		[[bar [foo]

		[foo]: /url

		"""

		let expected = """
		<p>[[bar <a href="/url">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example570Line8664FoonnfooUrlTitle() async {
		let input = """

		[Foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p><a href="/url" title="title">Foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example571Line8675FooBarnnfooUrl() async {
		let input = """

		[foo] bar

		[foo]: /url

		"""

		let expected = """
		<p><a href="/url">foo</a> bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example572Line8687FoonnfooUrlTitle() async {
		let input = """

		\\[foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p>[foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example573Line8699FooUrlnnfoo() async {
		let input = """

		[foo*]: /url

		*[foo*]

		"""

		let expected = """
		<p>*<a href="/url">foo*</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example574Line8711FoobarnnfooUrl1nbarUrl2() async {
		let input = """

		[foo][bar]

		[foo]: /url1
		[bar]: /url2

		"""

		let expected = """
		<p><a href="/url2">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example575Line8720FoonnfooUrl1() async {
		let input = """

		[foo][]

		[foo]: /url1

		"""

		let expected = """
		<p><a href="/url1">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example576Line8730FoonnfooUrl1() async {
		let input = """

		[foo]()

		[foo]: /url1

		"""

		let expected = """
		<p><a href="">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example577Line8738FoonotALinknnfooUrl1() async {
		let input = """

		[foo](not a link)

		[foo]: /url1

		"""

		let expected = """
		<p><a href="/url1">foo</a>(not a link)</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example578Line8749FoobarbaznnbazUrl() async {
		let input = """

		[foo][bar][baz]

		[baz]: /url

		"""

		let expected = """
		<p>[foo]<a href="/url">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example579Line8761FoobarbaznnbazUrl1nbarUrl2() async {
		let input = """

		[foo][bar][baz]

		[baz]: /url1
		[bar]: /url2

		"""

		let expected = """
		<p><a href="/url2">foo</a><a href="/url1">baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example580Line8774FoobarbaznnbazUrl1nfooUrl2() async {
		let input = """

		[foo][bar][baz]

		[baz]: /url1
		[foo]: /url2

		"""

		let expected = """
		<p>[foo]<a href="/url1">bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example581Line8797FoourlTitle() async {
		let input = """

		![foo](/url "title")

		"""

		let expected = """
		<p><img src="/url" alt="foo" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example582Line8804FooBarnnfooBarTrainjpgTrainTracks() async {
		let input = """

		![foo *bar*]

		[foo *bar*]: train.jpg "train & tracks"

		"""

		let expected = """
		<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example583Line8813FooBarurlurl2() async {
		let input = """

		![foo ![bar](/url)](/url2)

		"""

		let expected = """
		<p><img src="/url2" alt="foo bar" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example584Line8820FooBarurlurl2() async {
		let input = """

		![foo [bar](/url)](/url2)

		"""

		let expected = """
		<p><img src="/url2" alt="foo bar" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example585Line8834FooBarnnfooBarTrainjpgTrainTracks() async {
		let input = """

		![foo *bar*][]

		[foo *bar*]: train.jpg "train & tracks"

		"""

		let expected = """
		<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example586Line8843FooBarfoobarnnFOOBARTrainjpgTrainTracks() async {
		let input = """

		![foo *bar*][foobar]

		[FOOBAR]: train.jpg "train & tracks"

		"""

		let expected = """
		<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example587Line8852Footrainjpg() async {
		let input = """

		![foo](train.jpg)

		"""

		let expected = """
		<p><img src="train.jpg" alt="foo" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example588Line8859MyFooBarpathtotrainjpgTitle() async {
		let input = """

		My ![foo bar](/path/to/train.jpg  "title"   )

		"""

		let expected = """
		<p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example589Line8866Foourl() async {
		let input = """

		![foo](<url>)

		"""

		let expected = """
		<p><img src="url" alt="foo" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example590Line8873Url() async {
		let input = """

		![](/url)

		"""

		let expected = """
		<p><img src="/url" alt="" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example591Line8882FoobarnnbarUrl() async {
		let input = """

		![foo][bar]

		[bar]: /url

		"""

		let expected = """
		<p><img src="/url" alt="foo" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example592Line8891FoobarnnBARUrl() async {
		let input = """

		![foo][bar]

		[BAR]: /url

		"""

		let expected = """
		<p><img src="/url" alt="foo" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example593Line8902FoonnfooUrlTitle() async {
		let input = """

		![foo][]

		[foo]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="foo" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example594Line8911FooBarnnfooBarUrlTitle() async {
		let input = """

		![*foo* bar][]

		[*foo* bar]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="foo bar" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example595Line8922FoonnfooUrlTitle() async {
		let input = """

		![Foo][]

		[foo]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="Foo" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example596Line8934FooNnnfooUrlTitle() async {
		let input = """

		![foo] 
		[]

		[foo]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="foo" title="title" />
		[]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example597Line8947FoonnfooUrlTitle() async {
		let input = """

		![foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="foo" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example598Line8956FooBarnnfooBarUrlTitle() async {
		let input = """

		![*foo* bar]

		[*foo* bar]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="foo bar" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example599Line8967FoonnfooUrlTitle() async {
		let input = """

		![[foo]]

		[[foo]]: /url "title"

		"""

		let expected = """
		<p>![[foo]]</p>
		<p>[[foo]]: /url &quot;title&quot;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example600Line8979FoonnfooUrlTitle() async {
		let input = """

		![Foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p><img src="/url" alt="Foo" title="title" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example601Line8991FoonnfooUrlTitle() async {
		let input = """

		!\\[foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p>![foo]</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example602Line9003FoonnfooUrlTitle() async {
		let input = """

		\\![foo]

		[foo]: /url "title"

		"""

		let expected = """
		<p>!<a href="/url" title="title">foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example603Line9036Httpfoobarbaz() async {
		let input = """

		<http://foo.bar.baz>

		"""

		let expected = """
		<p><a href="http://foo.bar.baz">http://foo.bar.baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example604Line9043Httpfoobarbaztestqhelloid22boolean() async {
		let input = """

		<http://foo.bar.baz/test?q=hello&id=22&boolean>

		"""

		let expected = """
		<p><a href="http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean">http://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example605Line9050Ircfoobar2233baz() async {
		let input = """

		<irc://foo.bar:2233/baz>

		"""

		let expected = """
		<p><a href="irc://foo.bar:2233/baz">irc://foo.bar:2233/baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example606Line9059MAILTOFOOBARBAZ() async {
		let input = """

		<MAILTO:FOO@BAR.BAZ>

		"""

		let expected = """
		<p><a href="MAILTO:FOO@BAR.BAZ">MAILTO:FOO@BAR.BAZ</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example607Line9071Abcd() async {
		let input = """

		<a+b+c:d>

		"""

		let expected = """
		<p><a href="a+b+c:d">a+b+c:d</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example608Line9078MadeUpSchemefoobar() async {
		let input = """

		<made-up-scheme://foo,bar>

		"""

		let expected = """
		<p><a href="made-up-scheme://foo,bar">made-up-scheme://foo,bar</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example609Line9085Http() async {
		let input = """

		<http://../>

		"""

		let expected = """
		<p><a href="http://../">http://../</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example610Line9092Localhost5001foo() async {
		let input = """

		<localhost:5001/foo>

		"""

		let expected = """
		<p><a href="localhost:5001/foo">localhost:5001/foo</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example611Line9101HttpfoobarbazBim() async {
		let input = """

		<http://foo.bar/baz bim>

		"""

		let expected = """
		<p>&lt;http://foo.bar/baz bim&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example612Line9110Httpexamplecom() async {
		let input = """

		<http://example.com/\\[\\>

		"""

		let expected = """
		<p><a href="http://example.com/%5C%5B%5C">http://example.com/\\[\\</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example613Line9132Foobarexamplecom() async {
		let input = """

		<foo@bar.example.com>

		"""

		let expected = """
		<p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example614Line9139FoospecialBarbazBar0com() async {
		let input = """

		<foo+special@Bar.baz-bar0.com>

		"""

		let expected = """
		<p><a href="mailto:foo+special@Bar.baz-bar0.com">foo+special@Bar.baz-bar0.com</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example615Line9148Foobarexamplecom() async {
		let input = """

		<foo\\+@bar.example.com>

		"""

		let expected = """
		<p>&lt;foo+@bar.example.com&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example616Line9157() async {
		let input = """

		<>

		"""

		let expected = """
		<p>&lt;&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example617Line9164Httpfoobar() async {
		let input = """

		< http://foo.bar >

		"""

		let expected = """
		<p>&lt; http://foo.bar &gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example618Line9171Mabc() async {
		let input = """

		<m:abc>

		"""

		let expected = """
		<p>&lt;m:abc&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example619Line9178Foobarbaz() async {
		let input = """

		<foo.bar.baz>

		"""

		let expected = """
		<p>&lt;foo.bar.baz&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example620Line9185Httpexamplecom() async {
		let input = """

		http://example.com

		"""

		let expected = """
		<p><a href="http://example.com">http://example.com</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example621Line9192Foobarexamplecom() async {
		let input = """

		foo@bar.example.com

		"""

		let expected = """
		<p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example622Line9221Wwwcommonmarkorg() async {
		let input = """

		www.commonmark.org

		"""

		let expected = """
		<p><a href="http://www.commonmark.org">www.commonmark.org</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example623Line9229VisitWwwcommonmarkorghelpForMoreInformation() async {
		let input = """

		Visit www.commonmark.org/help for more information.

		"""

		let expected = """
		<p>Visit <a href="http://www.commonmark.org/help">www.commonmark.org/help</a> for more information.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example624Line9241VisitWwwcommonmarkorgnnVisitWwwcommonmarkorgab() async {
		let input = """

		Visit www.commonmark.org.

		Visit www.commonmark.org/a.b.

		"""

		let expected = """
		<p>Visit <a href="http://www.commonmark.org">www.commonmark.org</a>.</p>
		<p>Visit <a href="http://www.commonmark.org/a.b">www.commonmark.org/a.b</a>.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example625Line9255WwwgooglecomsearchqMarkupbusinessnnwwwgooglecomsearchqMarkupbusinessnnwwwgooglecomsearchqMarkupbusinessnnwwwgooglecomsearchqMarkupbusiness() async {
		let input = """

		www.google.com/search?q=Markup+(business)

		www.google.com/search?q=Markup+(business)))

		(www.google.com/search?q=Markup+(business))

		(www.google.com/search?q=Markup+(business)

		"""

		let expected = """
		<p><a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a></p>
		<p><a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a>))</p>
		<p>(<a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a>)</p>
		<p>(<a href="http://www.google.com/search?q=Markup+(business)">www.google.com/search?q=Markup+(business)</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example626Line9274Wwwgooglecomsearchqbusinessok() async {
		let input = """

		www.google.com/search?q=(business))+ok

		"""

		let expected = """
		<p><a href="http://www.google.com/search?q=(business))+ok">www.google.com/search?q=(business))+ok</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example627Line9285Wwwgooglecomsearchqcommonmarkhlennnwwwgooglecomsearchqcommonmarkhl() async {
		let input = """

		www.google.com/search?q=commonmark&hl=en

		www.google.com/search?q=commonmark&hl;

		"""

		let expected = """
		<p><a href="http://www.google.com/search?q=commonmark&amp;hl=en">www.google.com/search?q=commonmark&amp;hl=en</a></p>
		<p><a href="http://www.google.com/search?q=commonmark">www.google.com/search?q=commonmark</a>&amp;hl;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example628Line9296Wwwcommonmarkorghelp() async {
		let input = """

		www.commonmark.org/he<lp

		"""

		let expected = """
		<p><a href="http://www.commonmark.org/he">www.commonmark.org/he</a>&lt;lp</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example629Line9307HttpcommonmarkorgnnVisitHttpsencryptedgooglecomsearchqMarkupbusinessnnAnonymousFTPIsAvailableAtFtpfoobarbaz() async {
		let input = """

		http://commonmark.org

		(Visit https://encrypted.google.com/search?q=Markup+(business))

		Anonymous FTP is available at ftp://foo.bar.baz.

		"""

		let expected = """
		<p><a href="http://commonmark.org">http://commonmark.org</a></p>
		<p>(Visit <a href="https://encrypted.google.com/search?q=Markup+(business)">https://encrypted.google.com/search?q=Markup+(business)</a>)</p>
		<p>Anonymous FTP is available at <a href="ftp://foo.bar.baz">ftp://foo.bar.baz</a>.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example630Line9333Foobarbaz() async {
		let input = """

		foo@bar.baz

		"""

		let expected = """
		<p><a href="mailto:foo@bar.baz">foo@bar.baz</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example631Line9341HellomailxyzexampleIsntValidButHelloxyzmailexampleIs() async {
		let input = """

		hello@mail+xyz.example isn't valid, but hello+xyz@mail.example is.

		"""

		let expected = """
		<p>hello@mail+xyz.example isn't valid, but <a href="mailto:hello+xyz@mail.example">hello+xyz@mail.example</a> is.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example632Line9351AbCdabnnabCdabnnabCdabNnabCdab() async {
		let input = """

		a.b-c_d@a.b

		a.b-c_d@a.b.

		a.b-c_d@a.b-

		a.b-c_d@a.b_

		"""

		let expected = """
		<p><a href="mailto:a.b-c_d@a.b">a.b-c_d@a.b</a></p>
		<p><a href="mailto:a.b-c_d@a.b">a.b-c_d@a.b</a>.</p>
		<p>a.b-c_d@a.b-</p>
		<p>a.b-c_d@a.b_</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example633Line9375MailtofoobarbaznnmailtoabCdabnnmailtoabCdabnnmailtoabCdabnnmailtoabCdabNnmailtoabCdabnnxmppfoobarbaznnxmppfoobarbaz() async {
		let input = """

		mailto:foo@bar.baz

		mailto:a.b-c_d@a.b

		mailto:a.b-c_d@a.b.

		mailto:a.b-c_d@a.b/

		mailto:a.b-c_d@a.b-

		mailto:a.b-c_d@a.b_

		xmpp:foo@bar.baz

		xmpp:foo@bar.baz.

		"""

		let expected = """
		<p><a href="mailto:foo@bar.baz">mailto:foo@bar.baz</a></p>
		<p><a href="mailto:a.b-c_d@a.b">mailto:a.b-c_d@a.b</a></p>
		<p><a href="mailto:a.b-c_d@a.b">mailto:a.b-c_d@a.b</a>.</p>
		<p><a href="mailto:a.b-c_d@a.b">mailto:a.b-c_d@a.b</a>/</p>
		<p>mailto:a.b-c_d@a.b-</p>
		<p>mailto:a.b-c_d@a.b_</p>
		<p><a href="xmpp:foo@bar.baz">xmpp:foo@bar.baz</a></p>
		<p><a href="xmpp:foo@bar.baz">xmpp:foo@bar.baz</a>.</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example634Line9406Xmppfoobarbaztxtnnxmppfoobarbaztxtbinnnxmppfoobarbaztxtbincom() async {
		let input = """

		xmpp:foo@bar.baz/txt

		xmpp:foo@bar.baz/txt@bin

		xmpp:foo@bar.baz/txt@bin.com

		"""

		let expected = """
		<p><a href="xmpp:foo@bar.baz/txt">xmpp:foo@bar.baz/txt</a></p>
		<p><a href="xmpp:foo@bar.baz/txt@bin">xmpp:foo@bar.baz/txt@bin</a></p>
		<p><a href="xmpp:foo@bar.baz/txt@bin.com">xmpp:foo@bar.baz/txt@bin.com</a></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example635Line9420Xmppfoobarbaztxtbin() async {
		let input = """

		xmpp:foo@bar.baz/txt/bin

		"""

		let expected = """
		<p><a href="xmpp:foo@bar.baz/txt">xmpp:foo@bar.baz/txt</a>/bin</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example636Line9502Ababc2c() async {
		let input = """

		<a><bab><c2c>

		"""

		let expected = """
		<p><a><bab><c2c></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example637Line9511Ab2() async {
		let input = """

		<a/><b2/>

		"""

		let expected = """
		<p><a/><b2/></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example638Line9520AB2ndatafoo() async {
		let input = """

		<a  /><b2
		data="foo" >

		"""

		let expected = """
		<p><a  /><b2
		data="foo" ></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example639Line9531AFoobarBamBazEmemnbooleanZoop33zoop33() async {
		let input = """

		<a foo="bar" bam = 'baz <em>"</em>'
		_boolean zoop:33=zoop:33 />

		"""

		let expected = """
		<p><a foo="bar" bam = 'baz <em>"</em>'
		_boolean zoop:33=zoop:33 /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example640Line9542FooResponsiveImageSrcfoojpg() async {
		let input = """

		Foo <responsive-image src="foo.jpg" />

		"""

		let expected = """
		<p>Foo <responsive-image src="foo.jpg" /></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example641Line955133() async {
		let input = """

		<33> <__>

		"""

		let expected = """
		<p>&lt;33&gt; &lt;__&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example642Line9560AHrefhi() async {
		let input = """

		<a h*#ref="hi">

		"""

		let expected = """
		<p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example643Line9569AHrefhiAHrefhi() async {
		let input = """

		<a href="hi'> <a href=hi'>

		"""

		let expected = """
		<p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example644Line9578AnfoobarNfooBarbaznbimbop() async {
		let input = """

		< a><
		foo><bar/ >
		<foo bar=baz
		bim!bop />

		"""

		let expected = """
		<p>&lt; a&gt;&lt;
		foo&gt;&lt;bar/ &gt;
		&lt;foo bar=baz
		bim!bop /&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example645Line9593AHrefbartitletitle() async {
		let input = """

		<a href='bar'title=title>

		"""

		let expected = """
		<p>&lt;a href='bar'title=title&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example646Line9602Afoo() async {
		let input = """

		</a></foo >

		"""

		let expected = """
		<p></a></foo ></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example647Line9611AHreffoo() async {
		let input = """

		</a href="foo">

		"""

		let expected = """
		<p>&lt;/a href=&quot;foo&quot;&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example648Line9620FooThisIsANcommentWithHyphens() async {
		let input = """

		foo <!-- this is a --
		comment - with hyphens -->

		"""

		let expected = """
		<p>foo <!-- this is a --
		comment - with hyphens --></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example649Line9628FooThisIsANcommentWithHyphens() async {
		let input = """

		foo <!-- this is a --
		comment - with hyphens -->

		"""

		let expected = """
		<p>foo <!-- this is a --
		comment - with hyphens --></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example650Line9636FooFooNnfooFoo() async {
		let input = """

		foo <!--> foo -->

		foo <!---> foo -->

		"""

		let expected = """
		<p>foo <!--> foo --&gt;</p>
		<p>foo <!---> foo --&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example651Line9648FooPhpEchoA() async {
		let input = """

		foo <?php echo $a; ?>

		"""

		let expected = """
		<p>foo <?php echo $a; ?></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example652Line9657FooELEMENTBrEMPTY() async {
		let input = """

		foo <!ELEMENT br EMPTY>

		"""

		let expected = """
		<p>foo <!ELEMENT br EMPTY></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example653Line9666FooCDATA() async {
		let input = """

		foo <![CDATA[>&<]]>

		"""

		let expected = """
		<p>foo <![CDATA[>&<]]></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example654Line9676FooAHrefouml() async {
		let input = """

		foo <a href="&ouml;">

		"""

		let expected = """
		<p>foo <a href="&ouml;"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example655Line9685FooAHref() async {
		let input = """

		foo <a href="\\*">

		"""

		let expected = """
		<p>foo <a href="\\*"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example656Line9692AHref() async {
		let input = """

		<a href="\\"">

		"""

		let expected = """
		<p>&lt;a href=&quot;&quot;&quot;&gt;</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	// TODO:
	/* @Test */ func example657Line9723StrongTitleStyleEmnnblockquotenXmpIsDisallowedXMPIsAlsoDisallowednblockquote() async {
		let input = """

		<strong> <title> <style> <em>

		<blockquote>
		  <xmp> is disallowed.  <XMP> is also disallowed.
		</blockquote>

		"""

		let expected = """
		<p><strong> &lt;title> &lt;style> <em></p>
		<blockquote>
		  &lt;xmp> is disallowed.  &lt;XMP> is also disallowed.
		</blockquote>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example658Line9745FooNbaz() async {
		let input = """

		foo  
		baz

		"""

		let expected = """
		<p>foo<br />
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example659Line9757Foonbaz() async {
		let input = """

		foo\\
		baz

		"""

		let expected = """
		<p>foo<br />
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example660Line9768FooNbaz() async {
		let input = """

		foo       
		baz

		"""

		let expected = """
		<p>foo<br />
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example661Line9779FooNBar() async {
		let input = """

		foo  
		     bar

		"""

		let expected = """
		<p>foo<br />
		bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example662Line9788FoonBar() async {
		let input = """

		foo\\
		     bar

		"""

		let expected = """
		<p>foo<br />
		bar</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example663Line9800FooNbar() async {
		let input = """

		*foo  
		bar*

		"""

		let expected = """
		<p><em>foo<br />
		bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example664Line9809Foonbar() async {
		let input = """

		*foo\\
		bar*

		"""

		let expected = """
		<p><em>foo<br />
		bar</em></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example665Line9820CodeNspan() async {
		let input = """

		`code  
		span`

		"""

		let expected = """
		<p><code>code   span</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example666Line9828Codenspan() async {
		let input = """

		`code\\
		span`

		"""

		let expected = """
		<p><code>code\\ span</code></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example667Line9838AHreffooNbar() async {
		let input = """

		<a href="foo  
		bar">

		"""

		let expected = """
		<p><a href="foo  
		bar"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example668Line9847AHreffoonbar() async {
		let input = """

		<a href="foo\\
		bar">

		"""

		let expected = """
		<p><a href="foo\\
		bar"></p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example669Line9860Foo() async {
		let input = """

		foo\\

		"""

		let expected = """
		<p>foo\\</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example670Line9867Foo() async {
		let input = """

		foo  

		"""

		let expected = """
		<p>foo</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example671Line9874Foo() async {
		let input = """

		### foo\\

		"""

		let expected = """
		<h3>foo\\</h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example672Line9881Foo() async {
		let input = """

		### foo  

		"""

		let expected = """
		<h3>foo</h3>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example673Line9896Foonbaz() async {
		let input = """

		foo
		baz

		"""

		let expected = """
		<p>foo
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example674Line9908FooNBaz() async {
		let input = """

		foo 
		 baz

		"""

		let expected = """
		<p>foo
		baz</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example675Line9928HelloThere() async {
		let input = """

		hello $.;'there

		"""

		let expected = """
		<p>hello $.;'there</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example676Line9935Foo() async {
		let input = """

		Foo χρῆν

		"""

		let expected = """
		<p>Foo χρῆν</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}

	@Test func example677Line9944MultipleSpaces() async {
		let input = """

		Multiple     spaces

		"""

		let expected = """
		<p>Multiple     spaces</p>

		"""

		await MainActor.run {
			let htmlSpaced = _transform(src: input, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlSpaced == expected)

			let inputTrimmed = String(input[input.index(after: input.startIndex) ..< input.index(before: input.endIndex)])
			let htmlTrimmed = _transform(src: inputTrimmed, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlTrimmed == expected)

			let inputCrLf = input.replacingOccurrences(of: "\n", with: "\r\n")
			let htmlCrLf = _transform(src: inputCrLf, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCrLf.replacingOccurrences(of: "\r\n", with: "\n") == expected)

			let inputCr = input.replacingOccurrences(of: "\n", with: "\r")
			let htmlCr = _transform(src: inputCr, rules: gfmRuleSet, renderers: htmlRenderers)
			#expect(htmlCr.replacingOccurrences(of: "\r", with: "\n") == expected)
		}
	}
}

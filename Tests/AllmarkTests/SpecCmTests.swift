import Testing
@testable import Allmark

struct SpecCmTests {
	@Test func example1() async {
		let input = """
	foo	baz		bim
"""
		let expected = """
<pre><code>foo	baz		bim
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example2() async {
		let input = """
  	foo	baz		bim
"""
		let expected = """
<pre><code>foo	baz		bim
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example3() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example4() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example5() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example6() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example7() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example8() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example9() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example10() async {
		let input = """
#	Foo
"""
		let expected = """
<h1>Foo</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example11() async {
		let input = """
*	*	*	
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example12() async {
		let input = """
\\!\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~
"""
		let expected = """
<p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example13() async {
		let input = """
\\	\\A\\a\\ \\3\\φ\\«
"""
		let expected = """
<p>\\	\\A\\a\\ \\3\\φ\\«</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example14() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example15() async {
		let input = """
\\\\*emphasis*
"""
		let expected = """
<p>\\<em>emphasis</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example16() async {
		let input = """
foo\\
bar
"""
		let expected = """
<p>foo<br />
bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example17() async {
		let input = """
`` \\[\\` ``
"""
		let expected = """
<p><code>\\[\\`</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example18() async {
		let input = """
    \\[\\]
"""
		let expected = """
<pre><code>\\[\\]
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example19() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example20() async {
		let input = """
<https://example.com?find=\\*>
"""
		let expected = """
<p><a href="https://example.com?find=%5C*">https://example.com?find=\\*</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example21() async {
		let input = """
<a href="/bar\\/)">
"""
		let expected = """
<a href="/bar\\/)">
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example22() async {
		let input = """
[foo](/bar\\* "ti\\*tle")
"""
		let expected = """
<p><a href="/bar*" title="ti*tle">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example23() async {
		let input = """
[foo]

[foo]: /bar\\* "ti\\*tle"
"""
		let expected = """
<p><a href="/bar*" title="ti*tle">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example24() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example25() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example26() async {
		let input = """
&#35; &#1234; &#992; &#0;
"""
		let expected = """
<p># Ӓ Ϡ �</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example27() async {
		let input = """
&#X22; &#XD06; &#xcab;
"""
		let expected = """
<p>&quot; ആ ಫ</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example28() async {
		let input = """
&nbsp &x; &#; &#x;
&#87654321;
&#abcdef0;
&ThisIsNotDefined; &hi?;
"""
		let expected = """
<p>&amp;nbsp &amp;x; &amp;#; &amp;#x;
&amp;#87654321;
&amp;#abcdef0;
&amp;ThisIsNotDefined; &amp;hi?;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example29() async {
		let input = """
&copy
"""
		let expected = """
<p>&amp;copy</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example30() async {
		let input = """
&MadeUpEntity;
"""
		let expected = """
<p>&amp;MadeUpEntity;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example31() async {
		let input = """
<a href="&ouml;&ouml;.html">
"""
		let expected = """
<a href="&ouml;&ouml;.html">
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example32() async {
		let input = """
[foo](/f&ouml;&ouml; "f&ouml;&ouml;")
"""
		let expected = """
<p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example33() async {
		let input = """
[foo]

[foo]: /f&ouml;&ouml; "f&ouml;&ouml;"
"""
		let expected = """
<p><a href="/f%C3%B6%C3%B6" title="föö">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example34() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example35() async {
		let input = """
`f&ouml;&ouml;`
"""
		let expected = """
<p><code>f&amp;ouml;&amp;ouml;</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example36() async {
		let input = """
    f&ouml;f&ouml;
"""
		let expected = """
<pre><code>f&amp;ouml;f&amp;ouml;
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example37() async {
		let input = """
&#42;foo&#42;
*foo*
"""
		let expected = """
<p>*foo*
<em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example38() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example39() async {
		let input = """
foo&#10;&#10;bar
"""
		let expected = """
<p>foo

bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example40() async {
		let input = """
&#9;foo
"""
		let expected = """
<p>	foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example41() async {
		let input = """
[a](url &quot;tit&quot;)
"""
		let expected = """
<p>[a](url &quot;tit&quot;)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example42() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example43() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example44() async {
		let input = """
+++
"""
		let expected = """
<p>+++</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example45() async {
		let input = """
===
"""
		let expected = """
<p>===</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example46() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example47() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example48() async {
		let input = """
    ***
"""
		let expected = """
<pre><code>***
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example49() async {
		let input = """
Foo
    ***
"""
		let expected = """
<p>Foo
***</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example50() async {
		let input = """
_____________________________________
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example51() async {
		let input = """
 - - -
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example52() async {
		let input = """
 **  * ** * ** * **
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example53() async {
		let input = """
-     -      -      -
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example54() async {
		let input = """
- - - -    
"""
		let expected = """
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example55() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example56() async {
		let input = """
 *-*
"""
		let expected = """
<p><em>-</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example57() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example58() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example59() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example60() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example61() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example62() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example63() async {
		let input = """
####### foo
"""
		let expected = """
<p>####### foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example64() async {
		let input = """
#5 bolt

#hashtag
"""
		let expected = """
<p>#5 bolt</p>
<p>#hashtag</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example65() async {
		let input = """
\\## foo
"""
		let expected = """
<p>## foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example66() async {
		let input = """
# foo *bar* \\*baz\\*
"""
		let expected = """
<h1>foo <em>bar</em> *baz*</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example67() async {
		let input = """
#                  foo                     
"""
		let expected = """
<h1>foo</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example68() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example69() async {
		let input = """
    # foo
"""
		let expected = """
<pre><code># foo
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example70() async {
		let input = """
foo
    # bar
"""
		let expected = """
<p>foo
# bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example71() async {
		let input = """
## foo ##
  ###   bar    ###
"""
		let expected = """
<h2>foo</h2>
<h3>bar</h3>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example72() async {
		let input = """
# foo ##################################
##### foo ##
"""
		let expected = """
<h1>foo</h1>
<h5>foo</h5>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example73() async {
		let input = """
### foo ###     
"""
		let expected = """
<h3>foo</h3>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example74() async {
		let input = """
### foo ### b
"""
		let expected = """
<h3>foo ### b</h3>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example75() async {
		let input = """
# foo#
"""
		let expected = """
<h1>foo#</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example76() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example77() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example78() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example79() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example80() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example81() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example82() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example83() async {
		let input = """
Foo
-------------------------

Foo
=
"""
		let expected = """
<h2>Foo</h2>
<h1>Foo</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example84() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example85() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example86() async {
		let input = """
Foo
   ----      
"""
		let expected = """
<h2>Foo</h2>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example87() async {
		let input = """
Foo
    ---
"""
		let expected = """
<p>Foo
---</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example88() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example89() async {
		let input = """
Foo  
-----
"""
		let expected = """
<h2>Foo</h2>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example90() async {
		let input = """
Foo\\
----
"""
		let expected = """
<h2>Foo\\</h2>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example91() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example92() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example93() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example94() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example95() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example96() async {
		let input = """
---
Foo
---
Bar
---
Baz
"""
		let expected = """
<hr />
<h2>Foo</h2>
<h2>Bar</h2>
<p>Baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example97() async {
		let input = """

====
"""
		let expected = """
<p>====</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example98() async {
		let input = """
---
---
"""
		let expected = """
<hr />
<hr />
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example99() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example100() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example101() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example102() async {
		let input = """
\\> foo
------
"""
		let expected = """
<h2>&gt; foo</h2>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example103() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example104() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example105() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example106() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example107() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example108() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example109() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example110() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example111() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example112() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example113() async {
		let input = """
Foo
    bar

"""
		let expected = """
<p>Foo
bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example114() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example115() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example116() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example117() async {
		let input = """

    
    foo
    

"""
		let expected = """
<pre><code>foo
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example118() async {
		let input = """
    foo  
"""
		let expected = """
<pre><code>foo  
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example119() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example120() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example121() async {
		let input = """
``
foo
``
"""
		let expected = """
<p><code>foo</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example122() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example123() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example124() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example125() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example126() async {
		let input = """
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

	@Test func example127() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example128() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example129() async {
		let input = """
```

  
```
"""
		let expected = """
<pre><code>
  
</code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example130() async {
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

	@Test func example131() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example132() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example133() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example134() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example135() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example136() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example137() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example138() async {
		let input = """
``` ```
aaa
"""
		let expected = """
<p><code> </code>
aaa</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example139() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example140() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example141() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example142() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example143() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example144() async {
		let input = """
```;
````
"""
		let expected = """
<pre><code class="language-;"></code></pre>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example145() async {
		let input = """
``` aa ```
foo
"""
		let expected = """
<p><code>aa</code>
foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example146() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example147() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example148() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example149() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example150() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example151() async {
		let input = """
</div>
*foo*
"""
		let expected = """
</div>
*foo*
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example152() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example153() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example154() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example155() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example156() async {
		let input = """
<div id="foo"
*hi*
"""
		let expected = """
<div id="foo"
*hi*
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example157() async {
		let input = """
<div class
foo
"""
		let expected = """
<div class
foo
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example158() async {
		let input = """
<div *???-&&&-<---
*foo*
"""
		let expected = """
<div *???-&&&-<---
*foo*
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example159() async {
		let input = """
<div><a href="bar">*foo*</a></div>
"""
		let expected = """
<div><a href="bar">*foo*</a></div>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example160() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example161() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example162() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example163() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example164() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example165() async {
		let input = """
</ins>
*bar*
"""
		let expected = """
</ins>
*bar*
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example166() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example167() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example168() async {
		let input = """
<del>*foo*</del>
"""
		let expected = """
<p><del><em>foo</em></del></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example169() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example170() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example171() async {
		let input = """
<textarea>

*foo*

_bar_

</textarea>
"""
		let expected = """
<textarea>

*foo*

_bar_

</textarea>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example172() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example173() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example174() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example175() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example176() async {
		let input = """
<style>p{color:red;}</style>
*foo*
"""
		let expected = """
<style>p{color:red;}</style>
<p><em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example177() async {
		let input = """
<!-- foo -->*bar*
*baz*
"""
		let expected = """
<!-- foo -->*bar*
<p><em>baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example178() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example179() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example180() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example181() async {
		let input = """
<!DOCTYPE html>
"""
		let expected = """
<!DOCTYPE html>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example182() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example183() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example184() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example185() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example186() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example187() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example188() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example189() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example190() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example191() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example192() async {
		let input = """
[foo]: /url "title"

[foo]
"""
		let expected = """
<p><a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example193() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example194() async {
		let input = """
[Foo*bar\\]]:my_(url) 'title (with parens)'

[Foo*bar\\]]
"""
		let expected = """
<p><a href="my_(url)" title="title (with parens)">Foo*bar]</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example195() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example196() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example197() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example198() async {
		let input = """
[foo]:
/url

[foo]
"""
		let expected = """
<p><a href="/url">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example199() async {
		let input = """
[foo]:

[foo]
"""
		let expected = """
<p>[foo]:</p>
<p>[foo]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example200() async {
		let input = """
[foo]: <>

[foo]
"""
		let expected = """
<p><a href="">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example201() async {
		let input = """
[foo]: <bar>(baz)

[foo]
"""
		let expected = """
<p>[foo]: <bar>(baz)</p>
<p>[foo]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example202() async {
		let input = """
[foo]: /url\\bar\\*baz "foo\\"bar\\baz"

[foo]
"""
		let expected = """
<p><a href="/url%5Cbar*baz" title="foo&quot;bar\\baz">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example203() async {
		let input = """
[foo]

[foo]: url
"""
		let expected = """
<p><a href="url">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example204() async {
		let input = """
[foo]

[foo]: first
[foo]: second
"""
		let expected = """
<p><a href="first">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example205() async {
		let input = """
[FOO]: /url

[Foo]
"""
		let expected = """
<p><a href="/url">Foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example206() async {
		let input = """
[ΑΓΩ]: /φου

[αγω]
"""
		let expected = """
<p><a href="/%CF%86%CE%BF%CF%85">αγω</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example207() async {
		let input = """
[foo]: /url
"""
		let expected = """

"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example208() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example209() async {
		let input = """
[foo]: /url "title" ok
"""
		let expected = """
<p>[foo]: /url &quot;title&quot; ok</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example210() async {
		let input = """
[foo]: /url
"title" ok
"""
		let expected = """
<p>&quot;title&quot; ok</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example211() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example212() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example213() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example214() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example215() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example216() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example217() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example218() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example219() async {
		let input = """
aaa

bbb
"""
		let expected = """
<p>aaa</p>
<p>bbb</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example220() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example221() async {
		let input = """
aaa


bbb
"""
		let expected = """
<p>aaa</p>
<p>bbb</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example222() async {
		let input = """
  aaa
 bbb
"""
		let expected = """
<p>aaa
bbb</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example223() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example224() async {
		let input = """
   aaa
bbb
"""
		let expected = """
<p>aaa
bbb</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example225() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example226() async {
		let input = """
aaa     
bbb     
"""
		let expected = """
<p>aaa<br />
bbb</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example227() async {
		let input = """
  

aaa
  

# aaa

  
"""
		let expected = """
<p>aaa</p>
<h1>aaa</h1>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example228() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example229() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example230() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example231() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example232() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example233() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example234() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example235() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example236() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example237() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example238() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example239() async {
		let input = """
>
"""
		let expected = """
<blockquote>
</blockquote>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example240() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example241() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example242() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example243() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example244() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example245() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example246() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example247() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example248() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example249() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example250() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example251() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example252() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example253() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example254() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example255() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example256() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example257() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example258() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example259() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example260() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example261() async {
		let input = """
-one

2.two
"""
		let expected = """
<p>-one</p>
<p>2.two</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example262() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example263() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example264() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example265() async {
		let input = """
123456789. ok
"""
		let expected = """
<ol start="123456789">
<li>ok</li>
</ol>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example266() async {
		let input = """
1234567890. not ok
"""
		let expected = """
<p>1234567890. not ok</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example267() async {
		let input = """
0. ok
"""
		let expected = """
<ol start="0">
<li>ok</li>
</ol>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example268() async {
		let input = """
003. ok
"""
		let expected = """
<ol start="3">
<li>ok</li>
</ol>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example269() async {
		let input = """
-1. not ok
"""
		let expected = """
<p>-1. not ok</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example270() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example271() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example272() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example273() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example274() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example275() async {
		let input = """
   foo

bar
"""
		let expected = """
<p>foo</p>
<p>bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example276() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example277() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example278() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example279() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example280() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example281() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example282() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example283() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example284() async {
		let input = """
*
"""
		let expected = """
<ul>
<li></li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example285() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example286() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example287() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example288() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example289() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example290() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example291() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example292() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example293() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example294() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example295() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example296() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example297() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example298() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example299() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example300() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example301() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example302() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example303() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example304() async {
		let input = """
The number of windows in my house is
14.  The number of doors is 6.
"""
		let expected = """
<p>The number of windows in my house is
14.  The number of doors is 6.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example305() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example306() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example307() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example308() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example309() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example310() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example311() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example312() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example313() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example314() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example315() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example316() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example317() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example318() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example319() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example320() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example321() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example322() async {
		let input = """
- a
"""
		let expected = """
<ul>
<li>a</li>
</ul>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example323() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example324() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example325() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example326() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example327() async {
		let input = """
`hi`lo`
"""
		let expected = """
<p><code>hi</code>lo`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example328() async {
		let input = """
`foo`
"""
		let expected = """
<p><code>foo</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example329() async {
		let input = """
`` foo ` bar ``
"""
		let expected = """
<p><code>foo ` bar</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example330() async {
		let input = """
` `` `
"""
		let expected = """
<p><code>``</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example331() async {
		let input = """
`  ``  `
"""
		let expected = """
<p><code> `` </code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example332() async {
		let input = """
` a`
"""
		let expected = """
<p><code> a</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example333() async {
		let input = """
` b `
"""
		let expected = """
<p><code> b </code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example334() async {
		let input = """
` `
`  `
"""
		let expected = """
<p><code> </code>
<code>  </code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example335() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example336() async {
		let input = """
``
foo 
``
"""
		let expected = """
<p><code>foo </code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example337() async {
		let input = """
`foo   bar 
baz`
"""
		let expected = """
<p><code>foo   bar  baz</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example338() async {
		let input = """
`foo\\`bar`
"""
		let expected = """
<p><code>foo\\</code>bar`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example339() async {
		let input = """
``foo`bar``
"""
		let expected = """
<p><code>foo`bar</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example340() async {
		let input = """
` foo `` bar `
"""
		let expected = """
<p><code>foo `` bar</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example341() async {
		let input = """
*foo`*`
"""
		let expected = """
<p>*foo<code>*</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example342() async {
		let input = """
[not a `link](/foo`)
"""
		let expected = """
<p>[not a <code>link](/foo</code>)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example343() async {
		let input = """
`<a href="`">`
"""
		let expected = """
<p><code>&lt;a href=&quot;</code>&quot;&gt;`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example344() async {
		let input = """
<a href="`">`
"""
		let expected = """
<p><a href="`">`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example345() async {
		let input = """
`<https://foo.bar.`baz>`
"""
		let expected = """
<p><code>&lt;https://foo.bar.</code>baz&gt;`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example346() async {
		let input = """
<https://foo.bar.`baz>`
"""
		let expected = """
<p><a href="https://foo.bar.%60baz">https://foo.bar.`baz</a>`</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example347() async {
		let input = """
```foo``
"""
		let expected = """
<p>```foo``</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example348() async {
		let input = """
`foo
"""
		let expected = """
<p>`foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example349() async {
		let input = """
`foo``bar``
"""
		let expected = """
<p>`foo<code>bar</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example350() async {
		let input = """
*foo bar*
"""
		let expected = """
<p><em>foo bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example351() async {
		let input = """
a * foo bar*
"""
		let expected = """
<p>a * foo bar*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example352() async {
		let input = """
a*"foo"*
"""
		let expected = """
<p>a*&quot;foo&quot;*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example353() async {
		let input = """
* a *
"""
		let expected = """
<p>* a *</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example354() async {
		let input = """
*$*alpha.

*£*bravo.

*€*charlie.
"""
		let expected = """
<p>*$*alpha.</p>
<p>*£*bravo.</p>
<p>*€*charlie.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example355() async {
		let input = """
foo*bar*
"""
		let expected = """
<p>foo<em>bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example356() async {
		let input = """
5*6*78
"""
		let expected = """
<p>5<em>6</em>78</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example357() async {
		let input = """
_foo bar_
"""
		let expected = """
<p><em>foo bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example358() async {
		let input = """
_ foo bar_
"""
		let expected = """
<p>_ foo bar_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example359() async {
		let input = """
a_"foo"_
"""
		let expected = """
<p>a_&quot;foo&quot;_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example360() async {
		let input = """
foo_bar_
"""
		let expected = """
<p>foo_bar_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example361() async {
		let input = """
5_6_78
"""
		let expected = """
<p>5_6_78</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example362() async {
		let input = """
пристаням_стремятся_
"""
		let expected = """
<p>пристаням_стремятся_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example363() async {
		let input = """
aa_"bb"_cc
"""
		let expected = """
<p>aa_&quot;bb&quot;_cc</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example364() async {
		let input = """
foo-_(bar)_
"""
		let expected = """
<p>foo-<em>(bar)</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example365() async {
		let input = """
_foo*
"""
		let expected = """
<p>_foo*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example366() async {
		let input = """
*foo bar *
"""
		let expected = """
<p>*foo bar *</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example367() async {
		let input = """
*foo bar
*
"""
		let expected = """
<p>*foo bar
*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example368() async {
		let input = """
*(*foo)
"""
		let expected = """
<p>*(*foo)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example369() async {
		let input = """
*(*foo*)*
"""
		let expected = """
<p><em>(<em>foo</em>)</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example370() async {
		let input = """
*foo*bar
"""
		let expected = """
<p><em>foo</em>bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example371() async {
		let input = """
_foo bar _
"""
		let expected = """
<p>_foo bar _</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example372() async {
		let input = """
_(_foo)
"""
		let expected = """
<p>_(_foo)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example373() async {
		let input = """
_(_foo_)_
"""
		let expected = """
<p><em>(<em>foo</em>)</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example374() async {
		let input = """
_foo_bar
"""
		let expected = """
<p>_foo_bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example375() async {
		let input = """
_пристаням_стремятся
"""
		let expected = """
<p>_пристаням_стремятся</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example376() async {
		let input = """
_foo_bar_baz_
"""
		let expected = """
<p><em>foo_bar_baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example377() async {
		let input = """
_(bar)_.
"""
		let expected = """
<p><em>(bar)</em>.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example378() async {
		let input = """
**foo bar**
"""
		let expected = """
<p><strong>foo bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example379() async {
		let input = """
** foo bar**
"""
		let expected = """
<p>** foo bar**</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example380() async {
		let input = """
a**"foo"**
"""
		let expected = """
<p>a**&quot;foo&quot;**</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example381() async {
		let input = """
foo**bar**
"""
		let expected = """
<p>foo<strong>bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example382() async {
		let input = """
__foo bar__
"""
		let expected = """
<p><strong>foo bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example383() async {
		let input = """
__ foo bar__
"""
		let expected = """
<p>__ foo bar__</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example384() async {
		let input = """
__
foo bar__
"""
		let expected = """
<p>__
foo bar__</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example385() async {
		let input = """
a__"foo"__
"""
		let expected = """
<p>a__&quot;foo&quot;__</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example386() async {
		let input = """
foo__bar__
"""
		let expected = """
<p>foo__bar__</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example387() async {
		let input = """
5__6__78
"""
		let expected = """
<p>5__6__78</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example388() async {
		let input = """
пристаням__стремятся__
"""
		let expected = """
<p>пристаням__стремятся__</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example389() async {
		let input = """
__foo, __bar__, baz__
"""
		let expected = """
<p><strong>foo, <strong>bar</strong>, baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example390() async {
		let input = """
foo-__(bar)__
"""
		let expected = """
<p>foo-<strong>(bar)</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example391() async {
		let input = """
**foo bar **
"""
		let expected = """
<p>**foo bar **</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example392() async {
		let input = """
**(**foo)
"""
		let expected = """
<p>**(**foo)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example393() async {
		let input = """
*(**foo**)*
"""
		let expected = """
<p><em>(<strong>foo</strong>)</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example394() async {
		let input = """
**Gomphocarpus (*Gomphocarpus physocarpus*, syn.
*Asclepias physocarpa*)**
"""
		let expected = """
<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.
<em>Asclepias physocarpa</em>)</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example395() async {
		let input = """
**foo "*bar*" foo**
"""
		let expected = """
<p><strong>foo &quot;<em>bar</em>&quot; foo</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example396() async {
		let input = """
**foo**bar
"""
		let expected = """
<p><strong>foo</strong>bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example397() async {
		let input = """
__foo bar __
"""
		let expected = """
<p>__foo bar __</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example398() async {
		let input = """
__(__foo)
"""
		let expected = """
<p>__(__foo)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example399() async {
		let input = """
_(__foo__)_
"""
		let expected = """
<p><em>(<strong>foo</strong>)</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example400() async {
		let input = """
__foo__bar
"""
		let expected = """
<p>__foo__bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example401() async {
		let input = """
__пристаням__стремятся
"""
		let expected = """
<p>__пристаням__стремятся</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example402() async {
		let input = """
__foo__bar__baz__
"""
		let expected = """
<p><strong>foo__bar__baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example403() async {
		let input = """
__(bar)__.
"""
		let expected = """
<p><strong>(bar)</strong>.</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example404() async {
		let input = """
*foo [bar](/url)*
"""
		let expected = """
<p><em>foo <a href="/url">bar</a></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example405() async {
		let input = """
*foo
bar*
"""
		let expected = """
<p><em>foo
bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example406() async {
		let input = """
_foo __bar__ baz_
"""
		let expected = """
<p><em>foo <strong>bar</strong> baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example407() async {
		let input = """
_foo _bar_ baz_
"""
		let expected = """
<p><em>foo <em>bar</em> baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example408() async {
		let input = """
__foo_ bar_
"""
		let expected = """
<p><em><em>foo</em> bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example409() async {
		let input = """
*foo *bar**
"""
		let expected = """
<p><em>foo <em>bar</em></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example410() async {
		let input = """
*foo **bar** baz*
"""
		let expected = """
<p><em>foo <strong>bar</strong> baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example411() async {
		let input = """
*foo**bar**baz*
"""
		let expected = """
<p><em>foo<strong>bar</strong>baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example412() async {
		let input = """
*foo**bar*
"""
		let expected = """
<p><em>foo**bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example413() async {
		let input = """
***foo** bar*
"""
		let expected = """
<p><em><strong>foo</strong> bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example414() async {
		let input = """
*foo **bar***
"""
		let expected = """
<p><em>foo <strong>bar</strong></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example415() async {
		let input = """
*foo**bar***
"""
		let expected = """
<p><em>foo<strong>bar</strong></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example416() async {
		let input = """
foo***bar***baz
"""
		let expected = """
<p>foo<em><strong>bar</strong></em>baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example417() async {
		let input = """
foo******bar*********baz
"""
		let expected = """
<p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example418() async {
		let input = """
*foo **bar *baz* bim** bop*
"""
		let expected = """
<p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example419() async {
		let input = """
*foo [*bar*](/url)*
"""
		let expected = """
<p><em>foo <a href="/url"><em>bar</em></a></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example420() async {
		let input = """
** is not an empty emphasis
"""
		let expected = """
<p>** is not an empty emphasis</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example421() async {
		let input = """
**** is not an empty strong emphasis
"""
		let expected = """
<p>**** is not an empty strong emphasis</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example422() async {
		let input = """
**foo [bar](/url)**
"""
		let expected = """
<p><strong>foo <a href="/url">bar</a></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example423() async {
		let input = """
**foo
bar**
"""
		let expected = """
<p><strong>foo
bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example424() async {
		let input = """
__foo _bar_ baz__
"""
		let expected = """
<p><strong>foo <em>bar</em> baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example425() async {
		let input = """
__foo __bar__ baz__
"""
		let expected = """
<p><strong>foo <strong>bar</strong> baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example426() async {
		let input = """
____foo__ bar__
"""
		let expected = """
<p><strong><strong>foo</strong> bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example427() async {
		let input = """
**foo **bar****
"""
		let expected = """
<p><strong>foo <strong>bar</strong></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example428() async {
		let input = """
**foo *bar* baz**
"""
		let expected = """
<p><strong>foo <em>bar</em> baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example429() async {
		let input = """
**foo*bar*baz**
"""
		let expected = """
<p><strong>foo<em>bar</em>baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example430() async {
		let input = """
***foo* bar**
"""
		let expected = """
<p><strong><em>foo</em> bar</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example431() async {
		let input = """
**foo *bar***
"""
		let expected = """
<p><strong>foo <em>bar</em></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example432() async {
		let input = """
**foo *bar **baz**
bim* bop**
"""
		let expected = """
<p><strong>foo <em>bar <strong>baz</strong>
bim</em> bop</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example433() async {
		let input = """
**foo [*bar*](/url)**
"""
		let expected = """
<p><strong>foo <a href="/url"><em>bar</em></a></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example434() async {
		let input = """
__ is not an empty emphasis
"""
		let expected = """
<p>__ is not an empty emphasis</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example435() async {
		let input = """
____ is not an empty strong emphasis
"""
		let expected = """
<p>____ is not an empty strong emphasis</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example436() async {
		let input = """
foo ***
"""
		let expected = """
<p>foo ***</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example437() async {
		let input = """
foo *\\**
"""
		let expected = """
<p>foo <em>*</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example438() async {
		let input = """
foo *_*
"""
		let expected = """
<p>foo <em>_</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example439() async {
		let input = """
foo *****
"""
		let expected = """
<p>foo *****</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example440() async {
		let input = """
foo **\\***
"""
		let expected = """
<p>foo <strong>*</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example441() async {
		let input = """
foo **_**
"""
		let expected = """
<p>foo <strong>_</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example442() async {
		let input = """
**foo*
"""
		let expected = """
<p>*<em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example443() async {
		let input = """
*foo**
"""
		let expected = """
<p><em>foo</em>*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example444() async {
		let input = """
***foo**
"""
		let expected = """
<p>*<strong>foo</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example445() async {
		let input = """
****foo*
"""
		let expected = """
<p>***<em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example446() async {
		let input = """
**foo***
"""
		let expected = """
<p><strong>foo</strong>*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example447() async {
		let input = """
*foo****
"""
		let expected = """
<p><em>foo</em>***</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example448() async {
		let input = """
foo ___
"""
		let expected = """
<p>foo ___</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example449() async {
		let input = """
foo _\\__
"""
		let expected = """
<p>foo <em>_</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example450() async {
		let input = """
foo _*_
"""
		let expected = """
<p>foo <em>*</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example451() async {
		let input = """
foo _____
"""
		let expected = """
<p>foo _____</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example452() async {
		let input = """
foo __\\___
"""
		let expected = """
<p>foo <strong>_</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example453() async {
		let input = """
foo __*__
"""
		let expected = """
<p>foo <strong>*</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example454() async {
		let input = """
__foo_
"""
		let expected = """
<p>_<em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example455() async {
		let input = """
_foo__
"""
		let expected = """
<p><em>foo</em>_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example456() async {
		let input = """
___foo__
"""
		let expected = """
<p>_<strong>foo</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example457() async {
		let input = """
____foo_
"""
		let expected = """
<p>___<em>foo</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example458() async {
		let input = """
__foo___
"""
		let expected = """
<p><strong>foo</strong>_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example459() async {
		let input = """
_foo____
"""
		let expected = """
<p><em>foo</em>___</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example460() async {
		let input = """
**foo**
"""
		let expected = """
<p><strong>foo</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example461() async {
		let input = """
*_foo_*
"""
		let expected = """
<p><em><em>foo</em></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example462() async {
		let input = """
__foo__
"""
		let expected = """
<p><strong>foo</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example463() async {
		let input = """
_*foo*_
"""
		let expected = """
<p><em><em>foo</em></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example464() async {
		let input = """
****foo****
"""
		let expected = """
<p><strong><strong>foo</strong></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example465() async {
		let input = """
____foo____
"""
		let expected = """
<p><strong><strong>foo</strong></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example466() async {
		let input = """
******foo******
"""
		let expected = """
<p><strong><strong><strong>foo</strong></strong></strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example467() async {
		let input = """
***foo***
"""
		let expected = """
<p><em><strong>foo</strong></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example468() async {
		let input = """
_____foo_____
"""
		let expected = """
<p><em><strong><strong>foo</strong></strong></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example469() async {
		let input = """
*foo _bar* baz_
"""
		let expected = """
<p><em>foo _bar</em> baz_</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example470() async {
		let input = """
*foo __bar *baz bim__ bam*
"""
		let expected = """
<p><em>foo <strong>bar *baz bim</strong> bam</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example471() async {
		let input = """
**foo **bar baz**
"""
		let expected = """
<p>**foo <strong>bar baz</strong></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example472() async {
		let input = """
*foo *bar baz*
"""
		let expected = """
<p>*foo <em>bar baz</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example473() async {
		let input = """
*[bar*](/url)
"""
		let expected = """
<p>*<a href="/url">bar*</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example474() async {
		let input = """
_foo [bar_](/url)
"""
		let expected = """
<p>_foo <a href="/url">bar_</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example475() async {
		let input = """
*<img src="foo" title="*"/>
"""
		let expected = """
<p>*<img src="foo" title="*"/></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example476() async {
		let input = """
**<a href="**">
"""
		let expected = """
<p>**<a href="**"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example477() async {
		let input = """
__<a href="__">
"""
		let expected = """
<p>__<a href="__"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example478() async {
		let input = """
*a `*`*
"""
		let expected = """
<p><em>a <code>*</code></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example479() async {
		let input = """
_a `_`_
"""
		let expected = """
<p><em>a <code>_</code></em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example480() async {
		let input = """
**a<https://foo.bar/?q=**>
"""
		let expected = """
<p>**a<a href="https://foo.bar/?q=**">https://foo.bar/?q=**</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example481() async {
		let input = """
__a<https://foo.bar/?q=__>
"""
		let expected = """
<p>__a<a href="https://foo.bar/?q=__">https://foo.bar/?q=__</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example482() async {
		let input = """
[link](/uri "title")
"""
		let expected = """
<p><a href="/uri" title="title">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example483() async {
		let input = """
[link](/uri)
"""
		let expected = """
<p><a href="/uri">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example484() async {
		let input = """
[](./target.md)
"""
		let expected = """
<p><a href="./target.md"></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example485() async {
		let input = """
[link]()
"""
		let expected = """
<p><a href="">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example486() async {
		let input = """
[link](<>)
"""
		let expected = """
<p><a href="">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example487() async {
		let input = """
[]()
"""
		let expected = """
<p><a href=""></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example488() async {
		let input = """
[link](/my uri)
"""
		let expected = """
<p>[link](/my uri)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example489() async {
		let input = """
[link](</my uri>)
"""
		let expected = """
<p><a href="/my%20uri">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example490() async {
		let input = """
[link](foo
bar)
"""
		let expected = """
<p>[link](foo
bar)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example491() async {
		let input = """
[link](<foo
bar>)
"""
		let expected = """
<p>[link](<foo
bar>)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example492() async {
		let input = """
[a](<b)c>)
"""
		let expected = """
<p><a href="b)c">a</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example493() async {
		let input = """
[link](<foo\\>)
"""
		let expected = """
<p>[link](&lt;foo&gt;)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example494() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example495() async {
		let input = """
[link](\\(foo\\))
"""
		let expected = """
<p><a href="(foo)">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example496() async {
		let input = """
[link](foo(and(bar)))
"""
		let expected = """
<p><a href="foo(and(bar))">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example497() async {
		let input = """
[link](foo(and(bar))
"""
		let expected = """
<p>[link](foo(and(bar))</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example498() async {
		let input = """
[link](foo\\(and\\(bar\\))
"""
		let expected = """
<p><a href="foo(and(bar)">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example499() async {
		let input = """
[link](<foo(and(bar)>)
"""
		let expected = """
<p><a href="foo(and(bar)">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example500() async {
		let input = """
[link](foo\\)\\:)
"""
		let expected = """
<p><a href="foo):">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example501() async {
		let input = """
[link](#fragment)

[link](https://example.com#fragment)

[link](https://example.com?foo=3#frag)
"""
		let expected = """
<p><a href="#fragment">link</a></p>
<p><a href="https://example.com#fragment">link</a></p>
<p><a href="https://example.com?foo=3#frag">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example502() async {
		let input = """
[link](foo\\bar)
"""
		let expected = """
<p><a href="foo%5Cbar">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example503() async {
		let input = """
[link](foo%20b&auml;)
"""
		let expected = """
<p><a href="foo%20b%C3%A4">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example504() async {
		let input = """
[link]("title")
"""
		let expected = """
<p><a href="%22title%22">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example505() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

  @Test func example506() async {
		let input = """
[link](/url "title \\"&quot;")
"""
		let expected = """
<p><a href="/url" title="title &quot;&quot;">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example507() async {
		let input = """
[link](/url "title")
"""
		let expected = """
<p><a href="/url%C2%A0%22title%22">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example508() async {
		let input = """
[link](/url "title "and" title")
"""
		let expected = """
<p>[link](/url &quot;title &quot;and&quot; title&quot;)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example509() async {
		let input = """
[link](/url 'title "and" title')
"""
		let expected = """
<p><a href="/url" title="title &quot;and&quot; title">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example510() async {
		let input = """
[link](   /uri
  "title"  )
"""
		let expected = """
<p><a href="/uri" title="title">link</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example511() async {
		let input = """
[link] (/uri)
"""
		let expected = """
<p>[link] (/uri)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example512() async {
		let input = """
[link [foo [bar]]](/uri)
"""
		let expected = """
<p><a href="/uri">link [foo [bar]]</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example513() async {
		let input = """
[link] bar](/uri)
"""
		let expected = """
<p>[link] bar](/uri)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example514() async {
		let input = """
[link [bar](/uri)
"""
		let expected = """
<p>[link <a href="/uri">bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example515() async {
		let input = """
[link \\[bar](/uri)
"""
		let expected = """
<p><a href="/uri">link [bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example516() async {
		let input = """
[link *foo **bar** `#`*](/uri)
"""
		let expected = """
<p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example517() async {
		let input = """
[![moon](moon.jpg)](/uri)
"""
		let expected = """
<p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example518() async {
		let input = """
[foo [bar](/uri)](/uri)
"""
		let expected = """
<p>[foo <a href="/uri">bar</a>](/uri)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example519() async {
		let input = """
[foo *[bar [baz](/uri)](/uri)*](/uri)
"""
		let expected = """
<p>[foo <em>[bar <a href="/uri">baz</a>](/uri)</em>](/uri)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example520() async {
		let input = """
![[[foo](uri1)](uri2)](uri3)
"""
		let expected = """
<p><img src="uri3" alt="[foo](uri2)" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example521() async {
		let input = """
*[foo*](/uri)
"""
		let expected = """
<p>*<a href="/uri">foo*</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example522() async {
		let input = """
[foo *bar](baz*)
"""
		let expected = """
<p><a href="baz*">foo *bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	/*@Test*/ func example523() async {
		let input = """
*foo [bar* baz]
"""
		let expected = """
<p><em>foo [bar</em> baz]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example524() async {
		let input = """
[foo <bar attr="](baz)">
"""
		let expected = """
<p>[foo <bar attr="](baz)"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example525() async {
		let input = """
[foo`](/uri)`
"""
		let expected = """
<p>[foo<code>](/uri)</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example526() async {
		let input = """
[foo<https://example.com/?search=](uri)>
"""
		let expected = """
<p>[foo<a href="https://example.com/?search=%5D(uri)">https://example.com/?search=](uri)</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example527() async {
		let input = """
[foo][bar]

[bar]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example528() async {
		let input = """
[link [foo [bar]]][ref]

[ref]: /uri
"""
		let expected = """
<p><a href="/uri">link [foo [bar]]</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example529() async {
		let input = """
[link \\[bar][ref]

[ref]: /uri
"""
		let expected = """
<p><a href="/uri">link [bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example530() async {
		let input = """
[link *foo **bar** `#`*][ref]

[ref]: /uri
"""
		let expected = """
<p><a href="/uri">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example531() async {
		let input = """
[![moon](moon.jpg)][ref]

[ref]: /uri
"""
		let expected = """
<p><a href="/uri"><img src="moon.jpg" alt="moon" /></a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example532() async {
		let input = """
[foo [bar](/uri)][ref]

[ref]: /uri
"""
		let expected = """
<p>[foo <a href="/uri">bar</a>]<a href="/uri">ref</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example533() async {
		let input = """
[foo *bar [baz][ref]*][ref]

[ref]: /uri
"""
		let expected = """
<p>[foo <em>bar <a href="/uri">baz</a></em>]<a href="/uri">ref</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example534() async {
		let input = """
*[foo*][ref]

[ref]: /uri
"""
		let expected = """
<p>*<a href="/uri">foo*</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example535() async {
		let input = """
[foo *bar][ref]*

[ref]: /uri
"""
		let expected = """
<p><a href="/uri">foo *bar</a>*</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example536() async {
		let input = """
[foo <bar attr="][ref]">

[ref]: /uri
"""
		let expected = """
<p>[foo <bar attr="][ref]"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example537() async {
		let input = """
[foo`][ref]`

[ref]: /uri
"""
		let expected = """
<p>[foo<code>][ref]</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example538() async {
		let input = """
[foo<https://example.com/?search=][ref]>

[ref]: /uri
"""
		let expected = """
<p>[foo<a href="https://example.com/?search=%5D%5Bref%5D">https://example.com/?search=][ref]</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example539() async {
		let input = """
[foo][BaR]

[bar]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example540() async {
		let input = """
[ẞ]

[SS]: /url
"""
		let expected = """
<p><a href="/url">ẞ</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example541() async {
		let input = """
[Foo
  bar]: /url

[Baz][Foo bar]
"""
		let expected = """
<p><a href="/url">Baz</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example542() async {
		let input = """
[foo] [bar]

[bar]: /url "title"
"""
		let expected = """
<p>[foo] <a href="/url" title="title">bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example543() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example544() async {
		let input = """
[foo]: /url1

[foo]: /url2

[bar][foo]
"""
		let expected = """
<p><a href="/url1">bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example545() async {
		let input = """
[bar][foo\\!]

[foo!]: /url
"""
		let expected = """
<p>[bar][foo!]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example546() async {
		let input = """
[foo][ref[]

[ref[]: /uri
"""
		let expected = """
<p>[foo][ref[]</p>
<p>[ref[]: /uri</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example547() async {
		let input = """
[foo][ref[bar]]

[ref[bar]]: /uri
"""
		let expected = """
<p>[foo][ref[bar]]</p>
<p>[ref[bar]]: /uri</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example548() async {
		let input = """
[[[foo]]]

[[[foo]]]: /url
"""
		let expected = """
<p>[[[foo]]]</p>
<p>[[[foo]]]: /url</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example549() async {
		let input = """
[foo][ref\\[]

[ref\\[]: /uri
"""
		let expected = """
<p><a href="/uri">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example550() async {
		let input = """
[bar\\\\]: /uri

[bar\\\\]
"""
		let expected = """
<p><a href="/uri">bar\\</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example551() async {
		let input = """
[]

[]: /uri
"""
		let expected = """
<p>[]</p>
<p>[]: /uri</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example552() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example553() async {
		let input = """
[foo][]

[foo]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example554() async {
		let input = """
[*foo* bar][]

[*foo* bar]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title"><em>foo</em> bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example555() async {
		let input = """
[Foo][]

[foo]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">Foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example556() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example557() async {
		let input = """
[foo]

[foo]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example558() async {
		let input = """
[*foo* bar]

[*foo* bar]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title"><em>foo</em> bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example559() async {
		let input = """
[[*foo* bar]]

[*foo* bar]: /url "title"
"""
		let expected = """
<p>[<a href="/url" title="title"><em>foo</em> bar</a>]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example560() async {
		let input = """
[[bar [foo]

[foo]: /url
"""
		let expected = """
<p>[[bar <a href="/url">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example561() async {
		let input = """
[Foo]

[foo]: /url "title"
"""
		let expected = """
<p><a href="/url" title="title">Foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example562() async {
		let input = """
[foo] bar

[foo]: /url
"""
		let expected = """
<p><a href="/url">foo</a> bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example563() async {
		let input = """
\\[foo]

[foo]: /url "title"
"""
		let expected = """
<p>[foo]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example564() async {
		let input = """
[foo*]: /url

*[foo*]
"""
		let expected = """
<p>*<a href="/url">foo*</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example565() async {
		let input = """
[foo][bar]

[foo]: /url1
[bar]: /url2
"""
		let expected = """
<p><a href="/url2">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example566() async {
		let input = """
[foo][]

[foo]: /url1
"""
		let expected = """
<p><a href="/url1">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example567() async {
		let input = """
[foo]()

[foo]: /url1
"""
		let expected = """
<p><a href="">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example568() async {
		let input = """
[foo](not a link)

[foo]: /url1
"""
		let expected = """
<p><a href="/url1">foo</a>(not a link)</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example569() async {
		let input = """
[foo][bar][baz]

[baz]: /url
"""
		let expected = """
<p>[foo]<a href="/url">bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example570() async {
		let input = """
[foo][bar][baz]

[baz]: /url1
[bar]: /url2
"""
		let expected = """
<p><a href="/url2">foo</a><a href="/url1">baz</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example571() async {
		let input = """
[foo][bar][baz]

[baz]: /url1
[foo]: /url2
"""
		let expected = """
<p>[foo]<a href="/url1">bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example572() async {
		let input = """
![foo](/url "title")
"""
		let expected = """
<p><img src="/url" alt="foo" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example573() async {
		let input = """
![foo *bar*]

[foo *bar*]: train.jpg "train & tracks"
"""
		let expected = """
<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example574() async {
		let input = """
![foo ![bar](/url)](/url2)
"""
		let expected = """
<p><img src="/url2" alt="foo bar" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example575() async {
		let input = """
![foo [bar](/url)](/url2)
"""
		let expected = """
<p><img src="/url2" alt="foo bar" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example576() async {
		let input = """
![foo *bar*][]

[foo *bar*]: train.jpg "train & tracks"
"""
		let expected = """
<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example577() async {
		let input = """
![foo *bar*][foobar]

[FOOBAR]: train.jpg "train & tracks"
"""
		let expected = """
<p><img src="train.jpg" alt="foo bar" title="train &amp; tracks" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example578() async {
		let input = """
![foo](train.jpg)
"""
		let expected = """
<p><img src="train.jpg" alt="foo" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example579() async {
		let input = """
My ![foo bar](/path/to/train.jpg  "title"   )
"""
		let expected = """
<p>My <img src="/path/to/train.jpg" alt="foo bar" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example580() async {
		let input = """
![foo](<url>)
"""
		let expected = """
<p><img src="url" alt="foo" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example581() async {
		let input = """
![](/url)
"""
		let expected = """
<p><img src="/url" alt="" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example582() async {
		let input = """
![foo][bar]

[bar]: /url
"""
		let expected = """
<p><img src="/url" alt="foo" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example583() async {
		let input = """
![foo][bar]

[BAR]: /url
"""
		let expected = """
<p><img src="/url" alt="foo" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example584() async {
		let input = """
![foo][]

[foo]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="foo" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example585() async {
		let input = """
![*foo* bar][]

[*foo* bar]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="foo bar" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example586() async {
		let input = """
![Foo][]

[foo]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="Foo" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example587() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example588() async {
		let input = """
![foo]

[foo]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="foo" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example589() async {
		let input = """
![*foo* bar]

[*foo* bar]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="foo bar" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example590() async {
		let input = """
![[foo]]

[[foo]]: /url "title"
"""
		let expected = """
<p>![[foo]]</p>
<p>[[foo]]: /url &quot;title&quot;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example591() async {
		let input = """
![Foo]

[foo]: /url "title"
"""
		let expected = """
<p><img src="/url" alt="Foo" title="title" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example592() async {
		let input = """
!\\[foo]

[foo]: /url "title"
"""
		let expected = """
<p>![foo]</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example593() async {
		let input = """
\\![foo]

[foo]: /url "title"
"""
		let expected = """
<p>!<a href="/url" title="title">foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example594() async {
		let input = """
<http://foo.bar.baz>
"""
		let expected = """
<p><a href="http://foo.bar.baz">http://foo.bar.baz</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example595() async {
		let input = """
<https://foo.bar.baz/test?q=hello&id=22&boolean>
"""
		let expected = """
<p><a href="https://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean">https://foo.bar.baz/test?q=hello&amp;id=22&amp;boolean</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example596() async {
		let input = """
<irc://foo.bar:2233/baz>
"""
		let expected = """
<p><a href="irc://foo.bar:2233/baz">irc://foo.bar:2233/baz</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example597() async {
		let input = """
<MAILTO:FOO@BAR.BAZ>
"""
		let expected = """
<p><a href="MAILTO:FOO@BAR.BAZ">MAILTO:FOO@BAR.BAZ</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example598() async {
		let input = """
<a+b+c:d>
"""
		let expected = """
<p><a href="a+b+c:d">a+b+c:d</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example599() async {
		let input = """
<made-up-scheme://foo,bar>
"""
		let expected = """
<p><a href="made-up-scheme://foo,bar">made-up-scheme://foo,bar</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example600() async {
		let input = """
<https://../>
"""
		let expected = """
<p><a href="https://../">https://../</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example601() async {
		let input = """
<localhost:5001/foo>
"""
		let expected = """
<p><a href="localhost:5001/foo">localhost:5001/foo</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example602() async {
		let input = """
<https://foo.bar/baz bim>
"""
		let expected = """
<p>&lt;https://foo.bar/baz bim&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example603() async {
		let input = """
<https://example.com/\\[\\>
"""
		let expected = """
<p><a href="https://example.com/%5C%5B%5C">https://example.com/\\[\\</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example604() async {
		let input = """
<foo@bar.example.com>
"""
		let expected = """
<p><a href="mailto:foo@bar.example.com">foo@bar.example.com</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example605() async {
		let input = """
<foo+special@Bar.baz-bar0.com>
"""
		let expected = """
<p><a href="mailto:foo+special@Bar.baz-bar0.com">foo+special@Bar.baz-bar0.com</a></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example606() async {
		let input = """
<foo\\+@bar.example.com>
"""
		let expected = """
<p>&lt;foo+@bar.example.com&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example607() async {
		let input = """
<>
"""
		let expected = """
<p>&lt;&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example608() async {
		let input = """
< https://foo.bar >
"""
		let expected = """
<p>&lt; https://foo.bar &gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example609() async {
		let input = """
<m:abc>
"""
		let expected = """
<p>&lt;m:abc&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example610() async {
		let input = """
<foo.bar.baz>
"""
		let expected = """
<p>&lt;foo.bar.baz&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example611() async {
		let input = """
https://example.com
"""
		let expected = """
<p>https://example.com</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example612() async {
		let input = """
foo@bar.example.com
"""
		let expected = """
<p>foo@bar.example.com</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example613() async {
		let input = """
<a><bab><c2c>
"""
		let expected = """
<p><a><bab><c2c></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example614() async {
		let input = """
<a/><b2/>
"""
		let expected = """
<p><a/><b2/></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example615() async {
		let input = """
<a  /><b2
data="foo" >
"""
		let expected = """
<p><a  /><b2
data="foo" ></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example616() async {
		let input = """
<a foo="bar" bam = 'baz <em>"</em>'
_boolean zoop:33=zoop:33 />
"""
		let expected = """
<p><a foo="bar" bam = 'baz <em>"</em>'
_boolean zoop:33=zoop:33 /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example617() async {
		let input = """
Foo <responsive-image src="foo.jpg" />
"""
		let expected = """
<p>Foo <responsive-image src="foo.jpg" /></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example618() async {
		let input = """
<33> <__>
"""
		let expected = """
<p>&lt;33&gt; &lt;__&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example619() async {
		let input = """
<a h*#ref="hi">
"""
		let expected = """
<p>&lt;a h*#ref=&quot;hi&quot;&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example620() async {
		let input = """
<a href="hi'> <a href=hi'>
"""
		let expected = """
<p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example621() async {
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
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example622() async {
		let input = """
<a href='bar'title=title>
"""
		let expected = """
<p>&lt;a href='bar'title=title&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example623() async {
		let input = """
</a></foo >
"""
		let expected = """
<p></a></foo ></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example624() async {
		let input = """
</a href="foo">
"""
		let expected = """
<p>&lt;/a href=&quot;foo&quot;&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example625() async {
		let input = """
foo <!-- this is a --
comment - with hyphens -->
"""
		let expected = """
<p>foo <!-- this is a --
comment - with hyphens --></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example626() async {
		let input = """
foo <!--> foo -->

foo <!---> foo -->
"""
		let expected = """
<p>foo <!--> foo --&gt;</p>
<p>foo <!---> foo --&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example627() async {
		let input = """
foo <?php echo $a; ?>
"""
		let expected = """
<p>foo <?php echo $a; ?></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example628() async {
		let input = """
foo <!ELEMENT br EMPTY>
"""
		let expected = """
<p>foo <!ELEMENT br EMPTY></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example629() async {
		let input = """
foo <![CDATA[>&<]]>
"""
		let expected = """
<p>foo <![CDATA[>&<]]></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example630() async {
		let input = """
foo <a href="&ouml;">
"""
		let expected = """
<p>foo <a href="&ouml;"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example631() async {
		let input = """
foo <a href="\\*">
"""
		let expected = """
<p>foo <a href="\\*"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

    @Test func example632() async {
		let input = """
<a href="\\"">
"""
		let expected = """
<p>&lt;a href=&quot;&quot;&quot;&gt;</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example633() async {
		let input = """
foo  
baz
"""
		let expected = """
<p>foo<br />
baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example634() async {
		let input = """
foo\\
baz
"""
		let expected = """
<p>foo<br />
baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example635() async {
		let input = """
foo       
baz
"""
		let expected = """
<p>foo<br />
baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example636() async {
		let input = """
foo  
     bar
"""
		let expected = """
<p>foo<br />
bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example637() async {
		let input = """
foo\\
     bar
"""
		let expected = """
<p>foo<br />
bar</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example638() async {
		let input = """
*foo  
bar*
"""
		let expected = """
<p><em>foo<br />
bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example639() async {
		let input = """
*foo\\
bar*
"""
		let expected = """
<p><em>foo<br />
bar</em></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example640() async {
		let input = """
`code  
span`
"""
		let expected = """
<p><code>code   span</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example641() async {
		let input = """
`code\\
span`
"""
		let expected = """
<p><code>code\\ span</code></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example642() async {
		let input = """
<a href="foo  
bar">
"""
		let expected = """
<p><a href="foo  
bar"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example643() async {
		let input = """
<a href="foo\\
bar">
"""
		let expected = """
<p><a href="foo\\
bar"></p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example644() async {
		let input = """
foo\\
"""
		let expected = """
<p>foo\\</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example645() async {
		let input = """
foo  
"""
		let expected = """
<p>foo</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example646() async {
		let input = """
### foo\\
"""
		let expected = """
<h3>foo\\</h3>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example647() async {
		let input = """
### foo  
"""
		let expected = """
<h3>foo</h3>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example648() async {
		let input = """
foo
baz
"""
		let expected = """
<p>foo
baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example649() async {
		let input = """
foo 
 baz
"""
		let expected = """
<p>foo
baz</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example650() async {
		let input = """
hello $.;'there
"""
		let expected = """
<p>hello $.;'there</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example651() async {
		let input = """
Foo χρῆν
"""
		let expected = """
<p>Foo χρῆν</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func example652() async {
		let input = """
Multiple     spaces
"""
		let expected = """
<p>Multiple     spaces</p>
"""
		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			let html = _render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

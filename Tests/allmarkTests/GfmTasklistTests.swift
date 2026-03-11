import Testing
@testable import allmark

struct GfmTasklistTests {
	@Test func specTasklist() async {
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
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithAsteriskMarker() async {
		let input = """
* [ ] unchecked
* [x] checked
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> unchecked</li>
<li><input type="checkbox" checked="" disabled="" /> checked</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithPlusMarker() async {
		let input = """
+ [ ] unchecked
+ [x] checked
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> unchecked</li>
<li><input type="checkbox" checked="" disabled="" /> checked</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistInOrderedList() async {
		let input = """
1. [ ] unchecked item
2. [x] checked item
"""
		let expected = """
<ol>
<li><input type="checkbox" disabled="" /> unchecked item</li>
<li><input type="checkbox" checked="" disabled="" /> checked item</li>
</ol>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithInlineFormatting() async {
		let input = """
- [ ] **bold** task
- [x] *italic* task
- [ ] ~~strikethrough~~ task
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> <strong>bold</strong> task</li>
<li><input type="checkbox" checked="" disabled="" /> <em>italic</em> task</li>
<li><input type="checkbox" disabled="" /> <del>strikethrough</del> task</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithCode() async {
		let input = """
- [ ] task with `code`
- [x] another `code` task
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> task with <code>code</code></li>
<li><input type="checkbox" checked="" disabled="" /> another <code>code</code> task</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithLinks() async {
		let input = """
- [ ] task with [link](http://example.com)
- [x] checked [link](http://example.com) task
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> task with <a href="http://example.com">link</a></li>
<li><input type="checkbox" checked="" disabled="" /> checked <a href="http://example.com">link</a> task</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func nestedTasklist() async {
		let input = """
- [ ] parent task
  - [ ] child task 1
  - [x] child task 2
- [x] another parent
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> parent task
<ul>
<li><input type="checkbox" disabled="" /> child task 1</li>
<li><input type="checkbox" checked="" disabled="" /> child task 2</li>
</ul>
</li>
<li><input type="checkbox" checked="" disabled="" /> another parent</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func mixedTasksAndRegularItems() async {
		let input = """
- [ ] task item
- regular item
- [x] checked task
- another regular item
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> task item</li>
<li>regular item</li>
<li><input type="checkbox" checked="" disabled="" /> checked task</li>
<li>another regular item</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithSingleCharacter() async {
		let input = """
- [ ] a
- [x] b
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> a</li>
<li><input type="checkbox" checked="" disabled="" /> b</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithEmptyBrackets() async {
		let input = """
- [ ] 
- [x] 
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> </li>
<li><input type="checkbox" checked="" disabled="" /> </li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithUppercaseX() async {
		let input = """
- [ ] unchecked
- [X] checked with uppercase
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> unchecked</li>
<li><input type="checkbox" checked="" disabled="" /> checked with uppercase</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistInBlockquote() async {
		let input = """
> - [ ] quoted task
> - [x] checked quoted task
"""
		let expected = """
<blockquote>
<ul>
<li>[ ] quoted task</li>
<li>[x] checked quoted task</li>
</ul>
</blockquote>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithMultipleParagraphs() async {
		let input = """
- [ ] task with paragraph

  continuation paragraph
- [x] another task
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> 
<p>task with paragraph</p>
<p>continuation paragraph</p>
</li>
<li><input type="checkbox" checked="" disabled="" /> 
<p>another task</p>
</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithSublist() async {
		let input = """
- [ ] task with sublist
  - subitem 1
  - subitem 2
- [x] checked task
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> task with sublist
<ul>
<li>subitem 1</li>
<li>subitem 2</li>
</ul>
</li>
<li><input type="checkbox" checked="" disabled="" /> checked task</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithHtmlEntities() async {
		let input = """
- [ ] task with &amp; entity
- [x] task with &lt;HTML&gt;
"""
		let expected = """
<ul>
<li><input type="checkbox" disabled="" /> task with &amp; entity</li>
<li><input type="checkbox" checked="" disabled="" /> task with &lt;HTML&gt;</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func tasklistWithVariousWhitespace() async {
		let input = """
- [ ]one
- [  ] two
- [ x] three
"""
		let expected = """
<ul>
<li>[ ]one</li>
<li>[  ] two</li>
<li>[ x] three</li>
</ul>
"""
		await MainActor.run {
			let doc = parse(src: input, rules: gfmRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

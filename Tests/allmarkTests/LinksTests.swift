import Testing
@testable import allmark

struct LinksTests {
	@Test func basicInlineLink() async {
		let input = "[Google](https://google.com)"
		let expected = """
		<p><a href="https://google.com">Google</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithTitle() async {
		let input = "[Google](https://google.com \"Search Engine\")"
		let expected = """
		<p><a href="https://google.com" title="Search Engine">Google</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithSingleQuotedTitle() async {
		let input = "[Google](https://google.com 'Search Engine')"
		let expected = """
		<p><a href="https://google.com" title="Search Engine">Google</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkInParagraph() async {
		let input = "Visit [Google](https://google.com) for search."
		let expected = """
		<p>Visit <a href="https://google.com">Google</a> for search.</p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func multipleLinksInOneLine() async {
		let input = "[Google](https://google.com) and [GitHub](https://github.com)"
		let expected = """
		<p><a href="https://google.com">Google</a> and <a href="https://github.com">GitHub</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithEmphasis() async {
		let input = "[*Google*](https://google.com)"
		let expected = """
		<p><a href="https://google.com"><em>Google</em></a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emphasisAroundLink() async {
		let input = "*[Google](https://google.com)*"
		let expected = """
		<p><em><a href="https://google.com">Google</a></em></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithCodeInText() async {
		let input = "[`const`](https://example.com)"
		let expected = """
		<p><a href="https://example.com"><code>const</code></a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkInListItem() async {
		let input = "- [Link](https://example.com)"
		let expected = """
		<ul>
		<li><a href="https://example.com">Link</a></li>
		</ul>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkInHeading() async {
		let input = "# See [Google](https://google.com)"
		let expected = """
		<h1>See <a href="https://google.com">Google</a></h1>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
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
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func autolinkWithHttp() async {
		let input = "<http://example.com>"
		let expected = """
		<p><a href="http://example.com">http://example.com</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func autolinkWithHttps() async {
		let input = "<https://example.com>"
		let expected = """
		<p><a href="https://example.com">https://example.com</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func autolinkWithFtp() async {
		let input = "<ftp://example.com>"
		let expected = """
		<p><a href="ftp://example.com">ftp://example.com</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emailAutolink() async {
		let input = "<user@example.com>"
		let expected = """
		<p><a href="mailto:user@example.com">user@example.com</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithParenthesesInURL() async {
		let input = "[Link](https://example.com/path(with)parentheses)"
		let expected = """
		<p><a href="https://example.com/path(with)parentheses">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithSpacesInTitle() async {
		let input = "[Link](https://example.com \"This is a title\")"
		let expected = """
		<p><a href="https://example.com" title="This is a title">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithEscapedBracketsInText() async {
		let input = "[\\[link\\]](https://example.com)"
		let expected = """
		<p><a href="https://example.com">[link]</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func emptyLinkText() async {
		let input = "[](https://example.com)"
		let expected = """
		<p><a href="https://example.com"></a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithUnderscoreInURL() async {
		let input = "[Link](https://example.com/path_with_underscore)"
		let expected = """
		<p><a href="https://example.com/path_with_underscore">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func relativeURL() async {
		let input = "[Link](/path/to/page)"
		let expected = """
		<p><a href="/path/to/page">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithPercentEncoding() async {
		let input = "[Link](https://example.com/path%20with%20spaces)"
		let expected = """
		<p><a href="https://example.com/path%20with%20spaces">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}

	@Test func linkWithSpecialCharactersInURL() async {
		let input = "[Link](https://example.com/path?query=value&other=123#anchor)"
		let expected = """
		<p><a href="https://example.com/path?query=value&amp;other=123#anchor">Link</a></p>
		"""
		await MainActor.run {
			let doc = parse(src: input, rules: coreRuleSet)
			let html = render(doc: doc, renderers: htmlRenderers)
			#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
		}
	}
}

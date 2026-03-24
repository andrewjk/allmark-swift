@testable import Allmark
import Testing

@Test func basicParse() async {
	let input = """
	# Test

	Here is some text

	* Tight item 1
	* Tight item 2

	- Loose item 1

	- Loose item 2
	"""

	let expected = """
	<h1>Test</h1>
	<p>Here is some text</p>
	<ul>
	<li>Tight item 1</li>
	<li>Tight item 2</li>
	</ul>
	<ul>
	<li>
	<p>Loose item 1</p>
	</li>
	<li>
	<p>Loose item 2</p>
	</li>
	</ul>
	"""

	await MainActor.run {
		let doc = _parse(src: input, rules: coreRuleSet)
		let html = _render(doc: doc, renderers: htmlRenderers)
		#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))
	}
}

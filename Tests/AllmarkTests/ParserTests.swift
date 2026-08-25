@testable import Allmark
import Testing

@Test func basicParse() async {
	let input = """
	# Test ☺️

	Here is some text
	 *with* bold stuff

	* Tight item 1
	* Tight item 2

	- Loose item 1

	- Loose item 2

	## Subtest

	Here is some more text
	"""

	let expected = """
	<h1>Test ☺️</h1>
	<p>Here is some text
	<em>with</em> bold stuff</p>
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
	<h2>Subtest</h2>
	<p>Here is some more text</p>
	"""

	await MainActor.run {
		let doc = _parse(src: input, rules: coreRuleSet)
		let html = _render(doc: doc, renderers: htmlRenderers)
		#expect(html.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))

		#expect(doc.children[0].type == "heading")
		#expect(doc.children[0].index == 0)
		#expect(doc.children[0].length == 8)

		let start = doc.children[0].index
		let end = start + doc.children[0].length
		let inputIndex = input.index(input.startIndex, offsetBy: start)
		let endIndex = input.index(input.startIndex, offsetBy: end)
		#expect(String(input[inputIndex ..< endIndex]) == "# Test ☺️")

		let input2 = input.replacingOccurrences(of: "\r\n", with: "\r").replacingOccurrences(of: "\n", with: "\r")
		let doc2 = _parse(src: input2, rules: coreRuleSet)
		let html2 = _render(doc: doc2, renderers: htmlRenderers)
		let normalizedHtml2 = html2.replacingOccurrences(of: "\r\n", with: "\n").replacingOccurrences(of: "\r", with: "\n")
		#expect(normalizedHtml2.trimmingCharacters(in: .whitespacesAndNewlines) == expected.trimmingCharacters(in: .whitespacesAndNewlines))

		#expect(doc2.children[0].type == "heading")
		#expect(doc2.children[0].index == 0)
		#expect(doc2.children[0].length == 8)

		let start2 = doc2.children[0].index
		let end2 = start2 + doc2.children[0].length
		let inputIndex2 = input2.index(input2.startIndex, offsetBy: start2)
		let endIndex2 = input2.index(input2.startIndex, offsetBy: end2)
		#expect(String(input2[inputIndex2 ..< endIndex2]) == "# Test ☺️")
	}
}

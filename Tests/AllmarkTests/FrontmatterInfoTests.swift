@testable import Allmark
import Testing

struct FrontmatterInfoTests {
	@Test func frontmatterIsStoredInDocumentInfo() async {
		let input = """
		---
		title: Test
		date: 2024-01-01
		---

		# Heading

		Content
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			#expect(doc.info == "---\ntitle: Test\ndate: 2024-01-01\n---")
		}
	}

	@Test func frontmatterNotRecognizedWhenNotAtDocumentStart() async {
		let input = """
		# Heading

		---
		title: Test
		---

		Content
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			#expect(doc.info == nil)
		}
	}

	@Test func frontmatterWithSingleLine() async {
		let input = """
		---
		title: Test
		---

		# Heading
		"""

		await MainActor.run {
			let doc = _parse(src: input, rules: coreRuleSet)
			#expect(doc.info == "---\ntitle: Test\n---")
		}
	}
}

//

@testable import Allmark
import Foundation
import Testing
import TestingPerformance

struct Bench {
	static let markdown: String = {
		guard let path = Bundle.module.path(forResource: "full-markdown", ofType: "md") else {
			fatalError("Could not find full-markdown.md file")
		}
		return try! String(contentsOfFile: path, encoding: .utf8)
	}()

	@Test(.timed(iterations: 100))
	func benchMarkdownToHtmlWithGfm() {
		let doc = _parse(src: Bench.markdown, rules: gfmRuleSet)
		let html = _render(doc: doc, renderers: htmlRenderers)
		blackHole(html)
	}
}

func blackHole<T>(_ value: T) {
	withUnsafePointer(to: value) { ptr in
		_ = ptr
	}
}

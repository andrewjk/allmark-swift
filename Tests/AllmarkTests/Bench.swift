//

@testable import Allmark
import Foundation
import Testing
import TestingPerformance

struct Bench {
	static let markdown: String = Bench.load("full-markdown", "md")
	static let para500: String = Bench.load("bench-para-500", "md")
	static let para2000: String = Bench.load("bench-para-2000", "md")

	static func load(_ name: String, _ ext: String) -> String {
		guard let path = Bundle.module.path(forResource: name, ofType: ext) else {
			fatalError("Could not find \(name).\(ext)")
		}
		return try! String(contentsOfFile: path, encoding: .utf8)
	}

	@Test(.timed(iterations: 100))
	func benchMarkdownToHtmlWithGfm() {
		let doc = _parse(src: Bench.markdown, rules: gfmRuleSet)
		let html = _render(doc: doc, renderers: htmlRenderers)
		blackHole(html)
	}

	@Test(.timed(iterations: 100))
	func benchParse() {
		let doc = _parse(src: Bench.markdown, rules: gfmRuleSet)
		blackHole(doc)
	}

	@Test(.timed(iterations: 100))
	func benchParseParagraph500() {
		let doc = _parse(src: Bench.para500, rules: gfmRuleSet)
		blackHole(doc)
	}

	@Test(.timed(iterations: 100))
	func benchParseParagraph2000() {
		let doc = _parse(src: Bench.para2000, rules: gfmRuleSet)
		blackHole(doc)
	}
}

func blackHole<T>(_ value: T) {
	withUnsafePointer(to: value) { ptr in
		_ = ptr
	}
}

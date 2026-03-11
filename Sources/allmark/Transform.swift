import Foundation
import Collections

@MainActor
func transform(src: String, rules: RuleSet, renderers: OrderedDictionary<String, Renderer>) -> String {
	let doc = parse(src: src, rules: rules)
	return render(doc: doc, renderers: renderers)
}

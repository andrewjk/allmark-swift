import Foundation
import OrderedCollections

func _transform(src: String, rules: RuleSet, renderers: OrderedDictionary<String, Renderer>) -> String {
	let doc = _parse(src: src, rules: rules)
	return _render(doc: doc, renderers: renderers)
}

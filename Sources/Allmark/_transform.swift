import Foundation

func _transform(src: String, rules: RuleSet, renderers: [Renderer]) -> String {
	let doc = _parse(src: src, rules: rules)
	return _render(doc: doc, renderers: renderers)
}

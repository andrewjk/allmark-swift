import Foundation

func _transform(src: String, rules: RuleSet, renderers: [Renderer], lineWidth: Int? = nil) -> String {
	let doc = _parse(src: src, rules: rules)
	return _render(doc: doc, renderers: renderers, lineWidth: lineWidth)
}

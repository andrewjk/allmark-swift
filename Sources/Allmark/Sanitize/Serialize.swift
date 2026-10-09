import Foundation

func serialize(root: HtmlNode) -> String {
	var output = ""
	for child in root.children {
		output += serializeNode(child)
	}
	return output
}

private func serializeNode(_ node: HtmlNode) -> String {
	switch node.type {
	case .text:
		return escapeHtml(text: node.text)
	case .comment:
		return "<!--\(node.text)-->"
	case .element:
		var output = "<\(node.tag)"
		for attribute in node.attributes {
			output += " \(attribute.name)=\"\(escapeHtml(text: attribute.value))\""
		}
		output += ">"
		if voidElements.contains(node.tag) {
			return output
		}
		if !node.text.isEmpty {
			output += escapeHtml(text: node.text)
		}
		for child in node.children {
			output += serializeNode(child)
		}
		output += "</\(node.tag)>"
		return output
	}
}

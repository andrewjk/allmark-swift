import Foundation

/// Converts the UTF-8 byte offsets stored on nodes during parsing into
/// character offsets, so that consumers can slice the original source
/// using `String.index(_:offsetBy:)`.
///
/// Parsing operates on bytes for speed, so this is run once over the
/// finished tree at the end of `_parse`.
func normalizeSourcePositions(document: MarkdownNode, src: String) {
	// Fast path: for pure ASCII sources byte and character offsets are identical
	for byte in src.utf8 {
		if byte >= 0x80 {
			normalizeSourcePositionsSlow(document: document, src: src)
			return
		}
	}
}

private func normalizeSourcePositionsSlow(document: MarkdownNode, src: String) {
	// Collect every node in the tree
	var nodes: [MarkdownNode] = []
	collectNodes(parent: document, into: &nodes)

	// Collect the distinct offset boundaries that need converting
	var boundarySet = Set<Int>()
	boundarySet.reserveCapacity(nodes.count * 2)
	for node in nodes {
		boundarySet.insert(node.index)
		boundarySet.insert(node.index + node.length)
	}
	let boundaries = boundarySet.sorted()

	// Walk the source once, mapping each boundary from a byte to a character offset
	var byteToChar: [Int: Int] = [:]
	byteToChar.reserveCapacity(boundaries.count)
	var charOffset = 0
	var byteOffset = 0
	var bi = 0
	for char in src {
		while bi < boundaries.count, boundaries[bi] <= byteOffset {
			byteToChar[boundaries[bi]] = charOffset
			bi += 1
		}
		if bi >= boundaries.count {
			break
		}
		byteOffset += char.utf8.count
		charOffset += 1
	}
	while bi < boundaries.count {
		byteToChar[boundaries[bi]] = charOffset
		bi += 1
	}

	// Rewrite the node positions
	for node in nodes {
		let startIndex = byteToChar[node.index] ?? node.index
		let endIndex = byteToChar[node.index + node.length] ?? (node.index + node.length)
		node.length = endIndex - startIndex
		node.index = startIndex
	}
}

private func collectNodes(parent: MarkdownNode, into nodes: inout [MarkdownNode]) {
	nodes.append(parent)
	for child in parent.children {
		collectNodes(parent: child, into: &nodes)
	}
}

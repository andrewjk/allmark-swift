import Collections
import Foundation

@MainActor
struct Allmark {
    public static let Core = coreRuleSet
    public static let Gfm = gfmRuleSet
    public static let Extended = extendedRuleSet
    public static let ConsoleRenderers = consoleRenderers
    public static let HtmlRenderers = htmlRenderers
    
    public static func parse(src: String, rules: RuleSet) -> MarkdownNode {
        return _parse(src: src, rules: rules)
    }

    public static func render(doc: MarkdownNode, renderers: OrderedDictionary<String, Renderer> = htmlRenderers) -> String {
        return _render(doc: doc, renderers: renderers)
    }

    public static func transform(src: String, rules: RuleSet, renderers: OrderedDictionary<String, Renderer>) -> String {
        return _transform(src: src, rules: rules, renderers: renderers)
    }
}

import Collections
import Foundation

/// The main entry point for the Allmark Markdown parser.
@MainActor
public struct Allmark {
    /// Available rulesets for parsing different Markdown flavors.
    @MainActor
    public struct Rules {
        public static let core = coreRuleSet
        public static let gfm = gfmRuleSet
        public static let extended = extendedRuleSet
    }
    public static let rules = Rules()

    /// Available renderers for converting the parsed AST to output formats.
    @MainActor
    public struct Renderers {
        public static let html = htmlRenderers
        public static let console = consoleRenderers
    }
    public static let renderers = Renderers()
    
    /// Parse Markdown source text into an AST.
    /// - Parameters:
    ///   - src: The Markdown source text to parse.
    ///   - rules: The ruleset to use for parsing (e.g., `Allmark.rules.core`).
    /// - Returns: The root node of the parsed AST.
    public static func parse(src: String, rules: RuleSet) -> MarkdownNode {
        return _parse(src: src, rules: rules)
    }

    /// Render a parsed AST to the specified output format.
    /// - Parameters:
    ///   - doc: The root node of the AST to render.
    ///   - renderers: The renderer dictionary to use (defaults to HTML).
    /// - Returns: The rendered output string.
    public static func render(doc: MarkdownNode, renderers: OrderedDictionary<String, Renderer> = htmlRenderers) -> String {
        return _render(doc: doc, renderers: renderers)
    }

    /// Parse and render Markdown in one step.
    /// - Parameters:
    ///   - src: The Markdown source text to parse.
    ///   - rules: The ruleset to use for parsing.
    ///   - renderers: The renderer dictionary to use.
    /// - Returns: The rendered output string.
    public static func transform(src: String, rules: RuleSet, renderers: OrderedDictionary<String, Renderer>) -> String {
        return _transform(src: src, rules: rules, renderers: renderers)
    }
}

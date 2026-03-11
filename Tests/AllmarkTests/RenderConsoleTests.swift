import Testing
@testable import allmark

struct RenderConsoleTests {
    @Test func rendersParagraphToConsole() async {
        let input = "Hello, world!"
        let expected = "Hello, world!\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHeadingToConsoleWithColor() async {
        let input = "# Heading 1\n## Heading 2"
        let expected = "\u{001B}[2m#\u{001B}[0m \u{001B}[1m\u{001B}[35mHeading 1\u{001B}[0m\n\u{001B}[2m##\u{001B}[0m \u{001B}[1m\u{001B}[35mHeading 2\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersBulletedListWithUnicodeBullets() async {
        let input = "- Item 1\n- Item 2"
        let expected = "\u{001B}[2m•\u{001B}[0m Item 1\n\u{001B}[2m•\u{001B}[0m Item 2\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersOrderedList() async {
        let input = "1. First\n2. Second"
        let expected = "\u{001B}[2m1.\u{001B}[0m First\n\u{001B}[2m2.\u{001B}[0m Second\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersCodeFenceWithBoxDrawing() async {
        let input = "```\ncode\n```"
        let expected = "\u{001B}[2m┌─\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m code\n\u{001B}[2m└─\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersInlineCode() async {
        let input = "`code`"
        let expected = "\u{001B}[32mcode\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersBlockQuoteWithVerticalLine() async {
        let input = "> Quote text"
        let expected = "┃ Quote text\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            let stripped = output.replacingOccurrences(of: "\u{001B}[0m", with: "")
                .replacingOccurrences(of: "\u{001B}[1m", with: "")
                .replacingOccurrences(of: "\u{001B}[2m", with: "")
                .replacingOccurrences(of: "\u{001B}[3m", with: "")
                .replacingOccurrences(of: "\u{001B}[4m", with: "")
                .replacingOccurrences(of: "\u{001B}[31m", with: "")
                .replacingOccurrences(of: "\u{001B}[32m", with: "")
                .replacingOccurrences(of: "\u{001B}[33m", with: "")
                .replacingOccurrences(of: "\u{001B}[34m", with: "")
                .replacingOccurrences(of: "\u{001B}[35m", with: "")
                .replacingOccurrences(of: "\u{001B}[36m", with: "")
                .replacingOccurrences(of: "\u{001B}[38;5;208m", with: "")
                .replacingOccurrences(of: "\u{001B}[90m", with: "")
            #expect(stripped == expected)
        }
    }
    
    @Test func rendersThematicBreak() async {
        let input = "---"
        let expected = "\u{001B}[2m───\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersTaskListWithEmojis() async {
        let input = "- [x] Done\n- [ ] Todo"
        let expected = "\u{001B}[2m•\u{001B}[0m [✓] Done\n\u{001B}[2m•\u{001B}[0m [ ] Todo\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: gfmRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersTableWithUnicodeBorders() async {
        let input = "| A | B |\n|---|---|\n| 1 | 2 |"
        let expected = "\u{001B}[2m┌───┬───┐\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m A \u{001B}[2m│\u{001B}[0m B \u{001B}[2m│\u{001B}[0m\n\u{001B}[2m├───┼───┤\u{001B}[0m\n\u{001B}[2m│\u{001B}[0m 1 \u{001B}[2m│\u{001B}[0m 2 \u{001B}[2m│\u{001B}[0m\n\u{001B}[2m└───┴───┘\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: gfmRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersStrongText() async {
        let input = "**bold**"
        let expected = "\u{001B}[1m\u{001B}[33mbold\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersEmphasisText() async {
        let input = "*italic*"
        let expected = "\u{001B}[3m\u{001B}[33mitalic\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersLink() async {
        let input = "[text](url)"
        let expected = "\u{001B}[34m\u{001B}[4mtext\u{001B}[0m \u{001B}[2m(url)\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersImage() async {
        let input = "![alt](url)"
        let expected = "\u{001B}[90m[Image: alt]\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersStrikethrough() async {
        let input = "~~deleted~~"
        let expected = "\u{001B}[2m\u{001B}[9mdeleted\u{001B}[29m\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: gfmRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersAlertWithEmoji() async {
        let input = "> [!NOTE]\n> Note content"
        let expected = "\u{001B}[34m📝 Note:\u{001B}[0m\n\nNote content\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: gfmRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersNestedListWithDifferentBullets() async {
        let input = "- Level 1\n  - Level 2\n    - Level 3"
        let expected = "\u{001B}[2m•\u{001B}[0m Level 1\n  \u{001B}[2m◦\u{001B}[0m Level 2\n    \u{001B}[2m▪\u{001B}[0m Level 3\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHardBreak() async {
        let input = "Line 1\n\nLine 2"
        let expected = "Line 1\n\nLine 2\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHeadingWithUnderlineSetextStyle() async {
        let input = "Heading\n=======\n\nSubheading\n-------"
        let expected = "\u{001B}[1m\u{001B}[35mHeading\n\u{001B}[0m\u{001B}[2m=======\u{001B}[0m\n\u{001B}[1m\u{001B}[35mSubheading\n\u{001B}[0m\u{001B}[2m----------\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHtmlBlock() async {
        let input = "<div>html</div>"
        let expected = "<div>html</div>\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHtmlSpanInline() async {
        let input = "test <span>html</span> test"
        let expected = "test <span>html</span> test\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: coreRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersComment() async {
        let input = "<!-- comment -->"
        let expected = "<!-- comment -->\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: extendedRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersDeletionStrikethroughAlternative() async {
        let input = "~~deleted~~"
        let expected = "\u{001B}[2m\u{001B}[9mdeleted\u{001B}[29m\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: extendedRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersFootnote() async {
        let input = "Text [^1]\n\n[^1]: http://example.com"
        let expected = "Text \u{001B}[2m[1]\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: gfmRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersHighlight() async {
        let input = "==highlighted=="
        let expected = "\u{001B}[43m\u{001B}[30mhighlighted\u{001B}[0m\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: extendedRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
    
    @Test func rendersInsertion() async {
        let input = "++inserted++"
        let expected = "++inserted++\n"
        
        await MainActor.run {
            let doc = _parse(src: input, rules: extendedRuleSet)
            let output = _render(doc: doc, renderers: consoleRenderers)
            #expect(output == expected)
        }
    }
}

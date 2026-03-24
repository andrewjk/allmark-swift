@testable import Allmark
import Testing

struct SourceMappingTests {
	@Test func headingATX() async {
		let input = "# Heading 1"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let heading = doc.children![0]
			#expect(heading.type == "heading")
			#expect(heading.index == 0)
			#expect(heading.length == 11)
		}
	}

	@Test func headingATXWithMultipleHashes() async {
		let input = "### Heading 3"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let heading = doc.children![0]
			#expect(heading.type == "heading")
			#expect(heading.index == 0)
			#expect(heading.length == 13)
		}
	}

	@Test func headingUnderline() async {
		let input = "Heading\n====="
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let heading = doc.children![0]
			#expect(heading.type == "heading")
			#expect(heading.index == 0)
			#expect(heading.length == 13)
		}
	}

	@Test func thematicBreak() async {
		let input = "---"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let thematicBreak = doc.children![0]
			#expect(thematicBreak.type == "thematic_break")
			#expect(thematicBreak.index == 0)
			#expect(thematicBreak.length == 3)
		}
	}

	@Test func alert() async {
		let input = "> [!NOTE]\n> Alert content"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let alert = doc.children![0]
			#expect(alert.index == 0)
			#expect(alert.length == 25)
		}
	}

	@Test func blockQuote() async {
		let input = "> Quote content"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let blockQuote = doc.children![0]
			#expect(blockQuote.type == "block_quote")
			#expect(blockQuote.index == 0)
			#expect(blockQuote.length == 15)
		}
	}

	@Test func codeBlockIndented() async {
		let input = "\n    code\n    here"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let codeBlock = doc.children![0]
			#expect(codeBlock.type == "code_block")
			#expect(codeBlock.index == 1)
			#expect(codeBlock.length == 17)
		}
	}

	@Test func codeFenceBackticks() async {
		let input = "```\ncode\n```"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let codeFence = doc.children![0]
			#expect(codeFence.type == "code_fence")
			#expect(codeFence.index == 0)
			#expect(codeFence.length == 12)
		}
	}

	@Test func codeFenceTildes() async {
		let input = "~~~\ncode\n~~~"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let codeFence = doc.children![0]
			#expect(codeFence.type == "code_fence")
			#expect(codeFence.index == 0)
			#expect(codeFence.length == 12)
		}
	}

	@Test func codeFenceWithLanguage() async {
		let input = "```javascript\ncode\n```"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let codeFence = doc.children![0]
			#expect(codeFence.type == "code_fence")
			#expect(codeFence.index == 0)
			#expect(codeFence.length == 22)
		}
	}

	@Test func htmlBlock() async {
		let input = "<div>content</div>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let htmlBlock = doc.children![0]
			#expect(htmlBlock.type == "html_block")
			#expect(htmlBlock.index == 0)
			#expect(htmlBlock.length == 18)
		}
	}

	@Test func htmlBlockMultiline() async {
		let input = "<div>\ncontent\n</div>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let htmlBlock = doc.children![0]
			#expect(htmlBlock.type == "html_block")
			#expect(htmlBlock.index == 0)
			#expect(htmlBlock.length == 20)
		}
	}

	@Test func linkReferenceDefinition() async {
		let input = "[link]: url"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let linkReference = doc.children![0]
			#expect(linkReference.type == "link_ref")
			#expect(linkReference.index == 0)
			#expect(linkReference.length == 11)
		}
	}

	@Test func listOrdered() async {
		let input = "1. Item one"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let list = doc.children![0]
			#expect(list.type == "list_ordered")
			#expect(list.index == 0)
			#expect(list.length == 11)
		}
	}

	@Test func listBulleted() async {
		let input = "- Item one"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let list = doc.children![0]
			#expect(list.type == "list_bulleted")
			#expect(list.index == 0)
			#expect(list.length == 10)
		}
	}

	@Test func listItem() async {
		let input = "1. Item one"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let list = doc.children![0]
			let listItem = list.children![0]
			#expect(listItem.type == "list_item")
			#expect(listItem.index == 0)
			#expect(listItem.length == 11)
		}
	}

	@Test func listTaskItemChecked() async {
		let input = "- [x] Done task"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let list = doc.children![0]
			let taskItem = list.children![0]
			#expect(taskItem.type == "list_item")
			#expect(taskItem.index == 0)
			#expect(taskItem.length == 15)
		}
	}

	@Test func listTaskItemUnchecked() async {
		let input = "- [ ] Todo task"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let list = doc.children![0]
			let taskItem = list.children![0]
			#expect(taskItem.type == "list_item")
			#expect(taskItem.index == 0)
			#expect(taskItem.length == 15)
		}
	}

	@Test func footnoteReference() async {
		let input = "[^1]: Footnote content"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let footnoteReference = doc.children![0]
			#expect(footnoteReference.type == "footnote_ref")
			#expect(footnoteReference.index == 0)
			#expect(footnoteReference.length == 22)
		}
	}

	@Test func table() async {
		let input = "| A | B |\n|---|---|\n| 1 | 2 |"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let table = doc.children![0]
			#expect(table.type == "table")
			#expect(table.index == 0)
			#expect(table.length == 29)
		}
	}

	@Test func paragraph() async {
		let input = "A paragraph."
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			#expect(paragraph.type == "paragraph")
			#expect(paragraph.index == 0)
			#expect(paragraph.length == 12)
		}
	}

	@Test func indent() async {
		let input = "  indented paragraph"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let indent = doc.children![0]
			#expect(indent.type == "paragraph")
			#expect(indent.index == 2)
			#expect(indent.length == 18)
		}
	}

	@Test func escapedBlock() async {
		let input = "\\# Not a heading"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let escaped = doc.children![0]
			#expect(escaped.type == "paragraph")
			#expect(escaped.index == 0)
			#expect(escaped.length == 16)
		}
	}

	// Inline tests
	@Test func autolinkURL() async {
		let input = "<https://example.com>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let autolink = paragraph.children![0]
			#expect(autolink.type == "html_span")
			#expect(autolink.index == 0)
			#expect(autolink.length == 21)
		}
	}

	@Test func autolinkEmail() async {
		let input = "<user@example.com>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let autolink = paragraph.children![0]
			#expect(autolink.type == "html_span")
			#expect(autolink.index == 0)
			#expect(autolink.length == 18)
		}
	}

	@Test func extendedAutolinkWww() async {
		let input = "www.example.com"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let extendedAutolink = paragraph.children![0]
			#expect(extendedAutolink.type == "html_span")
			#expect(extendedAutolink.index == 0)
			#expect(extendedAutolink.length == 15)
		}
	}

	@Test func codeSpan() async {
		let input = "`code`"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let codeSpan = paragraph.children![0]
			#expect(codeSpan.type == "code_span")
			#expect(codeSpan.index == 0)
			#expect(codeSpan.length == 6)
		}
	}

	@Test func emphasisAsterisk() async {
		let input = "*emphasis*"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let emphasis = paragraph.children![0]
			#expect(emphasis.type == "emphasis")
			#expect(emphasis.index == 0)
			#expect(emphasis.length == 10)
		}
	}

	@Test func emphasisUnderscore() async {
		let input = "here: _emphasis_"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let emphasis = paragraph.children![1]
			#expect(emphasis.type == "emphasis")
			#expect(emphasis.index == 6)
			#expect(emphasis.length == 10)
		}
	}

	@Test func strong() async {
		let input = "**strong**"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let strong = paragraph.children![0]
			#expect(strong.type == "strong")
			#expect(strong.index == 0)
			#expect(strong.length == 10)
		}
	}

	@Test func link() async {
		let input = "[link](url)"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let link = paragraph.children![0]
			#expect(link.type == "link")
			#expect(link.index == 0)
			#expect(link.length == 11)
		}
	}

	@Test func linkWithTitle() async {
		let input = "[link](url \"title\")"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let link = paragraph.children![0]
			#expect(link.type == "link")
			#expect(link.index == 0)
			#expect(link.length == 19)
		}
	}

	@Test func footnote() async {
		let input = "[^1]"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let footnote = paragraph.children![0]
			#expect(footnote.index == 0)
			#expect(footnote.length == 4)
		}
	}

	@Test func hardBreak() async {
		let input = "line  \nbreak"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let hardBreak = paragraph.children![1]
			#expect(hardBreak.index == 4)
			#expect(hardBreak.length == 2)
		}
	}

	@Test func strikethrough() async {
		let input = "~~strikethrough~~"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let strikethrough = paragraph.children![0]
			#expect(strikethrough.type == "strikethrough")
			#expect(strikethrough.index == 0)
			#expect(strikethrough.length == 17)
		}
	}

	@Test func highlight() async {
		let input = "==highlight=="
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let highlight = paragraph.children![0]
			#expect(highlight.type == "highlight")
			#expect(highlight.index == 0)
			#expect(highlight.length == 13)
		}
	}

	@Test func testSubscript() async {
		let input = "~subscript~"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let subscriptNode = paragraph.children![0]
			#expect(subscriptNode.type == "subscript")
			#expect(subscriptNode.index == 0)
			#expect(subscriptNode.length == 11)
		}
	}

	@Test func superscript() async {
		let input = "^superscript^"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let superscript = paragraph.children![0]
			#expect(superscript.type == "superscript")
			#expect(superscript.index == 0)
			#expect(superscript.length == 13)
		}
	}

	@Test func insertion() async {
		let input = "{++inserted++}"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let insertion = paragraph.children![0]
			#expect(insertion.type == "insertion")
			#expect(insertion.index == 0)
			#expect(insertion.length == 14)
		}
	}

	@Test func deletion() async {
		let input = "del: {--deleted--}"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let deletion = paragraph.children![1]
			#expect(deletion.type == "deletion")
			#expect(deletion.index == 5)
			#expect(deletion.length == 13)
		}
	}

	@Test func htmlSpan() async {
		let input = "<span>content</span>"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let htmlStart = paragraph.children![0]
			let htmlEnd = paragraph.children![2]
			#expect(htmlStart.type == "html_span")
			#expect(htmlStart.index == 0)
			#expect(htmlStart.length == 6)
			#expect(htmlEnd.type == "html_span")
			#expect(htmlEnd.index == 13)
			#expect(htmlEnd.length == 7)
		}
	}

	@Test func comment() async {
		let input = "<!-- comment -->"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let comment = doc.children![0]
			#expect(comment.index == 0)
			#expect(comment.length == 16)
		}
	}

	@Test func text() async {
		let input = "plain text"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let text = paragraph.children![0]
			#expect(text.type == "text")
			#expect(text.index == 0)
			#expect(text.length == 10)
		}
	}

	@Test func textWithSpecialChars() async {
		let input = "text with & chars"
		await MainActor.run {
			let doc = _parse(src: input, rules: extendedRuleSet)
			let paragraph = doc.children![0]
			let text = paragraph.children![0]
			#expect(text.type == "text")
			#expect(text.index == 0)
			#expect(text.length == 17)
		}
	}
}

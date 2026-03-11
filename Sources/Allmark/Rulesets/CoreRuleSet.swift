import Foundation

/// The core CommonMark ruleset.
@MainActor
public let coreRuleSet = RuleSet(
	blocks: [
		indentRule.name: indentRule,
		headingRule.name: headingRule,
		headingUnderlineRule.name: headingUnderlineRule,
		thematicBreakRule.name: thematicBreakRule,
		blockQuoteRule.name: blockQuoteRule,
		listOrderedRule.name: listOrderedRule,
		listBulletedRule.name: listBulletedRule,
		listItemRule.name: listItemRule,
		codeBlockRule.name: codeBlockRule,
		codeFenceRule.name: codeFenceRule,
		htmlBlockRule.name: htmlBlockRule,
		linkReferenceRule.name: linkReferenceRule,
		paragraphRule.name: paragraphRule,
		contentRule.name: contentRule,
	],
	inlines: [
		autolinkRule.name: autolinkRule,
		htmlSpanRule.name: htmlSpanRule,
		codeSpanRule.name: codeSpanRule,
		emphasisRule.name: emphasisRule,
		linkRule.name: linkRule,
		hardBreakRule.name: hardBreakRule,
		lineBreakRule.name: lineBreakRule,
		textRule.name: textRule,
	],
)

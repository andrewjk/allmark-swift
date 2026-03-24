import Foundation

/// The GitHub Flavored Markdown ruleset.

public let gfmRuleSet = RuleSet(
	blocks: [
		indentRule.name: indentRule,
		headingRule.name: headingRule,
		headingUnderlineRule.name: headingUnderlineRule,
		thematicBreakRule.name: thematicBreakRule,
		alertRule.name: alertRule,
		blockQuoteRule.name: blockQuoteRule,
		listOrderedRule.name: listOrderedRule,
		listBulletedRule.name: listBulletedRule,
		listItemRule.name: listItemRule,
		listTaskItemRule.name: listTaskItemRule,
		footnoteReferenceRule.name: footnoteReferenceRule,
		codeBlockRule.name: codeBlockRule,
		codeFenceRule.name: codeFenceRule,
		htmlBlockRule.name: htmlBlockRule,
		linkReferenceRule.name: linkReferenceRule,
		tableRule.name: tableRule,
		paragraphRule.name: paragraphRule,
		contentRule.name: contentRule,
	],
	inlines: [
		autolinkRule.name: autolinkRule,
		extendedAutolinkRule.name: extendedAutolinkRule,
		htmlSpanRule.name: htmlSpanRule,
		codeSpanRule.name: codeSpanRule,
		emphasisRule.name: emphasisRule,
		strikethroughRule.name: strikethroughRule,
		footnoteRule.name: footnoteRule,
		linkRule.name: linkRule,
		hardBreakRule.name: hardBreakRule,
		lineBreakRule.name: lineBreakRule,
		textRule.name: textRule,
	]
)

import Foundation

/// The extended ruleset with additional features.

public let extendedRuleSet = RuleSet(
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
		subscriptRule.name: subscriptRule,
		superscriptRule.name: superscriptRule,
		strikethroughRule.name: strikethroughRule,
		highlightRule.name: highlightRule,
		footnoteRule.name: footnoteRule,
		linkRule.name: linkRule,
		hardBreakRule.name: hardBreakRule,
		insertionRule.name: insertionRule,
		deletionRule.name: deletionRule,
		commentRule.name: commentRule,
		textRule.name: textRule,
	]
)

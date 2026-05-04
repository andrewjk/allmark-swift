import Foundation

/// The extended ruleset with additional features.

public let extendedRuleSet = RuleSet(
	blocks: [
		indentRule,
		headingRule,
		headingUnderlineRule,
		thematicBreakRule,
		alertRule,
		blockQuoteRule,
		listOrderedRule,
		listBulletedRule,
		listItemRule,
		listTaskItemRule,
		footnoteReferenceRule,
		codeBlockRule,
		codeFenceRule,
		htmlBlockRule,
		linkReferenceRule,
		tableRule,
		paragraphRule,
		contentRule,
	],
	inlines: [
		autolinkRule,
		extendedAutolinkRule,
		htmlSpanRule,
		codeSpanRule,
		emphasisRule,
		subscriptRule,
		superscriptRule,
		strikethroughRule,
		highlightRule,
		footnoteRule,
		linkRule,
		hardBreakRule,
		insertionRule,
		deletionRule,
		commentRule,
		textRule,
	]
)

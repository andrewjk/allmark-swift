import Foundation

/// The GitHub Flavored Markdown ruleset.

public let gfmRuleSet = RuleSet(
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
		strikethroughRule,
		footnoteRule,
		linkRule,
		hardBreakRule,
		textRule,
	]
)

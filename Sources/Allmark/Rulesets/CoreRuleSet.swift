import Foundation

/// The core CommonMark ruleset.

public let coreRuleSet = RuleSet(
	blocks: [
		indentRule,
		headingRule,
		headingUnderlineRule,
		thematicBreakRule,
		blockQuoteRule,
		listOrderedRule,
		listBulletedRule,
		listItemRule,
		codeBlockRule,
		codeFenceRule,
		htmlBlockRule,
		linkReferenceRule,
		paragraphRule,
		contentRule,
	],
	inlines: [
		autolinkRule,
		htmlSpanRule,
		codeSpanRule,
		emphasisRule,
		linkRule,
		hardBreakRule,
		textRule,
	]
)

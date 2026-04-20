import Foundation
import OrderedCollections

/// Console/terminal renderers for all node types.

public let consoleRenderers: OrderedDictionary<String, Renderer> = [
	consoleAlertRenderer.name: consoleAlertRenderer,
	consoleBlockQuoteRenderer.name: consoleBlockQuoteRenderer,
	consoleCodeBlockRenderer.name: consoleCodeBlockRenderer,
	consoleCodeFenceRenderer.name: consoleCodeFenceRenderer,
	consoleCodeSpanRenderer.name: consoleCodeSpanRenderer,
	consoleCommentRenderer.name: consoleCommentRenderer,
	consoleDeletionRenderer.name: consoleDeletionRenderer,
	consoleEmphasisRenderer.name: consoleEmphasisRenderer,
	consoleFootnoteRenderer.name: consoleFootnoteRenderer,
	consoleHardBreakRenderer.name: consoleHardBreakRenderer,
	consoleHeadingRenderer.name: consoleHeadingRenderer,
	consoleHeadingUnderlineRenderer.name: consoleHeadingUnderlineRenderer,
	consoleHighlightRenderer.name: consoleHighlightRenderer,
	htmlBlockRenderer.name: htmlBlockRenderer,
	htmlSpanRenderer.name: htmlSpanRenderer,
	consoleImageRenderer.name: consoleImageRenderer,
	consoleInsertionRenderer.name: consoleInsertionRenderer,
	consoleLinkRenderer.name: consoleLinkRenderer,
	consoleListBulletedRenderer.name: consoleListBulletedRenderer,
	consoleListOrderedRenderer.name: consoleListOrderedRenderer,
	consoleListTaskItemRenderer.name: consoleListTaskItemRenderer,
	consoleParagraphRenderer.name: consoleParagraphRenderer,
	consoleStrikethroughRenderer.name: consoleStrikethroughRenderer,
	consoleStrongRenderer.name: consoleStrongRenderer,
	// subscriptRenderer.name: subscriptRenderer,
	// superscriptRenderer.name: superscriptRenderer,
	consoleTableRenderer.name: consoleTableRenderer,
	// tableCellRenderer.name: tableCellRenderer,
	// tableHeaderRenderer.name: tableHeaderRenderer,
	// tableRowRenderer.name: tableRowRenderer,
	consoleTextRenderer.name: consoleTextRenderer,
	consoleThematicBreakRenderer.name: consoleThematicBreakRenderer,
]

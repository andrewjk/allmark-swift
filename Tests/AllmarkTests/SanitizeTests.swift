@testable import Allmark
import Testing

struct SanitizeTests {
	@Test func passesBenignHtmlThrough() {
		#expect(sanitize(html: "<p>Hello <b>world</b></p>") == "<p>Hello <b>world</b></p>")
	}

	@Test func keepsAllowedAttributes() {
		#expect(
			sanitize(html: "<a href=\"https://example.com\" title=\"x\">y</a>")
				== "<a href=\"https://example.com\" title=\"x\">y</a>"
		)
	}

	@Test func removesScriptWithItsContent() {
		#expect(
			sanitize(html: "<p>a</p><script>alert(1)</script><p>b</p>") == "<p>a</p><p>b</p>"
		)
	}

	@Test func removesStyleWithItsContent() {
		#expect(sanitize(html: "<style>p { color: red }</style>text") == "text")
	}

	@Test func removesIframeObjectAndEmbedWithTheirContent() {
		#expect(sanitize(html: "<iframe src=\"https://evil.com\"></iframe>") == "")
		#expect(sanitize(html: "<object data=\"x\"></object>") == "")
		#expect(sanitize(html: "<embed src=\"x\">") == "")
	}

	@Test func removesSvgAndMathWithTheirContent() {
		#expect(sanitize(html: "<svg><script>alert(1)</script></svg>") == "")
		#expect(sanitize(html: "<math><mi>xlink:href</mi></math>") == "")
	}

	@Test func dropsEventHandlerAttributes() {
		#expect(sanitize(html: "<img src=\"x\" onerror=\"alert(1)\">") == "<img src=\"x\">")
		#expect(sanitize(html: "<div onclick=\"alert(1)\" onmouseover=\"x\">y</div>") == "<div>y</div>")
	}

	@Test func unwrapsDisallowedTagsKeepingTheirChildren() {
		#expect(sanitize(html: "<marquee>whee</marquee>") == "whee")
		#expect(sanitize(html: "<form><p>keep</p></form>") == "<p>keep</p>")
	}

	@Test func dropsCommentsByDefaultAndKeepsThemWhenAllowed() {
		#expect(sanitize(html: "a<!-- hi -->b") == "ab")
		#expect(
			sanitize(html: "a<!-- hi -->b", config: SanitizerConfig(allowComments: true))
				== "a<!-- hi -->b"
		)
	}

	@Test func keepsDataAttributesByDefaultAndDropsThemWhenDisallowed() {
		#expect(
			sanitize(html: "<div data-controller=\"x\">y</div>")
				== "<div data-controller=\"x\">y</div>"
		)
		#expect(
			sanitize(html: "<div data-controller=\"x\">y</div>", config: SanitizerConfig(allowDataAttributes: false))
				== "<div>y</div>"
		)
	}

	@Test func prefixesIdAndNameAttributesToPreventDomClobbering() {
		#expect(
			sanitize(html: "<a id=\"foo\" name=\"bar\" href=\"#x\">z</a>")
				== "<a id=\"user-content-foo\" name=\"user-content-bar\" href=\"#x\">z</a>"
		)
	}

	@Test func supportsACustomClobberPrefix() {
		#expect(
			sanitize(html: "<a id=\"x\">y</a>", config: SanitizerConfig(clobberPrefix: "c-"))
				== "<a id=\"c-x\">y</a>"
		)
		#expect(
			sanitize(html: "<a id=\"x\">y</a>", config: SanitizerConfig(clobberPrefix: ""))
				== "<a id=\"x\">y</a>"
		)
	}

	@Test func lowercasesTagAndAttributeNames() {
		#expect(sanitize(html: "<DIV CLASS=\"x\">y</DIV>") == "<div>y</div>")
	}

	@Test func keepsOnlyCheckboxInputs() {
		#expect(
			sanitize(html: "<input type=\"checkbox\" disabled>")
				== "<input type=\"checkbox\" disabled=\"\">"
		)
		#expect(sanitize(html: "<input type=\"text\">") == "<input>")
	}

	@Test func enforcesTheClassRegexOnCode() {
		#expect(
			sanitize(html: "<code class=\"language-js\">x</code>")
				== "<code class=\"language-js\">x</code>"
		)
		#expect(sanitize(html: "<code class=\"foo\">x</code>") == "<code>x</code>")
	}

	@Test func dropsJavascriptUrls() {
		#expect(sanitize(html: "<a href=\"javascript:alert(1)\">x</a>") == "<a>x</a>")
	}

	@Test func dropsObfuscatedJavascriptUrls() {
		#expect(sanitize(html: "<a href=\"jAvaScRiPt:alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"java&#9;script:alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"&#106;avascript:alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"&#0000106;avascript:alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"java&Tab;script&colon;alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"  javascript:alert(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<a href=\"jav&#x0A;ascript:alert(1)\">x</a>") == "<a>x</a>")
	}

	@Test func dropsVbscriptAndDataUrls() {
		#expect(sanitize(html: "<a href=\"vbscript:msgbox(1)\">x</a>") == "<a>x</a>")
		#expect(sanitize(html: "<img src=\"data:image/png;base64,AAAA\">") == "<img>")
	}

	@Test func keepsAllowedProtocols() {
		#expect(
			sanitize(html: "<a href=\"mailto:a@b.c\">m</a>") == "<a href=\"mailto:a@b.c\">m</a>"
		)
	}

	@Test func keepsRelativeUrlsAndFragments() {
		#expect(sanitize(html: "<a href=\"foo/bar?x=1#y\">t</a>") == "<a href=\"foo/bar?x=1#y\">t</a>")
		#expect(sanitize(html: "<a href=\"#section\">t</a>") == "<a href=\"#section\">t</a>")
		#expect(sanitize(html: "<a href=\"//example.com/x\">t</a>") == "<a href=\"//example.com/x\">t</a>")
	}

	@Test func supportsCustomProtocols() {
		let config = SanitizerConfig(attributes: [
			"a": [.matched("href", .protocols(["ftp"]))],
		])
		#expect(
			sanitize(html: "<a href=\"ftp://example.com\">x</a>", config: config)
				== "<a href=\"ftp://example.com\">x</a>"
		)
		#expect(
			sanitize(html: "<a href=\"https://example.com\">x</a>", config: config) == "<a>x</a>"
		)
	}

	@Test func handlesUnquotedAttributeValues() {
		#expect(sanitize(html: "<img src=x onerror=alert(1)>") == "<img src=\"x\">")
	}

	@Test func closesUnclosedTags() {
		#expect(sanitize(html: "<b>bold") == "<b>bold</b>")
	}

	@Test func ignoresStrayClosingTags() {
		#expect(sanitize(html: "</script>nice") == "nice")
		#expect(sanitize(html: "</>text") == "text")
	}

	@Test func repairsMismatchedNesting() {
		#expect(sanitize(html: "<b><i>x</b></i>") == "<b><i>x</i></b>")
	}

	@Test func escapesLiteralAngleBracketsInText() {
		#expect(sanitize(html: "5 < 6 and 7 > 4") == "5 &lt; 6 and 7 &gt; 4")
	}

	@Test func dropsIncompleteTagsAtEndOfInput() {
		#expect(sanitize(html: "text <img src=x onerror=alert(1)") == "text <img src=\"x\">")
		#expect(sanitize(html: "text <") == "text ")
	}

	@Test func dropsAttributesWithInvalidNames() {
		#expect(
			sanitize(html: "<div a\"b=\"c\" onclick=x data-y=\"z\">w</div>")
				== "<div data-y=\"z\">w</div>"
		)
	}

	@Test func handlesCommentEdgeCases() {
		#expect(sanitize(html: "a<!-->b") == "ab")
		#expect(sanitize(html: "a<!--->b") == "ab")
		#expect(sanitize(html: "a<!-- unclosed") == "a")
		#expect(sanitize(html: "a<!DOCTYPE html>b") == "ab")
		#expect(sanitize(html: "a<?php echo 1 ?>b") == "ab")
	}

	@Test func escapesAttributeValuesThatTryToBreakOut() {
		#expect(
			sanitize(html: "<img src=\"x\" title=\"&#34;&gt;&lt;script&gt;alert(1)&lt;/script&gt;\">")
				== "<img src=\"x\" title=\"&quot;&gt;&lt;script&gt;alert(1)&lt;/script&gt;\">"
		)
	}

	@Test func neutralizesTheNoscriptMXSSVector() {
		let output = sanitize(html: "<noscript><p title=\"</noscript><img src=x onerror=alert(1)>\">")
		#expect(!output.contains("onerror"))
		#expect(!output.contains("noscript"))
		#expect(output == "<img src=\"x\">&quot;&gt;")
	}

	@Test func escapesContentOfDisallowedRawTextElements() {
		#expect(sanitize(html: "<textarea><b>x</b></textarea>") == "&lt;b&gt;x&lt;/b&gt;")
		#expect(
			sanitize(html: "<title><img src=x onerror=alert(1)></title>")
				== "&lt;img src=x onerror=alert(1)&gt;"
		)
	}

	@Test func handlesDeepNestingWithoutCrashing() {
		let input = String(repeating: "<div>", count: 10000) + "x"
		let output = sanitize(html: input)
		#expect(output.contains("x"))
	}

	@Test func keepsEscapedEntitiesEscaped() {
		#expect(sanitize(html: "&lt;script&gt;") == "&lt;script&gt;")
	}

	@Test func reEscapesDecodedEntitiesExactlyOnce() {
		#expect(sanitize(html: "a &amp; b") == "a &amp; b")
	}

	@Test func supportsACustomElementsAllowlist() {
		#expect(
			sanitize(html: "<p><em>x</em></p>", config: SanitizerConfig(elements: ["p"]))
				== "<p>x</p>"
		)
	}

	@Test func supportsCustomRemoveElements() {
		#expect(
			sanitize(html: "<p>a</p><p>b</p>", config: SanitizerConfig(removeElements: ["p"])) == ""
		)
	}

	@Test func mergesPartialConfigWithDefaults() {
		#expect(
			sanitize(html: "<p title=\"t\">x</p>", config: SanitizerConfig(elements: ["p"]))
				== "<p title=\"t\">x</p>"
		)
	}

	@Test func isIdempotentOnAllSamples() {
		for sample in Self.samples {
			let once = sanitize(html: sample)
			#expect(sanitize(html: once) == once)
		}
	}

	@Test func neverThrowsAndStaysStableOnFuzzedInput() {
		let pool = Array("<>/\"'=&;:ab xyz()\t\n&#")
		let fragments = [
			"<p>",
			"</p>",
			"<img src=\"x\">",
			"<script>",
			"</script>",
			"<a href=",
			"alert(1)",
			"<!--",
			"-->",
			"<textarea>",
			"&#106;",
			"&amp;",
			"\" onerror=\"",
			"<div class=",
		]
		var seed: UInt32 = 12345
		func random() -> Double {
			seed = seed &+ 0x6D2B_79F5
			var t = (seed ^ (seed >> 15)) &* (1 | seed)
			t = (t &+ ((t ^ (t >> 7)) &* (61 | t))) ^ t
			return Double(t ^ (t >> 14)) / 4_294_967_296.0
		}
		for _ in 0 ..< 500 {
			var input = ""
			let pieces = 1 + Int(random() * 12)
			for _ in 0 ..< pieces {
				if random() < 0.6 {
					input += fragments[Int(random() * Double(fragments.count))]
				} else {
					let chars = 1 + Int(random() * 8)
					for _ in 0 ..< chars {
						input.append(pool[Int(random() * Double(pool.count))])
					}
				}
			}
			let once = sanitize(html: input)
			#expect(sanitize(html: once) == once)
		}
	}

	static let samples = [
		"<p>Hello <b>world</b></p>",
		"<a href=\"https://example.com\" title=\"x\">y</a>",
		"<p>a</p><script>alert(1)</script><p>b</p>",
		"<img src=\"x\" onerror=\"alert(1)\">",
		"<marquee>whee</marquee>",
		"a<!-- hi -->b",
		"<a href=\"javascript:alert(1)\">x</a>",
		"<a href=\"java&Tab;script&colon;alert(1)\">x</a>",
		"<a id=\"foo\" name=\"bar\" href=\"#x\">z</a>",
		"<img src=x onerror=alert(1)>",
		"<b>bold",
		"</script>nice",
		"<b><i>x</b></i>",
		"5 < 6 and 7 > 4",
		"<noscript><p title=\"</noscript><img src=x onerror=alert(1)>\">",
		"<textarea><b>x</b></textarea>",
		"<svg><script>alert(1)</script></svg>",
		"&lt;script&gt;",
		"<div a\"b=\"c\" onclick=x data-y=\"z\">w</div>",
		"a<!-->b",
		"a<!DOCTYPE html>b",
		"text <img src=x onerror=alert(1)",
	]
}

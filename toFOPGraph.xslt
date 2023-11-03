<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"  encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title></title>
			</head>
			<body>
				<h1>stat des ventes</h1>
				
				
					<svg viewBox="-30 -20 270 130" data-testid="GraphHistogramme" width="48vw" display="inline">
								<defs>
									<linearGradient id="effetArrondiVertical" x1="0%" x2="100%" y1="20%" y2="0">
										<stop offset="0%" stop-color="#B7CA79"/>
										<stop offset="80%" stop-color="#677E52"/>
									</linearGradient>
									<marker id="arrow" viewBox="0 0 10 10" refX="5" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
										<path d="M 0 0 L 10 5 L 0 10 z"/>
									</marker>
								</defs>
								<g>
									<line y1="80" x1="0" x2="230" y2="80" class="_GraphHistogram-module__grid__zHA8l"/>
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="80" class="_GraphHistogram-module__legendValue__14RM8">30</text>
								</g>
								<g>
									<line y1="60" x1="0" x2="230" y2="60" class="_GraphHistogram-module__grid__zHA8l"/>
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="60" class="_GraphHistogram-module__legendValue__14RM8">60</text>
								</g>
								<g>
									<line y1="40" x1="0" x2="230" y2="40" class="_GraphHistogram-module__grid__zHA8l"/>
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="40" class="_GraphHistogram-module__legendValue__14RM8">90</text>
								</g>
								<g>
									<line y1="20" x1="0" x2="230" y2="20" class="_GraphHistogram-module__grid__zHA8l"/>
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="20" class="_GraphHistogram-module__legendValue__14RM8">120</text>
								</g>
								<g>
									<line y1="0" x1="0" x2="230" y2="0" class="_GraphHistogram-module__grid__zHA8l"/>
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="0" class="_GraphHistogram-module__legendValue__14RM8">150</text>
								</g>
								<xsl:variable name="pasW" select="230 div count(//facture)"/>
								<xsl:variable name="pasH" select="100"/>
								<xsl:for-each select="//facture">
								<rect class="_GraphHistogram-module__bar__2Jypg" x="{((position()-1) * $pasW) + 5}" y="{100 - avgLigne}" width="{$pasW - 10}" height="{avgLigne}" fill="url(#effetArrondiVertical)"/>
								</xsl:for-each>
								<polyline points="0,-5 0,100 230,100" fill="none" stroke="black" marker-start="url(#arrow)" marker-end="url(#arrow)"/>
							</svg>
					
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

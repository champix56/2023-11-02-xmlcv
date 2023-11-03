<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="210mm" page-width="297mm">
					<fo:region-body/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block text-align="center">
						<fo:block text-align="center">Statistiques des ventes</fo:block>
						<fo:instream-foreign-object content-height="10cm" content-width="15cm" scaling="uniform">
							<svg viewBox="-30 -20 270 130"  >
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
									<line y1="80" x1="0" x2="230" y2="80" />
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="80" >30</text>
								</g>
								<g>
									<line y1="60" x1="0" x2="230" y2="60" />
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="60" >60</text>
								</g>
								<g>
									<line y1="40" x1="0" x2="230" y2="40" />
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="40" >90</text>
								</g>
								<g>
									<line y1="20" x1="0" x2="230" y2="20" />
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="20" >120</text>
								</g>
								<g>
									<line y1="0" x1="0" x2="230" y2="0" />
									<text alignment-baseline="middle" text-anchor="end" x="-2" y="0" >150</text>
								</g>
								<xsl:variable name="pasW" select="230 div count(//facture)"/>
								<xsl:variable name="pasH" select="100"/>
								<xsl:for-each select="//facture">
								<rect  x="{((position()-1) * $pasW) + 5}" y="{100 - avgLigne}" width="{$pasW - 10}" height="{avgLigne}" fill="url(#effetArrondiVertical)"/>
								</xsl:for-each>
								<polyline points="0,-5 0,100 230,100" fill="none" stroke="black" marker-start="url(#arrow)" marker-end="url(#arrow)"/>
							</svg>
						</fo:instream-foreign-object>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<stat>
			<xsl:for-each select="//facture">
				<facture>
					<avgLigne>
						<xsl:value-of select="sum(.//stotligne) div count(.//stotligne)"/>
					</avgLigne>
				</facture>
			</xsl:for-each>
		</stat>
	</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"  encoding="UTF-8"/>
	<xsl:template match="/">{
		"factures":[
		<xsl:for-each select="//facture"><xsl:if test="position()>1">,</xsl:if>{
		"idfacture":"<xsl:value-of select="@numfacture"/>",
		"datefacture":"<xsl:value-of select="@datefacture"/>",
		"total":<xsl:value-of select="sum(.//stotligne)"/>
		}</xsl:for-each>
		]
	}</xsl:template>
</xsl:stylesheet>

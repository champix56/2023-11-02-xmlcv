<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" />
	<xsl:template match="/">numfacture;date;total<xsl:apply-templates select="//facture"/>		
	</xsl:template>
	<xsl:template match="facture">;
<xsl:value-of select="@numfacture"/>;<xsl:value-of select="@datefacture"/>;<xsl:value-of select="sum(.//stotligne)"/>
	</xsl:template>
</xsl:stylesheet>

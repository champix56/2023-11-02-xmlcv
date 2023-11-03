<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY euro "&#x20ac;">
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:decimal-format name="euroformat" decimal-separator="," grouping-separator=" "/>
	<xsl:template match="/">
		<html>
			<head>
				<title>factures en date du <xsl:value-of select="/factures/@dateeditionXML"/>
				</title>
			</head>
			<body>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="facture">
		<div class="facture"><xsl:call-template name="dataclient"/></div>
		<xsl:apply-templates select=".//lignes"/>
	</xsl:template>
	
	<xsl:template match="lignes">
		<table style="width:90%" border="1" align="center">
			<thead>
				<tr>
					<th>ref</th>
					<th>design</th>
					<th>quant</th>
					<th>&euro;/unit.</th>
					<th>S-total</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select=".//ligne">
					<tr>
						<td><xsl:value-of select="ref"/></td>
						<td><xsl:value-of select="designation"/></td>
						<td><xsl:value-of select="nbUnit"/></td>
						<td><xsl:value-of select="phtByUnit"/></td>
						<td><xsl:value-of select="format-number(stotligne,'# ##0,00&euro;','euroformat')"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="dataclient">
	<xsl:variable name="idc" select="@idclient"/>
	<xsl:variable name="docClient" select="document('./clients.xml')/clients/client[@id=$idc]"/>
		<div class="client">
			<xsl:value-of select="$docClient/destinataire"/><br/>
			<xsl:value-of select="$docClient/adr1"/><br/>
			<xsl:value-of select="$docClient/adr2"/><br/>
			<xsl:value-of select="$docClient/cp"/>&nbsp;<xsl:value-of select="$docClient/ville"/>
		</div>
	</xsl:template>
	<!--<xsl:template match="facture[contains(@type,'evis')]">
		<div class="facture">une devis</div>
	</xsl:template>-->
</xsl:stylesheet>

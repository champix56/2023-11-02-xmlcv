<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--format du papier-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="297mm" page-width="21cm">
					<fo:region-body/>
					<fo:region-before extent="2cm"/>
					<fo:region-after extent="5mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center">
						<fo:page-number/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block margin-left="2cm" margin-right="2cm" border-bottom="0.3mm solid black" text-align="center" margin-bottom="5cm">Iiste des factures</fo:block>
					<fo:list-block margin-left="5cm">
						<xsl:apply-templates select="//facture" mode="sommaire">
							<xsl:sort select="@numfacture"/>
						</xsl:apply-templates>
					</fo:list-block>
					<xsl:apply-templates select="//facture"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="facture" mode="sommaire">
		<fo:list-item>
			<fo:list-item-label end-indent="label-end()">
				<fo:block>0</fo:block>
			</fo:list-item-label>
			<fo:list-item-body start-indent="body-start()">
				<fo:block color="blue" text-decoration="underline">
					<fo:basic-link internal-destination="F-{@numfacture}">
				Facture N° <xsl:value-of select="@numfacture"/>
					</fo:basic-link>
				</fo:block>
			</fo:list-item-body>
		</fo:list-item>
	</xsl:template>
	<xsl:template match="facture">
		<fo:block break-before="page" id="F-{@numfacture}">
			<fo:block margin=" 5cm 8cm" text-align="center">
				Facture N° <xsl:value-of select="@numfacture"/>
				<fo:block/>
				en date du <xsl:value-of select="@datefacture"/>
			</fo:block>
			<fo:block text-align="center">
				<fo:table width="100%">
					<fo:table-column/>
					<fo:table-column column-width="40%"/>
					<fo:table-column/>
					<fo:table-column/>
					<fo:table-column/>
					<fo:table-header>
						<fo:table-row>
							<fo:table-cell>
								<fo:block>Ref</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>design</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>€/unit</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>Quant</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>Stotal</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>
					<fo:table-footer>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="4">
								<fo:block text-align="right">Total :</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="format-number(sum(.//stotligne),'0.00€')"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-footer>
					<fo:table-body>
						<xsl:for-each select=".//ligne">
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="ref"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="designation"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="phtByUnit"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="nbUnit"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:value-of select="format-number(stotligne,'0.00€')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>

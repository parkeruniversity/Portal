<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<xsl:element name="data">
			<xsl:element name="items">
				<xsl:for-each select="data/items/item">
					<xsl:element name="item">
						<xsl:attribute name="text">
							<xsl:value-of select="text"/> 
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>

  
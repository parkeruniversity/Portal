<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="no" />
<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<xsl:element name="data">
			<xsl:element name="roles">
				<xsl:for-each select="data/roles/role">
					<xsl:element name="role">
						<xsl:attribute name="name">
							<xsl:value-of select="name"/> 
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="users">
				<xsl:for-each select="data/users/user">
					<xsl:element name="user">
						<xsl:attribute name="name">
							<xsl:value-of select="name"/> 
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:value-of select="value"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="username">
				<xsl:for-each select="data">
					<xsl:value-of select="usernametext" />
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="hostid">
				<xsl:for-each select="data">
					<xsl:value-of select="hostidtext" />
				</xsl:for-each>
			</xsl:element>
			<xsl:element name="userroles">
				<xsl:for-each select="data">
					<xsl:value-of select="userroles" />
				</xsl:for-each>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>

  
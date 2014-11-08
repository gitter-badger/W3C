<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:comment> Generated from activity-schema.md.xml via activity-schema.xsl, do not edit by hand. </xsl:comment>
        <as1>
            <verbs>
                <xsl:for-each select="//section[@id eq 'verbs']/table/tr/td[1]/tt/text()">
                    <verb name="{.}">
                        <desc>
                            <xsl:value-of select="../../following-sibling::td[1]"/>
                        </desc>
                        <example>
                            <xsl:value-of select="../../following-sibling::td[2]/pre"/>
                        </example>
                    </verb>
                </xsl:for-each>
            </verbs>
            <objects>
                
            </objects>
        </as1>
    </xsl:template>
</xsl:stylesheet>
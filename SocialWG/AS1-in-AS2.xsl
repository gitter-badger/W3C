<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsd" version="2.0">
    <xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="yes" indent="no" />
    <xsl:variable name="AS1" select="document('AS1.xml')" />
    <xsl:variable name="AS1i" select="document('AS1-implementations.xml')" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html>&#xa;</xsl:text>
        <html>
            <head>
                <title>Using Activity Streams 1.0 Vocabularies in Activity Streams 2.0</title>
                <meta charset="utf-8" />
                    <script src="http://www.w3.org/Tools/respec/respec-w3c-common" async="async" class="remove"></script>
                    <script class="remove">
                        var respecConfig = {
                        specStatus: "ED",
                        edDraftURI: "http://dret.github.io/W3C/SocialWG/AS1-in-AS2.html",
                        shortName: "AS1-in-AS2",
                        editors: [
                        {
                            name: "James M. Snell",
                            url: "http://chmod777self.com",
                            company: "IBM",
                            companyUrl: "http://ibm.com"
                        },
                        {
                            name: "Erik Wilde",
                            url: "http://dret.net/netdret/",
                            company: "Siemens",
                            companyUrl: "http://www.siemens.com/"
                            }  
                        ],
                        wg: "Social Web Working Group",
                        wgURI: "http://www.w3.org/Social/WG",
                        wgPublicList: "public-socialweb",
                        };
                    </script>
            </head>
            <body>
                <section id="abstract">
                    <p>This document describes how to use Activity Streams 1.0 vocabularies in Activity Streams 2.0.</p>
                </section>
                <section id="AS1-vocabularies">
                    <h2>Activity Streams 1.0 Vocabularies</h2>
                    <section id="AS1-verbs">
                        <h2>Activity Streams 1.0 Verbs</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Example</th>
                                    <th>Implementations</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$AS1/as1/verbs/verb">
                                    <tr id="verb-{@name}">
                                        <td>
                                            <tt>
                                                <xsl:value-of select="@name" />
                                            </tt>
                                        </td>
                                        <td>
                                            <xsl:value-of select="desc/text()" />
                                        </td>
                                        <td>
                                            <pre ><xsl:value-of select="example/text()" /></pre>
                                        </td>
                                        <td>
                                            <ul>
                                                <xsl:variable name="verb" select="@name" />
                                                <xsl:for-each select="$AS1i//verb[@name eq $verb]">
                                                    <li>
                                                        <a href="#{../../@id}-verb-{$verb}">
                                                            <xsl:value-of select="../../name/text()" />
                                                        </a>
                                                        <xsl:if test="exists(text())">
                                                            <xsl:text> (</xsl:text>
                                                            <xsl:value-of select="text()" />
                                                            <xsl:text>)</xsl:text>
                                                        </xsl:if>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </section>
                    <section id="AS1-objects">
                        <h2>Activity Streams 1.0 Objects</h2>
                    </section>
                </section>
                <section id="AS1-implementations">
                    <h2>Activity Streams 1.0 Implementations</h2>
                    <section id="pump.io">
                        <h2>pump.io</h2>
                        <p>As <a href="http://lists.w3.org/Archives/Public/public-socialweb/2014Nov/0021.html">reported by Evan Podromou</a>, pump.io supports a number of AS1 verbs as semantically meaningful, in the sense that pump.io will act upon them. These verbs are the following (excluding "post", which is not part of the AS1 vocabulary discussed in this document):</p>
                        <ul>
                            <xsl:for-each select="$AS1i//impl[@id eq 'pump.io']/verbs/verb">
                                <li id="pump.io-verb-{@name}">
                                    <xsl:variable name="verb" select="@name" />
                                    <a href="#verb-{@name}" title="{$AS1/as1/verbs/verb[@name = $verb]/desc/text()}">
                                        <xsl:value-of select="@name" />
                                    </a>
                                    <xsl:if test="exists(text())">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="text()" />
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                        <p>It should be noted that pump.io will accept, store, and forward all other verbs as well. But for those other verbs, there are no special semantics associated that will trigger internal actions in pump.io.</p>
                    </section>
                </section>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
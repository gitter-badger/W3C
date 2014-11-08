<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsd" version="2.0">
    <xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="yes" indent="no"/>
    <xsl:variable name="AS1" select="document('AS1.xml')"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html>&#xa;</xsl:text>
        <html>
            <head>
                <title>Using Activity Streams 1.0 Vocabularies in Activity Streams 2.0</title>
                <meta charset="utf-8"/>
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
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="$AS1/as1/verbs/verb">
                                    <tr id="verb-{@name}">
                                        <td>
                                            <tt>
                                                <xsl:value-of select="@name"/>
                                            </tt>
                                        </td>
                                        <td>
                                            <xsl:value-of select="desc"/>
                                        </td>
                                        <td>
                                            <pre>
                                                <xsl:value-of select="example"/>
                                            </pre>
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
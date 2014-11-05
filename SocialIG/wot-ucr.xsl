<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml/" exclude-result-prefixes="xsd" version="2.0">
    <xsl:output method="xhtml" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <xsl:comment>
                <xsl:text> Generated: </xsl:text>
                <xsl:value-of select="current-dateTime()"/>
                <xsl:text> </xsl:text>
            </xsl:comment>
            <head>
                <title>Use Cases and Requirements</title>
                <style type="text/css">
.section { padding-left : 20px; }
*:target { outline : red solid medium ; }
body { color : #202020 ; background-color : #F0F0F0 ; }
a { color : #407040 ; text-decoration : none ; border-bottom : 1px dotted ; }
a:hover { background-color: #FFFFFF ; }
                </style>
            </head>
            <body>
                <h1>Use Cases and Requirements</h1>
                <hr/>
                <h2>Table of Contents</h2>
                <ol>
                    <li>
                        <xsl:text>Use Cases</xsl:text>
                        <ol>
                            <xsl:for-each select="/ucr/usecase">
                                <li>
                                    <a href="#{@id}">
                                        <xsl:value-of select="title"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </li>
                    <li>
                        <xsl:text>Requirements</xsl:text>
                        <ol>
                            <xsl:for-each select="/ucr/req">
                                <li>
                                    <a href="#{@id}">
                                        <xsl:value-of select="title"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </li>
                    <li>
                        <xsl:text>Technologies</xsl:text>
                        <ol>
                            <xsl:for-each select="/ucr/tech">
                                <li>
                                    <a href="#{@id}">
                                        <xsl:value-of select="title"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </li>
                </ol>
                <hr/>
                <h3>1. Use Cases</h3>
                <div class="section">
                    <xsl:apply-templates select="/ucr/usecase"/>
                </div>
                <hr/>
                <h3>2. Requirements</h3>
                <div class="section">
                    <xsl:apply-templates select="/ucr/req"/>
                </div>
                <hr/>
                <h3>3. Technologies</h3>
                <div class="section">
                    <xsl:apply-templates select="/ucr/tech"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="usecase">
        <div id="{@id}">
            <xsl:apply-templates select="title, p, ul">
                <xsl:with-param name="position" select="position()"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="req">
        <xsl:variable name="reqid" select="@id"/>
        <div id="{$reqid}">
            <xsl:apply-templates select="title, p">
                <xsl:with-param name="position" select="position()"/>
            </xsl:apply-templates>
            <dl>
                <dt><b>Motivated by <xsl:value-of select="count(/ucr/usecase[.//li[@reqref eq $reqid]])"/> Use Cases: </b></dt>
                <dd>
                    <ul>
                        <xsl:for-each select="/ucr/usecase//li[@reqref eq $reqid]">
                            <li>
                                <em>
                                    <a href="#{../../@id}" title="Go to complete Use Case">
                                        <xsl:value-of select="concat(../../title, ': ')"/>
                                    </a>
                                </em>
                                <a href="#{concat(../../@id, '-', $reqid)}" title="Go to Atomic Use Case">
                                    <xsl:apply-templates select="node()"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </dd>
                <dt><b>Covered by <xsl:value-of select="count(/ucr/tech[.//li[@reqref eq $reqid]])"/> Technologies: </b></dt>
                <dd>
                    <ul>
                        <xsl:for-each select="/ucr/tech//li[@reqref eq $reqid]">
                            <li>
                                <em>
                                    <a href="#{../../@id}" title="Go to Technology Description">
                                        <xsl:value-of select="concat(../../title, ': ')"/>
                                    </a>
                                </em>
                                <a href="#{concat(../../@id, '-', $reqid)}" title="Go to Technology Feature Description">
                                    <xsl:apply-templates select="node()"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </dd>
            </dl>
        </div>
    </xsl:template>
    <xsl:template match="tech">
        <div id="{@id}">
            <xsl:apply-templates select="title, p, ul">
                <xsl:with-param name="position" select="position()"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="title">
        <xsl:param name="position"/>
        <h4>
            <xsl:if test="exists(../@author)">
                <xsl:attribute name="title" select="concat('Authored by: ', ../@author)"/>
            </xsl:if>
            <xsl:value-of select="concat($position, '. ', .)"/>
            <xsl:if test="exists(../@href)">
                <xsl:text> </xsl:text>
                <a href="{../@href}" title="External Link">(Link)</a>
            </xsl:if>
        </h4>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates select="node()"/>
        </p>
    </xsl:template>
    <xsl:template match="a">
        <a href="{@href}">
            <xsl:if test="exists(@title)">
                <xsl:attribute name="title" select="@title"/>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </a>
    </xsl:template>
    <xsl:template match="ul">
        <ul>
            <xsl:apply-templates select="li"/>
        </ul>
    </xsl:template>
    <xsl:template match="li">
        <li id="{concat(../../@id, '-', @reqref)}">
            <b>
                <a href="#{@reqref}">
                    <xsl:value-of select="id(@reqref)/title"/>
                </a>
                <xsl:text>: </xsl:text>
            </b>
            <xsl:apply-templates select="node()"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
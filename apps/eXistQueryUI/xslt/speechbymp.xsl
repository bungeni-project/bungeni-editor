<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:an="http://www.akomantoso.org/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="an xs" version="2.0"><xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="yes"/><xsl:template match="/"><div class="results"><xsl:apply-templates/></div></xsl:template><xsl:template match="matches"><div class="toc"> Click to move to debates : <xsl:call-template name="toc"/></div><xsl:apply-templates select="debate"/></xsl:template><xsl:template match="uri"/><xsl:template name="toc"><xsl:for-each-group select="//debate" group-starting-with="debate"><xsl:apply-templates select="." mode="toc"/></xsl:for-each-group></xsl:template><xsl:template match="debate" mode="toc"><xsl:variable name="debateDateTOC" select="tokenize(@from,'/')"/><a href="#{$debateDateTOC[4]}">debate - <xsl:value-of select="$debateDateTOC[4]"/></a>&#160;
        </xsl:template><xsl:template match="debate"><xsl:variable name="debateDate" select="tokenize(@from,'/')"/><xsl:variable name="debateDateasXsDate" select="format-date(xs:date($debateDate[4]),'[D01] [MNn] [Y0001]')"/><div class="debate"><a name="{$debateDate[4]}"><h2>Debate record from -  <xsl:value-of select="$debateDateasXsDate"/></h2></a><xsl:apply-templates select="doc"/></div></xsl:template><xsl:template match="doc"><xsl:apply-templates select="speech"/></xsl:template><xsl:template match="speech"><xsl:apply-templates select="from"/><xsl:apply-templates select="p" mode="fromSpeech"/></xsl:template><xsl:template name="from" match="from"><p><em>
           From: <xsl:value-of select="."/></em></p></xsl:template><xsl:template match="p" mode="fromSpeech"><cite><xsl:value-of select="."/></cite></xsl:template></xsl:stylesheet>
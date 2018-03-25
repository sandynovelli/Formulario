<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <!--<xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>-->
    <xsl:for-each select="Screen/Row">
      <div class="row">
        <xsl:for-each select="Column">
          <p class="col-md-4">
            <xsl:for-each select="Textbox">
              <span>
                <xsl:value-of select="@label"/>
              </span>
              <input type="text">
                <xsl:attribute name="name">
                  <xsl:value-of select="@name"/>
                </xsl:attribute>
                <xsl:attribute name="maxlength">
                  <xsl:value-of select="@max-length"/>
                </xsl:attribute>
              </input>
            </xsl:for-each>
            <xsl:for-each select="Numericbox">
              <span>
                <xsl:value-of select="@label"/>
              </span>
              <input type="number">
                <xsl:attribute name="name">
                  <xsl:value-of select="@name"/>
                </xsl:attribute>
              </input>
            </xsl:for-each>
            <xsl:for-each select="LabelElement">
              <xsl:choose>
                <xsl:when test="@type='small'">
                  <small>
                    <span>
                      <xsl:value-of select="@label"/>
                    </span>
                  </small>
                </xsl:when>
                <xsl:when test="@type='medium'">
                  <medium>
                    <span>
                      <xsl:value-of select="@label"/>
                    </span>
                  </medium>
                </xsl:when>
                <xsl:otherwise>
                  <big>
                    <span>
                      <xsl:value-of select="@label"/>
                    </span>
                  </big>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="Button">
              <input type="submit" class="btn btn-default">
                <xsl:attribute name="name">
                  <xsl:value-of select="@name"/>
                </xsl:attribute>
                <xsl:attribute name="value">
                  <xsl:value-of select="@label"/>
                </xsl:attribute>
              </input>
            </xsl:for-each>
          </p>
        </xsl:for-each>
      </div>
    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>

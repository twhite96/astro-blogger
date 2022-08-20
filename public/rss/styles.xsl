<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title><xsl:value-of select="/rss/channel/title"/> Web Feed</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <style type="text/css">
        html{font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";font-size:18px}
        body{margin:5rem auto;max-width:750px;background-color:black;color:white}
        article,aside,details,figcaption,figure,footer,main,menu,nav,section {display:block}
        header{display:flex;}
        header img{height:200px;width:200px;border-radius:50%;margin:0 1rem;border:5px solid rgb(18, 155, 215);}
        header h1{color:rgb(194, 207, 243)}
        header h2, header h3{text-align:center;color:rgb(99, 183, 75);font-style:italic}
        summary {display:list-item}
        audio,canvas,progress,video {display:inline-block}
        audio:not([controls]) {display:none;height:0}
        progress {vertical-align:baseline}
        [hidden],template {display:none!important}
        a,a:active{color:rgb(194, 207, 243)}
        b,strong{font-weight:inherit}
        b,strong{font-weight:bolder}
        dfn{font-style:italic}
        h1 {font-size: 4rem;margin:0}
        .description{margin:0 0 2rem}
        .website_link{text-align:center;margin:1rem;}
        .head_link, .head_link a:visited{text-decoration:none;color:rgb(194, 207, 243)}
        .recent{width:100%;color:rgb(146, 142, 142);background-color:rgb(46, 45, 45);margin:1rem 0 2rem;padding:0 2rem;border-radius: 30px;}
        .item_link, .item_link a:visited{color:rgb(194, 207, 243);}
        small{opacity:.55}
        hr{color:rgb(194, 207, 243)}
      </style>
      </head>
      <body>
        <div>
          <header>
            <div>
            <img src="/images/john-siracusa-pixels.png" />
            </div>
            <div>
            <h1><xsl:value-of select="/rss/channel/title"/></h1>
            <p class="description"><xsl:value-of select="/rss/channel/description"/></p>
            <h2>This is an RSS feed!</h2>
            <div class="website_link">
            <a class="head_link" target="_blank">
              <xsl:attribute name="href">
                <xsl:value-of select="/rss/channel/link"/>
              </xsl:attribute>
              Visit Website &#x2192;
            </a>
            </div>
            </div>
          </header>
          <hr/>
          <xsl:for-each select="/rss/channel/item">
            <div>
              <h2>
                <a class="item_link" target="_blank">
                  <xsl:attribute name="href">
                    <xsl:value-of select="link"/>
                  </xsl:attribute>
                  <xsl:value-of select="title"/>
                </a>
              </h2>
              <p><xsl:value-of select="description" /></p>
              <audio controls="true" preload="none">
                <xsl:attribute name="src">
                  <xsl:value-of select="enclosure/@url"/>
                </xsl:attribute>
              </audio>
              <p>
              <small>
                Published: <xsl:value-of select="pubDate" />
              </small>
              </p>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
  </xsl:stylesheet>
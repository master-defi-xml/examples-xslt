<?xml version="1.0"?>

<!-- Transformation pour obtenir une liste d'ingrédients à partir d'une recette 
      au modèle 'recette' (cf fichier d'exemple recette_penda_mbaye.xml) 
  NOTE : &#xa; est le caractère unicode « saut de ligne » (&#11;)
-->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
  <xsl:output mode="text"/>
  <xsl:template match="/">
    <xsl:apply-templates select="recette/liste_ingredients"/>
    <xsl:text>Boisson : &#xa;</xsl:text>
    <xsl:value-of select="recette/accord_boisson"/>
  </xsl:template>
  
  <xsl:template match="liste_ingredients">
    <xsl:text>Liste de course :</xsl:text>
    <xsl:text>&#xa;</xsl:text>
    <xsl:apply-templates select="ingredient"/>
    <xsl:text>(Fin de la liste)&#xa;</xsl:text>
  </xsl:template>
  
  <xsl:template match="ingredient">
    <xsl:text>- </xsl:text>
    <xsl:value-of select="@quantite"/>
    <xsl:value-of select="@unite"/> 
    <xsl:text> </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
  
</xsl:transform>

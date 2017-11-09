<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
  <!-- Transformation « identité » -->
  <xsl:template match="*|@*|text()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()|comment()|processing-instruction()"/>
    </xsl:copy>
  </xsl:template>

  <!-- -->
  <xsl:template match="recette">
    <xsl:copy>
    <!-- on commence par ajouter les attributs :
	 si on n'ajoute un attribut avant un noeud élément ou texte, on
	 obtient une erreur.
	 L'ordre des attributs n'a pas d'importance.
    -->
    <xsl:attribute name="duree">
      <xsl:value-of select="duree"/>
    </xsl:attribute>
    <xsl:attribute name="difficulte">
      <xsl:value-of select="difficulte"/>
    </xsl:attribute>
    <xsl:attribute name="source">
      <xsl:value-of select="source"/>

     
    </xsl:attribute>

    <!-- On ajoute ensuite les éléments restant.
	 Comme on s'appuie sur la règle de base de la transformation
	 identité, il seront reproduit tel qu'il existe dans le document d'origine.
    -->
    
    <xsl:apply-templates select="text() | titre | ingredient | etape | accord_boisson"/>
    </xsl:copy>
  </xsl:template>
  
  
</xsl:stylesheet>

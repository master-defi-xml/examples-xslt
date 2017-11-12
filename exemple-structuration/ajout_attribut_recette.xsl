<?xml version="1.0" encoding="utf-8"?>

<!-- =================================================== -->
<!-- MASTER DEFI 2 - XML - JP JORDA                      -->
<!-- 10/11/2017                                          -->
<!-- =================================================== -->
<!-- Des éléments deviennent des attributs :             -->
<!-- =======================================             -->
<!-- Le contenu textuel des éléments <duree>, <difficulte>
     et <source> est utilisé pour créer des attributs
     associés à l'élément racine <recette>.
     
     -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- on définie le format de sortie.
	 Note : ici ce n'est pas strictement nécéssaire, car c'est le format par défaut.
    -->
  <xsl:output encoding="utf-8" method="xml"/>
  
  <!-- Règle n°1 (Transformation « identité ») -->
  <xsl:template match="*|@*|text()">
      <xsl:copy>
	  <xsl:apply-templates select="*|@*|text()"/>
      </xsl:copy>
  </xsl:template>
  
  <!-- La règle n°2 sera prioritaires par rapport à la transformation « identité » (règle n°1),
       car plus précises (on « matche » des éléments par leur noms, au lieu d'utiliser '*').
  -->
  <!-- Règle n°2 -->
  <xsl:template match="recette">
      <!-- l'instruction 'copy' permet de copier l'élément recette (sans ses descendants ni ses attributs)
	   On aurait également pu mettre ici  <recette>...</recette> au lieu de <xsl:copy>....</xsl:copy>
      -->
      <xsl:copy>
	  <!-- on commence par ajouter les attributs :
	       (ajouter un attribut avant un noeud élément ou texte entrainerait une erreur).
	       Pour rappel, l'ordre des attributs n'a pas d'importance en XML. 
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
	  
	  <!-- On ajoute ensuite les éléments restants.
	       Comme on s'appuie sur la règle de base de la transformation
	       identité, ils seront reproduits tels qu'ils existent dans le document d'origine :
	       c'est la règle n°1 qui sera appliquée.
	       
	       Remarques :
	       * On utilise ici l'opérateur '|' (OU)
	       * On applique également la règle pour les nœuds de type texte : ce n'est pas
	         ici indispensable, mais cela permet de conserver l'indentation d'origine.
	  -->
    
	  <xsl:apply-templates select="text() | titre | nb_convive | ingredient | etape | accord_boisson"/>
      </xsl:copy>
  </xsl:template>
</xsl:stylesheet>

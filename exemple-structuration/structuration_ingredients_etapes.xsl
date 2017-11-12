<?xml version="1.0" encoding="utf-8"?>
<!-- =================================================== -->
<!-- MASTER DEFI 2 - XML - JP JORDA                      -->
<!-- 10/11/2017                                          -->
<!-- =================================================== -->
<!--
On place les éléments <ingredient> dans un élément
« container » <liste_ingredients>  et les éléments <etape>
dans un « container » <liste_etape>.

On ajoute également un attribut nb_convive à liste_ingredients,
en utilisant la valeur textuelle de l'élément <nb_convive>.

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- on défini le format de sortie.
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
  <xsl:template match="recette">
      <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="titre"/>
      <!-- Création dans l'arbre de sortie d'un élément <liste_ingredient> -->
      <liste_ingredient>
	  <!-- ajout de l'attribut nb_convive à l'élément liste_ingredient, en utilisant la
	       valeur de l'élément nb_convive -->
	  <xsl:attribute name="nb_convive">
	      <xsl:value-of select="nb_convive"/>
	  </xsl:attribute>
	  
	  <!-- ajout des éléments <ingredient> à <liste_ingredient>. C'est la transformation « identité » (règle n°1) qui sera
	       appliquée.
	       Ici on ne recopie pas les nœuds texte, donc on perd l'indentation, ce qui n'est pas grave (elle n'a aucune signification)  -->	  
	  <xsl:apply-templates select="ingredient"/>
	  
      </liste_ingredient>
      
      <!-- Création dans l'arbre de sortie d'un élément <liste_etapes> -->
      <liste_etapes>
	  <!-- ajout des éléments <etape> à <liste_etapes>. C'est la transformation « identité »  (règle n°1) qui sera  appliquée -->
	  <xsl:apply-templates select="etape"/>
      </liste_etapes>

      <!-- On reproduit l'élément accord_boisson (règle n°1 appliquée)-->
      <xsl:apply-templates select="accord_boisson"/>
      </xsl:copy>
  </xsl:template>
</xsl:stylesheet>

# Exemple d'amélioration de la structuration d'un document via des feuilles de style XSLT 1.0

### JP JORDA - MASTER 2 DÉFI - Université PARIS NANTERRE

## Présentation

Le fichier XML `recette_pas_structuree.xml` est un exemple de recette dont la structuration est pauvre : 
peu d'attributs et un seul niveau hiérarchique. On va utiliser des transformations XSLT pour améliorer cette structuration.
Le résultat que l'on veut obtenir est dans le fichier  `recette_structuree_indentee.xml`.


Ces transformations définissent :

- une règle de base : la transformation « identité », qui permet, en l'absence de règle plus spécifiques, de reproduire récursivement l'arbre d'entrée dans l'arbre de sortie ;
- une ou des règles spécifiques, prioritaires par rapport à la règle « identité », pour modifier les éléments. 

Les deux feuilles de style (`ajout_attributs_recette.xsl` et `structuration_ingredients_etapes.xsl`) sont largement commentées.


## Lancement des transformations 

La transformation vers le format désiré se fait en trois étapes, la dernière servant uniquement à obtenir un xml plus lisible. 
Ces commandes sont à lancer dans la console, en se plaçant dans le répertoire contenant les feuilles de styles et le fichier `recette_pas_structuree.xml`.

1.  Ajout d'attributs  à l'élément racine `<recette>` : 

	xsltproc ajout_attributs_recette.xsl recette_pas_structuree.xml > recette_1.xml
	
2. 	Ajout d'éléments « containers » : 

	xsltproc structuration_ingredients_etapes.xsl recette_1.xml > recette_structuree.xml
	
3.  Formatage du xml pour qu'il soit plus lisible par un humain :

	xmllint -format  recette_structuree.xml > recette_structuree_indentee.xml

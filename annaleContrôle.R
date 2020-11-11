# Annale contrôle


## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
##                                                                            ##
## AVANT DE CONTINUER : changer le nom du fichier en remplacant "votre-nom"   ##
##                      par votre nom (pas de prenom, toute en minscules).    ##
##                                                                            ##
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 


## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
##                                                                            ##
##                             Q U E S T I O N S                              ##
##                                                                            ##
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 

## Questions ####
# Répondez brièvement (5 lignes max) à chacune des questions suivante. Respectez 
# la mise en forme du fichier : si votre réponse est un commentaires utilisez le 
# caractère "#" en début de ligne et ne dépassez pas les 80 caractères par 
# ligne.


## ___Q1. #### 
## Expliquez le concept de fléau de la dimension
# Le fléau de la dimension est un terme pour décrire le phénomène observé qui est que 
# lorsque le nombre de dimensions augmente, le volume de l'espace croît rapidement si bien 
# que les données se retrouvent « isolées » et deviennent éparses. Cela est problématique 
# pour les méthodes nécessitant un nombre significatif de données pour être valides, 
# les rendant alors peu efficaces voire inopérantes.

# Exemples imaginons que nous avons un cube unité [0,1]^D en divisant l'espace selon 
# chaque dimension par 10. Pour couvrir tous l'espace D nous devons avoir 10^D points. 
# ce qui croit exponentionnellement en fonction de la dimension
power10 = function(D){
  return(10^D)
}
y = array( data = power10(c(1,2,3,4,5)))
plot(x = c(1,2,3,4,5), y=y )

## ___Q2. #### 
## Comment les techniques de réduction de la dimension peuvent-elles aider à 
## surmonter le fléau de la dimension.
# Les techniques de réduction de la dimension comme leur nom l'indique peremettent 
# de trouver des relations de différentes natures entre les données pour pouvoir 
# ensuite les projetés dans un espace de dimension réduit interprétable
#Pas sur : Avec le fléau de la dimension vient le fait que plus la dimension est 
#grande plus a donnée a de chance d'être éparse.
#Le fait est aussi que parfois des espaces de dimensions intrinsèques sont plongés 
# dans des ensembles de dimensions plus grands. Ce qui veut dire que l'on pourrait 
# décrire de manière convenable les données dans cette espace de grande dimension 
# dans un espace plus petit (l'espace de dimension intrinsèque)

## ___Q3. ####
## Le code ci dessous crée quatre graphiques. Expliquez- les.
x <- c(rnorm(20, 0, 0.5), rnorm(20, 1, 0.5))
layout(matrix(1:3, 1))
plot(density(x, bw = 0.1))
plot(density(x, bw = "nrd0"))
plot(density(x, bw = 5))
#typiquement le TP 1 + cours 1 !! il faut comprendre ces histoires de densité
#On a un jeu de donnée et on cherche une fonction de densité qui expliquerait bien 
#les observations. 
#On va utiliser la méthode du Kernel density estimation. 
#Je ne sais pas si la fonction density utilise cette technique
#mais en tout cas l'ajustement de h ou de bd est essentiel pour avoir une bonne densité. 
#Comment savoir lorsque l'on a le bon h ou bd ? 
#la bd utilisée dans la fonction density doit être de l'ordre de la sd des données fournies.
# --> Il y a une slide en fait sur ça !!! dernière slide du cours 1. 
#if f and K are normal : whe have a formula for h based on standard deviation
#An other methods is by CV with a special score function. 
#Then use argmin on the score function maybe for the better founded 
#par défaut le kernel utilisé est un kernel gaussien dans la fonction density

## ___Q4. ####
# Mentionnez une technique de réduction de la dimension qui conserve les 
# distances entre points de manière locale et une qui les conserve de manière 
# globale. Dans quel cas utiliseriez vous l’une ou l’autre ? 

# MST : conserve les distances de manière locale je crois ?
# TP5 LLE : Local Linear Embeddings



## ___Q5. ####
# Un collègue vous sollicite pour estimer la dimension intrinsèque d’un jeu de 
# données. Expliquez lui en 5 lignes la différence entre une estimation par ACP
# et une par  la dimension  de la corrélation (correlation dimension)

# très important ça !!
# Nous avons vu que l'ACP entrainée des problèmes pour certains ensembles de points
# caculer la dimension de coorélation peut-être une meilleure stratégie dans certains cas. 
# tout dépend en fait si les ... entretiennent des relations linéaires ou non linéaires entre eux
# si relaton linéaire = alors ACP fonctionne très bien 
# sinon il est préférable d'utiliser une estimation par la dimension de corrélation. 
# En effet la dimension de corrélation est une méthode plutôt non maramétrique qui va estimer 
# de manière itérative la dimension. 
# estimation pas dimension de corrélation : 
# ...


## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
##                                                                            ##
##                             E X E R C I C E S                              ##
##                                                                            ##
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 

## Exercicies ####
# Charger le jeu de données ci joint
data(iris)

## ___a. Determiner le nombre de variables et des observations ####


## ___b. Estimer la dimension par ACP (normée) ####


## ___c. Idem pour la correlation dimension ####


## ___d. Idem pour un ACP à noyau (utiliser le noyau gaussien) ####


## ___e. Obtenir un MDS classique #### 
## Utiliser l'estimation de la dimension la plus pertinente parmi celle 
## calculeés.


## ___f. Obtenir un LLE ####
## Utiliser l'estimation de la dimension la plus pertinente parmi celle 
## calculeés.
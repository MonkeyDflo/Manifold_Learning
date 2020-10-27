#lab1
#Florent Jakubowski

# Manifold Learning
# Lab x001 : Simulation et estimation de la densité
# Jairo Cugliari
# S1 2018–2019

# 1 Simulation par la méthode de rejet ####
# 1.1. Écrire sur R la fonction f_tri(x) que calcule la valeur de la densité f(x) d’une variable aléatoire ####
# triangulaire sur [0,2] pour l’argument x donné en entrée.

# 1.2. Écrire sur R la fonction rejection(f, a, b, M) qui simule une valeur de la densité f en utilisant la ####
# méthode de rejet. Nous supposons que f est une densité à support sur le segment [a,b] et qu’elle est
# majorée uniformément sur son support par M.

# 1.3. Simuler 1000 réalisations d’une variable aléatoire triangulaire en utilisant la fonction écrite dans le ####
# point précédent. Sauvegarder les valeurs simulés dans un fichier de texte (on les utilisera par la suite).

# 2 Estimation de la densité par histogramme ####

# 2.1. Générer un échantillon X1,...,Xn de taille n=100 où XiTriangulaire(0,2). ####
#loi triangulaire 

#fonction triangulaire
f_tri <- function(x) {
  SUP01 <- (0<=x) & (x<1)
  SUP12 <- (1<=x) & (x<2)
  if (SUP01){
    return(x)
  } else {if(SUP12){
    return(2-x)
  } else {
    return(0)
  }
  }
}

#nombre d'échantillon
n <- 100

#Vectorisation de f_tri
# Vectorize(FUN, vectorize.args = arg.names, SIMPLIFY = TRUE,
#           USE.NAMES = TRUE)
f_tri_vect <- Vectorize(FUN = f_tri )
echantillon <- f_tri_vect(runif(n, min=0, max=1))

# 2.2. Utiliser la fonction hist de R pour estimer la densité de l’échantillon. Comparer le résultat de ####
# l’estimation quand l’on fait varier le nombre de classes m. En particulier utiliser les valeurs heuristiques
# : m=1+10ln(n)/3 et m=sqrt(n).

#classes <- seq(min(echantillon), max(echantillon), length = 4)
?hist
hist(echantillon)
lines(density(echantillon))

hist(echantillon, nclass = 3)
lines(density(echantillon))

#m=1+10ln(n)/3
m <- 1 + (10*log(n))/3
hist(echantillon, nclass = m)
lines(density(echantillon))

#m=sqrt(n)
m <- sqrt(j)
hist(echantillon, nclass = m)
lines(density(echantillon))

#avec seq 
hist(echantillon, breaks = seq(min(echantillon), max(echantillon), length=100))
lines(density(echantillon))

# 3 Estimation de la densité par noyau ####

# 3.1. Générer un échantillon X1,...,Xn de taille n=100 où XiTriangulaire(0,2). ####
#fonction triangulaire
f_tri_3 <- function(x) {
  SUP01 <- (0<=x) & (x<1)
  SUP12 <- (1<=x) & (x<2)
  if (SUP01){
    return(x)
  } else {if(SUP12){
    return(2-x)
  } else {
    return(0)
  }
  }
}

#nombre d'échantillon
n <- 100

f_tri_vect_3 <- Vectorize(FUN = f_tri_3)
echantillon_3 <- f_tri_vect_3(n)

#test avec l'histogramme
hist(echantillon_3)

# 3.2. Utiliser la fonction density de R pour estimer la densité de l’échantillon. Comparer le résultat de ####
# l’estimation quand l’on fait varier la largeur de fenêtre h. En particulier utiliser les valeurs heuristiques
# : h=1.06ˆn−1/5 où ˆ=min{ˆs,IQR/1.34} et ˆs est l’écart type des données.

?density

# 3.3. Écrire sur R la fonction riskkde(obs, h) qui estime le risque J de l’estimateur à noyau de la densité ####
# avec une largeur de fenêtre h (cf. équation 6.35 dans Wasserman (2006) pour la formule).

# 3.4. Estimer la courbe de risque J(h). Comparer la valeur de h=argminJ(h) avec la valeurs heuristiques ####
# pour h.

# 4 Exercices additionnels ####
# Old Faithful geiser Utiliser les données faithful du paquet datasets. Nous voulons estimer la
# densité des variables waiting et eruptions.

# 4.1. Utiliser l’estimateur à noyau pour estimer chacune des densités marginales (i.e. de manière individuelle) ####

# 4.2. Il est possible d’estimer la densité conjointe des deux variables. Explorer les options données par les ####
# packages ks et hexbin.

# 5 Lectures recommandés.
# – All of Nonparametric Statistics (2006) L. Wasserman, Chapitre 6
# 1
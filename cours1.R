#cours 1 Manifold Learning

# Infos.1 : Pour changer l'encoding ...####

# Exemple 1 ####
#je génère des x selon une loi
#J'envoie les x à une autre personne 
#comment fait elle pour retoruver la loi de densité ? 

#X1, X2, _____, Xn
#Je cherche la normalité 
#N(mu, sigma_carré)
#mu_chapeau = 1/n somme des Xi 
#sigma_chapeau_carré = 1/(n-1) somme des (X-X_bar)^2

#tests de normalité : 
#Kolmogarov-Smirrof
#Shapiro 
#Darling

# Q : Comment fait-on pour estimer la loi de densité si nous n'avons pas de normalité ? #### 

data("faithful")

boxplot(data("faithful"))

#diagramme de piche et de feuilles
stem(faithful$eruptions)

# suite cours ####
# 1. histogramme ####
#estimateur à saut
#pas continue
#pas dérivable à droite et à gauche de certains points.

# 2. polynôme de fréquence ####
#estimateur linéaire par morceau
#continue 
#pas dérivable 
# + de régularité

# 3. estimateur à noyaux ####



#KDE ####
#K = noyau 
#h = largeur de fenêtre
# On remplace les masses de proba par une esti étalée autour du point
# Estimateur globale = somme de chacune des densités locales
#K = peut etre assimilée à une loi de proba

# Pour bien estimer h ####
# perte quadratic #

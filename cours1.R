#cours 1 Manifold Learning

# Infos : Pour changer l'encoding ...####

#exemple 1 ####
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

#Comment fait-on pour estimer la loi de densité si nous n'avons pas de normalité ? #### 

data("faithful")

boxplot(data("faithful"))

#diagramme de piche et de feuilles
stem(faithful$eruptions)
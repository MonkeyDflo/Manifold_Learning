# TP5 
# Florent Jakubowski

# 1 Application sur des variétés développables ####
#   1. Charger les données swissroll. ####
#   2. Obtenir une configuration par MDS classique à partir de la matrice de distances. ####
#   3. Examiner les valeurs singulières de la décomposition spectrale. Combien de dimensions sont-ils nécessaires ####
# pour représenter ces données ?
#   4. Obtenir la matrice de distances sur la configuration projetée sur le plan principal ####
#(i.e. celui formé par les deux premières dimensions).
#   5. Obtenir une configuration par Isomap à l’aide du package vegan. ####
#   6. Examiner les valeurs singulières de la décomposition spectrale. Combien de dimensions sont-ils nécessaires ####
# pour représenter ces données selon Isomap?



#
#
# 2 ACP vs ACP à noyau ####
#   1. Simuler un jeu de données contenant deux anneaux concentriques. ####
#   2. Obtenir la projection des points par ACP (linéaire). ####
#   3. Idem pour un ACP à noyau (non linéaire) en utilisant les noyaux gaussien et le lineaire. ####
# Exercice d’application : détection automatique de chiffres ####
#   1. Les données sont un sous ensemble du jeu de données MNIST Télécharger les données à utiliser. ####
#   2. Charger les données avec R. Observer que chaque ligne code un chiffre. ####
#   3. Écrire une fonction R qui permette transformer une ligne de la base en matrice. Ainsi, vous pourrez ####
# visualiser les chiffres à l’aide de la fonction image. 
#   4. Faire un ACP sur le sous ensemble des données qui correspondent au chiffre ####
#   5. Quels sont les modes de variation principaux du chiffre 3? ####
#   6. Utiliser une classification de type kmeans pour apprendre 10 prototypes. ####
# Examiner la qualité de la classification.
#   7. Utiliser une classification de type spectrale pour apprendre 10 prototypes.#### 
#Examiner la qualité de la classification.
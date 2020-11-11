#Lab 4 
#05/11/2020
#défi ####
#6.6 Wasseran Algo de densité
# Correction du challenge (section 6.6 Wasserman)

# Processus generateur de données
donnees <- rchisq(1000, df = 4)

# But: estimer la densite de données en utilisant une tech supervisée

# Y_j = \sqrt(k/n) * \sqrt(N_j + 1/4)
# x_t = mid point de classes

n <- length(donnees)
k <- 50 # nb de classes
h <- hist(donnees, breaks = k)

Y <- sqrt(k / n) * sqrt(h$counts + 1/4)
X <- h$mids

plot(X, Y)

Ylisse <- smooth.spline(X, Y) # lissage du nuage de points (r)
lines(Ylisse, col = "red")

# 1 MDS et ACP ####
# 1. Écrire l’algorithme de positionnement multidimensionnel classique. ####
#   Algo ####
# 1. If available data consists of vectors gathered in Y, then
# center them, compute the pairwise scalar products
# S  YTY, and go to step 3.
# 2. If available data consists of pairwise Euclidean distance,
# transform them into scalar products :
#   ◦ Square the distances and build D
# ◦ Perform the double centering of D, this yields S
# 3. Compute the eigenvalue decomposition S  UΛUT
# 4. A s−dimensional representation is obtained by computing
# the product X«  Is×NΛ1/2UT
#   Implem Algorithme de positionnement multidimensionnel ####
#lire les données du csv
MatriceDistFromCSV = as.matrix(read.csv("distfr.csv"))
MatriceDistFromCSV2 = as.matrix(read.csv2("distfr.csv", sep = ','))
VectorDistNumeric = as.numeric(MatriceDistFromCSV[,2:ncol(MatriceDistFromCSV)])
MatriceDist = matrix( data = VectorDistNumeric, nrow = 28, ncol = 28)

# we need S and D
# 2 cas : 1. on a la matrice S, 2. on a pas la matrice S mais on a D, ici nous n'avons que la matrice des distances euclidiennes = sqrt(D)
#Square the distances and build D
library(matrixcalc)
D = matrix.power(x = MatriceDist, 2)
#Perform the double centering of D, this yields S
#colmeans calculation
N = ncol(MatriceDist)
colMeans = matrix( data = rep(NA, (N*N)), ncol = N, nrow = N)
for(i in 1:N){
  colMeans[,i] = mean(MatriceDist[,i])
}
#rowmeans calculation
rowMeans = matrix( data = rep(NA, (N*N)), ncol = N, nrow = N)
for(i in 1:N){
  rowMeans[i,] = mean(MatriceDist[i,])
}
# Gramm matrix calculation
SGrammV1 = (-1/2) * (D - colMeans - rowMeans + mean(D) )
# Svd & co 
svdSGrammMatrixV1 <- svd(SGrammV1)
XhatV1 <- diag(sqrt(svdSGrammMatrixV1$d[1:2])) %*% t(svdSGrammMatrixV1$v[, 1:2])

#   correction 1. ####
data_coor <- matrix(runif(4 * 10), ncol = 10)
data_dist <- dist(t(data_coor))

MDScorrection <- function(data, s = 2) {
  if(is(data, "dist")) {
    D <- as.matrix(data)^2
    N <- nrow(D)
    rMeans <- matrix(rowMeans(D), ncol = N, nrow = N)
    cMeans <- matrix(colMeans(D), ncol = N, nrow = N, byrow = TRUE)
    S <- - 0.5 * (D - rMeans - cMeans + mean(D))
  } else {
    Y <- scale(data, center = TRUE, scale = FALSE)
    S <- t(Y) %*% Y
  }
  svdS <- svd(S)
  Xhat <- diag(sqrt(svdS$d[1:s])) %*% t(svdS$v[, 1:s])
  return(Xhat)
}

# TEST : compare result with cmdscale
t(MDScorrection(MatriceDist, 2))
cmdscale(MatriceDist, 2)
cbind(t(MDScorrection(MatriceDist, 2)),
      cmdscale(MatriceDist, 2))

#   Nouvelle version ####
MDSsecondVers <- function(data, s = 2) {
  if(is(data, "dist")) {
    D <- as.matrix(data)^2
    N <- nrow(D)
    rMeans <- matrix(rowMeans(D), ncol = N, nrow = N)
    cMeans <- matrix(colMeans(D), ncol = N, nrow = N, byrow = TRUE)
    S <- - 0.5 * (D - rMeans - cMeans + mean(D))
  } else {
    Y <- scale(data, center = TRUE, scale = FALSE)
    S <- t(Y) %*% Y
  }
  svdS <- svd(S)
  Xhat <- diag(sqrt(svdS$d[1:s])) %*% t(svdS$v[, 1:s])
  return(Xhat)
}

cbind(t(MDSsecondVers(MatriceDist, 2)),
      t(MDScorrection(MatriceDist, 2)),
      cmdscale(MatriceDist, 2))
# 2. Tester votre code avec un jeu de données simulées de taille réduite. ####
?
# 3. Comparer le coordonnées obtenues par votre code et celles d’un ACP normée. ####
#mcclust ? 

# test ####
matrixTest = matrix(data = c(1,2,3,1,2,3,1,2,3), ncol = 3)
matrix(data = colMeans(matrixTest), ncol = 3, nrow = 3)
matrix(data = rowMeans(matrixTest), ncol = 3, nrow = 3)

for(i in 1:3){
  
}


# Exo 2 ####



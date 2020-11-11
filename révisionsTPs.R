rnorm(100)
hist(rnorm(100, sd=1), nclass = 31)
hist(rnorm(100), breaks = 20)
plot(density(rnorm(100, sd=100), bw=100))
plot(density(rnorm(100, sd=100), bw="SJ"))
plot(density(rnorm(100, sd=100), bw=50))
plot(density(rnorm(100, sd=100), bw=10))

k <- 100
D <- 2
# Construction du jeu de donn?es
mat <- matrix(rnorm(k * D), ncol = D)
# Calcul de la norme par ligne
res2 <- sqrt(rowSums(mat^2))
# Visu de r?sultats
hist(res2)
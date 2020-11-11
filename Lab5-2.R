# Lab 5 

n <- 1000 # Random position on the parameteric domain.
u <- matrix(runif(2 * n), ncol = 2)

v <- 3 * pi / 2 * (0.1 + 2 * u[, 1])

x <- -cos(v) * v
y <- 20 * u[, 2]
z <- sin(v) * v


swissroll <- cbind(x, y , z)
plot3d(swissroll[order(v), ], col = rainbow(n), size = 10)
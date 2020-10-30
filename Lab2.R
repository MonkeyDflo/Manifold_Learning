#Lab2 
#30/10/2020
#Florent Jakubowski

#Ex1 ####

#charger minimist 
#couper les lignes en vecteurs
#charger l'image

minimist = as.matrix(read.table("data.txt"))
dim(minimist)
p = sqrt(784)
minimist[1,] #couper ce vecteur en p lignes
chiffreHandWritted = matrix(data = NA, nrow = p, ncol = p)
for(i in 1:p){
  for(j in 1:p){
    chiffreHandWritted[i,j] = minimist[11,(i+j)]
    print(minimist[11,(i+j)])
  }
}
image(chiffreHandWritted, col = grey(256:1/256))
image(chiffreHandWritted)

#correction du prof ####
p = sqrt(784)
image(matrix(minimist[11, ], p)[, p:1],
             col = grey(256:1/256))

#fonction show digit ####
showDigitinMNIST = function(idOfLine){
  minimist = as.matrix(read.table("data.txt"))
  line = minimist[idOfLine, ]
  bord = sqrt(length(line)) #racien carré de longueur de line
  handWrittenDigit = matrix(as.numeric(line), bord)[, bord:1] #?
  image(handWrittenDigit, col = grey(256:1/256)) #?
}

showDigitinMNIST(230)

i = 100; 
showDigit(minimist[i, ]);
labels$v1[i];
rm(i);

all3 = minimist[labels == 3, ]

cte = which(apply(all3, 2, sd)==0) #apply calcul sur les colonnes de all3, calcule l'écart type colonne par colonne
#qui donne des valeurs correspondant
pca3 = prcomp(scale(all3[, -cte]))
plot(pca3$rotation[, 1:2])

identify(pca3$rotation[, 1:2])

# Ex3 ####


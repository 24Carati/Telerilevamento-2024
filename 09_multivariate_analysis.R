# l'analisi multivariata serve per correlare più dati in diverse dimensioni
# multivariate analysis

library(imageRy)
library(terra)
# install.packages("viridisLite")
# library(viridisLite)
# install.packages("viridis")
library(viridis)

#importiamo l'immagine delle dolomiti delle tofane
b2 <- im.import("sentinel.dolomites.b2.tif") # blue
b3 <- im.import("sentinel.dolomites.b3.tif") # verde
b4 <- im.import("sentinel.dolomites.b4.tif") # rosso
b8 <- im.import("sentinel.dolomites.b8.tif") # vicino infrarosso

sentdo <- c(b2, b3, b4, b8)

im.plotRGB(sentdo, r=4, g=3, b=2)
im.plotRGB(sentdo, r=3, g=4, b=2)

# genero grafici sui dati e vedo correlazione e causalità di esse
pairs(sentdo)

# vogliamo raggruppare le quattro bande in un solo grafico
# PCA (principal component analysis)

pcimage <- im.pca(sentdo)

# 1606.29190  635.17652   51.35061   32.30407 sono i valori delle quattro bande

tot <- sum(1606.29190, 635.17652, 51.35061, 32.30407)

#percentuali sul peso dei campioni sulla varianza
c1 <- 1606.29190 * 100 / tot
c2 <- 635.17652 * 100 / tot
c3 <- 51.35061 * 100 / tot
c4 <- 32.30407 * 100 / tot

# plottiamo i dati

plot(pcimage, col=viridis(100))
plot(pcimage, col=plasma(100))

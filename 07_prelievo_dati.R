# come importare un dato esterno in R
library(terra)
library(imageRy)
# visto che lavoriamo con un file ".nc" usiamo la libreria seguente:
# install.packages("RNetCDF")
library(RNetCDF)

# in questo caso richiamiamo l'immagine con il suo percorso
setwd("C:/Users/franc/Desktop/Università/Esami/M. Telerilevamento")

# la funzione "rast" importa il file
eclissi <- rast("eclissi.png")
# se viene fuori un avvertimento con scritto "unknown extent" esce solo perche il programma
#non conosce la sua estensione

# plotta i dati e visualizziamo la foto in RGB
plotRGB(eclissi, 1, 2, 3)
# cambiando la posizione delle bande cambia la posizione dei colori
plotRGB(eclissi, 2, 1, 3)
plotRGB(eclissi, 3, 2, 1)
plotRGB(eclissi, 2, 3, 1)
plotRGB(eclissi, 1, 3, 2)
plotRGB(eclissi, 3, 1, 2)

# metodi diversi di plotting
par(mfrow=c(1,2))
plotRGB(eclissi, 2, 1, 3)
im.plotRGB(eclissi, 2, 1, 3)
# vengono leggermente diverse perche hanno un diverso stretch lineare

# esercizio con una immagine scaricata da internet
vulcano <- rast("vulcano.webp")
par(mfrow=c(4,3))
plotRGB(vulcano, 1, 2, 3)
plotRGB(vulcano, 2, 1, 3)
plotRGB(vulcano, 3, 2, 1)
im.plotRGB(vulcano, 1, 2, 3)
im.plotRGB(vulcano, 2, 1, 3)
im.plotRGB(vulcano, 3, 2, 1)
plotRGB(vulcano, 1, 3, 2)
plotRGB(vulcano, 3, 1, 2)
plotRGB(vulcano, 2, 3, 1)
im.plotRGB(vulcano, 1, 3, 2)
im.plotRGB(vulcano, 3, 1, 2)
im.plotRGB(vulcano, 2, 3, 1)

# prendo un dato da copernicus, importiamo il dato, e vediamo l'immagine
soil <- rast("c_gls_SSM1km_202404160000_CEURO_S1CSAR_V1.2.1.nc")
plot(soil)
plot(soil[[1]])

# cropping data e cioe taglio una zona precisa di interesse
ext <- c(25, 35, 58, 62)
soilcrop <- crop(soil, ext)
plot(soilcrop)

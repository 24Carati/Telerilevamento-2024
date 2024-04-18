# come importare un dato esterno in R
library(terra)
library(imageRy)

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
par(mfrow=c(2,3))
plotRGB(vulcano, 1, 2, 3)
plotRGB(vulcano, 2, 1, 3)
plotRGB(vulcano, 3, 2, 1)
plotRGB(vulcano, 2, 3, 1)
plotRGB(vulcano, 1, 3, 2)
plotRGB(vulcano, 3, 1, 2)


# come importare un dato esterno in R
library(terra)
library(imageRy)

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
par(mfrow=c(2,3))
plotRGB(vulcano, 1, 2, 3)
plotRGB(vulcano, 2, 1, 3)
plotRGB(vulcano, 3, 2, 1)
plotRGB(vulcano, 2, 3, 1)
plotRGB(vulcano, 1, 3, 2)
plotRGB(vulcano, 3, 1, 2)



# spectral index

library(imageRy)
library(terra)

# lista di files, prese dalle librerire precedenti. In questo caso sono delle immagini
im.list()

# importare una immagine
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# Bands
# Band 1 = NIR 
# Band 2 = red
# Band 3 = green

# plottiamo i dati
im.plotRGB(m1992, r=1, g=2, b=3)

# NIR sul green
im.plotRGB(m1992, 2, 1, 3)

# NB. le due scritture sopra (con uguale e senza) sono indifferenti

# NIR sul blu, rende il suolo nudo giallo che salta meglio all'occhio
im.plotRGB(m1992, 3, 2, 1)

# immagine del 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# mettiamo le due immagini a confornto con una riga e due colonne
par(mfrow=c(1,2))
im.plotRGB(m1992, 1,2,3)
im.plotRGB(m2006, 1,2,3)

# con questo comando puliamo da tutti i lavori precedenti
dev.off()

# generiamo l'immagine con il verde principale
im.plotRGB(m2006, 2, 1, 3)

# generiamo l'immagine con il blu principale
im.plotRGB(m2006, 3, 2, 1)

# ora mettiamo tutte e sei le immagini assieme
par(mfrow=c(2,3))
im.plotRGB(m1992, 1, 2, 3) # NIR on red
im.plotRGB(m1992, 2, 1, 3) # NIR on green
im.plotRGB(m1992, 3, 2, 1) # NIR on blue
im.plotRGB(m2006, 1, 2, 3) # NIR on red
im.plotRGB(m2006, 2, 1, 3) # NIR on green
im.plotRGB(m2006, 3, 2, 1) # NIR on blue


#-------

# calcoliamo la DVI (Difference Vegetation Index) - se è un pixel vegetato 
# avremo un valore alto (da -255 a 255) dipende dalla risoluzione radiometrica
dvi1992 = m1992[[1]] - m1992[[2]] # procedimento 1
# questa sotto è equivalente al procedimento 1
m1992$matogrosso_l5_1992219_lrg_1 - m1992$matogrosso_l5_1992219_lrg_2 
# il dollaro collega il nome al oggetto appartenente al vettore
dvi1992 # così mi da i valori

cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

# ora calcoliamo il DVI del 2006
dvi2006 = m2006[[1]] - m2006[[2]]
dvi2006
plot(dvi2006, col=cl)

# mettiamo le due immagini a fianco (ricorda sempre che il primo numero 
# sono le righe e il secondo le colonne)
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

# come si fa se ho immagini una a 4 bit e una a 8 bit? cambio indice con cui lavorare
# questo nuovo indice si chiama NDVI ed è una normalizzazione
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
ndvi1992
ndvi2006


par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
# ora i valori di massimo e di minimo sono normalizzati da 1 a -1

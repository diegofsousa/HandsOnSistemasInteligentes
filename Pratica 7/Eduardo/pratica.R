library("ripa")
library("jpeg")

imagem <- readJPEG("Pansy.jpeg")

plot(imagem, useRaster = TRUE)


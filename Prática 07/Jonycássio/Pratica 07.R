

#==========================PACOTES==================================

library(jpeg)
library(ripa)

#==========================IMAGEM===================================

img <- readJPEG("SoftPurplePansy.jpg")

imgtrix <- imagematrix(img, type = "grey")

svd1 <- svd(imgtrix)

#===========GRAFICOQUE ILUSTRA A VARIÂNCIA EXPLICADA DOS VETORES SINGULARES=================

plot(svd1$d^2/sum(svd1$d^2), pch=19,xlab="Singluar
     vector",ylab="Variance explained")

#=======================APROXIMAÇÃO DA IMAGEM ORIGINAL==============================

approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5])%*% t(svd1$v[,1:5])
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10])%*% t(svd1$v[,1:10])

image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])


#=======================NÚMERO CAPAZ DE REPRESENTAR A IMAGEM====================

approx60 <- svd1$u[,1:60] %*% diag(svd1$d[1:60])%*% t(svd1$v[,1:60])
image(t(approx60)[,nrow(approx60):1])

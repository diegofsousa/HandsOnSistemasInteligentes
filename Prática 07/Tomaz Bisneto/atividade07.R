setwd("/home/tomaz/Documentos/R\ Teste/HandsOnSistemasInteligentes/Prática\ 07/Tomaz\ Bisneto/")
library(jpeg)
library(ripa)
dataMatrix <- matrix(rnorm(400),nrow = 40)
ncol(dataMatrix)
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)
for(i in 1:40){
  coinFlip <- rbinom(1,size = 1, prob = 0.5)
  if(coinFlip){
    dataMatrix[i,] <-  dataMatrix[i,] + rep(c(0,3), each = 5)
  }
}

image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])
heatmap(dataMatrix)
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
img <- readJPEG("img.jpeg")
imgGrey <- imagematrix(img, type = "grey")
image(t(imgGrey)[,nrow(imgGrey):1])


svd1 <- svd(scale(imgGrey))
plot(svd1$d^2/sum(svd1$d^2),pch = 19, xlab = "Singular Vector",ylab = "Variance explaned")

approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
approx20 <- svd1$u[,1:20] %*% diag(svd1$d[1:20]) %*% t(svd1$v[,1:20])
approx30 <- svd1$u[,1:30] %*% diag(svd1$d[1:30]) %*% t(svd1$v[,1:30])
approx50 <-  svd1$u[,1:50] %*% diag(svd1$d[1:50])  %*% t(svd1$v[,1:50])
approx100 <- svd1$u[,1:100] %*% diag(svd1$d[1:100]) %*% t(svd1$v[,1:100])
approx400 <- svd1$u[,1:400] %*% diag(svd1$d[1:400]) %*% t(svd1$v[,1:400])
#par(mfrow = c(1,5))
image(t(approx1)[,nrow(approx1):1])
image(t(approx20)[,nrow(approx20):1])#no intervalo a partir do uso de 20 a 50 vetores ja é possivel identificar bem a imagem visualmente
image(t(approx30)[,nrow(approx30):1])
image(t(approx50)[,nrow(approx50):1])
image(t(approx100)[,nrow(approx100):1])#de 100 a 400 redusindo a menos da metada dos vetores temos uma represetação de facil visualização e com boa representação da imagem reduzindi muito o numero de vetores usados
image(t(approx400)[,nrow(approx400):1])
image(t(imgGrey)[,nrow(imgGrey):1])#imagem em sua representação na sua totalidade.


dev.off()
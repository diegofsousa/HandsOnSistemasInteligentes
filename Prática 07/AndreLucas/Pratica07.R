#setwd("/home/andre/AndreLucas")
library("ripa")
library("jpeg")
imagem <- readJPEG("SoftPurplePansy.jpeg")
imgMtrx <- imagematrix(imagem, type = "grey")
svd1 <- svd(imgMtrx)

#Plotando o gráfico 
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "Singular vector", 
     ylab = "Variance explained")

#Produzindo aproximações
approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
image(t(approx1)[,nrow(approx1):1])

approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% 
  t(svd1$v[,1:5])
image(t(approx5)[,nrow(approx5):1])

approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% 
  t(svd1$v[,1:10])
image(t(approx10)[,nrow(approx10):1])

approx300 <- svd1$u[,1:300] %*% diag(svd1$d[1:300]) %*% 
  t(svd1$v[,1:300])
image(t(approx300)[,nrow(approx300):1])

#Número definido para representar a imagem
approx40 <- svd1$u[,1:40] %*% diag(svd1$d[1:40]) %*% 
  t(svd1$v[,1:40])
image(t(approx40)[,nrow(approx40):1])
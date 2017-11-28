library(jpeg)
library(ripa)
x <- readJPEG("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/flor.jpg")
dim(x)
r <- imagematrix(x, type = "grey")
svd1 <- svd(r)
plot(svd1$d^2/sum(svd1$d^2), pch=19,xlab="Singluar
vector",ylab="Variance explained")
approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5])%*% t(svd1$v[,1:5])
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10])%*% t(svd1$v[,1:10])
approx290 <- svd1$u[,1:290] %*% diag(svd1$d[1:290])%*% t(svd1$v[,1:290])

image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx290)[,nrow(approx290):1])


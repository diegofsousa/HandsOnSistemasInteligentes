library(jpeg)
library(ripa)

img <- readJPEG("flor.jpeg")
imageGrey = imagematrix(img,type ="grey")

svd1 <-svd(scale(imageGrey))

plot(svd1$d^2/sum(svd1$d^2),pch =19,xlab = "Singular vector",ylab = "Variance explained" )

approx1 <-svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
approx5 <-svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])
approx30 <- svd1$u[,1:30] %*% diag(svd1$d[1:30]) %*% t(svd1$v[,1:30])

par(mfrow=c(1,4))
image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx30)[,nrow(approx30):1])
image(t(imageGrey)[,nrow(imageGrey):1])

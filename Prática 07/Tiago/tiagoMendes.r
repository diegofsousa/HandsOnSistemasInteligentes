library("ripa")
library("jpeg")

teste <- readJPEG("pansy.jpg")
dim(teste)
matrix <- imagematrix(img, type = "grey")


svd1 <- svd(matrix)
plot(svd1$d^2/sum(svd1$d^2), pch=19,xlab = "singluar vector", ylab = "Variance explained")

approx1<- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]
approx5<- svd1$u[,1:5]%*% diag(svd1$d[1:5])%*% t(svd1$v[,1:5])
approx10<- svd1$u[,1:10]%*% diag(svd1$d[1:10])%*% t(svd1$v[,1:10])
approx300<- svd1$u[,1:300]%*% diag(svd1$d[1:300])%*% t(svd1$v[,1:300])

par(mfrow=c(1,4))
image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx300)[,nrow(approx300):1])

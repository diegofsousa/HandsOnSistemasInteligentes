library("ripa")
library("jpeg")

flor <- readJPEG("Flor.jpeg")
mat <- imagematrix(flor, type="grey")

svdF <- svd(mat)
plot(svdF$d^2/sum(svdF$d^2), pch=19, xlab="Singular vextor", ylab = "Variance explained")

approx1 <- svdF$u[,1] %*% t(svdF$u[,1]) * svdF$d[1]
approx5 <- svdF$u[,1:5] %*% diag(svdF$d[1:5])%*% t(svdF$v[,1:5])
approx10 <- svdF$u[,1:10] %*% diag(svdF$d[1:10])%*% t(svdF$v[,1:10])
approx300 <- svdF$u[,1:300] %*% diag(svdF$d[1:300])%*% t(svdF$v[,1:300])
#Valor escolhido
approx35 <-  svdF$u[,1:35] %*% diag(svdF$d[1:35])%*% t(svdF$v[,1:35])

par(mfrow=c(1,4))
image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx300)[,nrow(approx300):1])
image(t(approx35)[,nrow(approx35):1])



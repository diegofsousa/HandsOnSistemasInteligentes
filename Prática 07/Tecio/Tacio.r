library("ripa")
library("jpeg")

flor <- readJPEG("SoftPurplePansy.jpeg")
mat <- imagematrix(flor, type="grey")

svdFlor <- svd(mat)
plot(svdFlor$d^2/sum(svdFlor$d^2), pch=19, xlab="Singular vextor", ylab = "Variance explained")

approx1 <- svdFlor$u[,1] %*% t(svdFlor$u[,1]) * svdFlor$d[1]
approx5 <- svdFlor$u[,1:5] %*% diag(svdFlor$d[1:5])%*% t(svdFlor$v[,1:5])
approx10 <- svdFlor$u[,1:10] %*% diag(svdFlor$d[1:10])%*% t(svdFlor$v[,1:10])
approx300 <- svdFlor$u[,1:300] %*% diag(svdFlor$d[1:300])%*% t(svdFlor$v[,1:300])

par(mfrow=c(1,4))
image(t(approx1)[,nrow(approx1):1])
image(t(approx5)[,nrow(approx5):1])
image(t(approx10)[,nrow(approx10):1])
image(t(approx300)[,nrow(approx300):1])

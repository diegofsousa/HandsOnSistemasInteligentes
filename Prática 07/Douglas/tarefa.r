library("ripa")
library("jpeg")

flower <- readJPEG("flor.jpg")
mat <- imagematrix(flower, type="grey")

#aproximação da qualidade da imagem, a partir da parte com maior variância
svdF <- svd(mat)
plot(svdF$d^2/sum(svdF$d^2), pch=19, xlab="Singular vector", ylab = "Variance explained")
aproximacao1 <- svdF$u[,1] %*% t(svdF$u[,1]) * svdF$d[1]
aproximacao5 <- svdF$u[,1:5] %*% diag(svdF$d[1:5])%*% t(svdF$v[,1:5])
aproximacao10 <- svdF$u[,1:10] %*% diag(svdF$d[1:10])%*% t(svdF$v[,1:10])
aproximacao300 <- svdF$u[,1:300] %*% diag(svdF$d[1:300])%*% t(svdF$v[,1:300])

#Valor da aproximação
par(mfrow=c(1,4))
image(t(aproximacao1)[,nrow(aproximacao1):1])
image(t(aproximacao5)[,nrow(aproximacao5):1])
image(t(aproximacao10)[,nrow(aproximacao10):1])
image(t(aproximacao300)[,nrow(aproximacao300):1])
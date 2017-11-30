library(jpeg)
library(ripa)

img <- readJPEG("SoftPurplePansy.jpg")
imgtrix <- imagematrix(img, type = "grey")
sv <- svd(imgtrix)

plot(sv$d^2/sum(sv$d^2), pch=19, xlab="Vetor Singular", ylab="Variedade Explicada")

focox1 <- sv$u[,1] %*% t(sv$v[,1])*sv$d[1]
focox5 <- sv$u[,1:5] %*% diag(sv$d[1:5]) %*% t(sv$v[,1:5])
focox10 <- sv$u[,1:10] %*% diag(sv$d[1:10]) %*% t(sv$v[,1:10])

image(t(focox1)[,nrow(focox1):1])
image(t(focox5)[,nrow(focox5):1])
image(t(focox10)[,nrow(focox10):1])

focox60 <- sv$u[,1:60] %*% diag(sv$d[1:60])%*% t(sv$v[,1:60])
image(t(focox60)[,nrow(focox60):1])

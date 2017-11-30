library(jpeg)
library(ripa)
test<-readJPEG("pansy.jpg")
dim(test)
r <-imagematrix(test,type = "grey")
plot(r)


r.svd <- svd(r)
d<- diag(r.svd$d)
dim(d)

u<- r.svd$u
v<- r.svd$v

plot(r.svd$d^2/sum(r.svd$d^2), pch=19,xlab = "singluar vector", ylab = "Variance explained")

lenna <-t(r)[,nrow(r):1]
image(lenna) 


approx11<-  r.svd$u[,1] %*% t( r.svd$v[,1]) *  r.svd$d[1]
approx51<-  r.svd$u[,1:5]%*% diag( r.svd$d[1:5])%*% t( r.svd$v[,1:5])
approx101<-  r.svd$u[,1:10]%*% diag( r.svd$d[1:10])%*% t( r.svd$v[,1:10])

par(mfrow=c(1,4))
image(t(approx11)[,nrow(approx11):1])
image(t(approx51)[,nrow(approx51):1])
image(t(approx101)[,nrow(approx101):1])
image(t(lenna)[,nrow(lenna):1])



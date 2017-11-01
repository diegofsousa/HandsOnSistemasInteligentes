library(ISwR)
attach(rmr)
names(rmr)

rmr.lm<-lm(metabolic.rate~body.weight,data=rmr)

par(mfrow=c(2,2))
plot(rmr.lm)
par(mfrow=c(1,1))

summary(rmr.lm)

plot(body.weight, metabolic.rate)
segments(body.weight, fitted(lm.velo), body.weight, metabolic.rate)
abline(lm(metabolic.rate ~ body.weight))




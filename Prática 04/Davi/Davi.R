library(ISwR)
attach(rmr)
names(rmr)

lm.teste <- lm(metabolic.rate ~ body.weight)
summary(lm.teste)

plot(body.weight, metabolic.rate)
abline(lm.teste)

segments(body.weight, fitted(lm.velo), body.weight, metabolic.rate)
abline(lm.teste)

resid(lm.teste)
options(lm.teste)

list(rmr)
options(na.action=na.exclude)

plot(body.weight~metabolic.rate)
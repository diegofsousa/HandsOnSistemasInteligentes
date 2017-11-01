library(ISwR)
attach(rmr)
names(rmr)

lm(metabolic.rate~body.weight)
summary(lm(metabolic.rate~body.weight))

plot(body.weight, metabolic.rate)
abline(lm(metabolic.rate~body.weight))

lm.meta <- lm(metabolic.rate~body.weight)
resid(lm.meta)

list(rmr)
plot(body.weight, metabolic.rate)
lines(body.weight, fitted(lm.meta))

options(na.action = na.exclude)
fitted(lm.meta)

segments(body.weight, fitted(lm.meta), body.weight, metabolic.rate)
abline(lm(metabolic.rate~body.weight))
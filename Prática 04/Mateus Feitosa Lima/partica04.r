library(ISwR)
attach(rmr)

View(rmr)

lm <- lm(body.weight~metabolic.rate)
plot(body.weight~metabolic.rate)
abline(lm)


residuals(lm)
options(na.action=na.exclude)



fitted(lm)
lines(metabolic.rate,fitted(lm))
segments(metabolic.rate,fitted(lm),metabolic.rate,body.weight)


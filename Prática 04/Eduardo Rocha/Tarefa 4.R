
library(ISwR)
attach(rmr)

names(rmr)
lm.velo <- lm(body.weight ~ metabolic.rate)
summary(lm.velo)

plot(body.weight, metabolic.rate)
abline(lm.velo)

resid(lm.velo)
options(lm.velo)

list(rmr)
options(na.action=na.exclude)

plot(metabolic.rate, body.weight)

segments(metabolic.rate, fitted(lm.velo), metabolic.rate, body.weight)
+abline(lm.velo)

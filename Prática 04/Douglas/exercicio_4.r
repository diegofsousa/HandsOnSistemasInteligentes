library(ISwR)
attach(thuesen)
names(thuesen)
# Gráfico de Pontos e a Reta estimada da Regressão
lm(short.velocity~blood.glucose)
summary(lm(short.velocity~blood.glucose))
plot(blood.glucose,short.velocity)
abline(lm(short.velocity~blood.glucose))
# Diferença entre os valores estimados e observados
options(na.action=na.exclude)
lm.velo<-lm(short.velocity~blood.glucose)
fitted(lm.velo)
# Resíduos e valores estimados
resid(lm.velo)
# Gráfico dos valores observados conectados a reta
lines(blood.glucose, fitted(lm.velo))
segments(blood.glucose,fitted(lm.velo),blood.glucose,short.velocity)
abline(short.velocity~blood.glucose)
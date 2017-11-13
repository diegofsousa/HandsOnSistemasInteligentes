library(ISwR)
attach(rmr)
names(rmr)

lm.velo <- lm(metabolic.rate ~ body.weight)
summary(lm.velo)

#Gráfico de Pontos e Reta estimada da regressão
plot(body.weight, metabolic.rate)
abline(lm.velo)

#Gráfico dos valores observados conectado a reta
segments(body.weight, fitted(lm.velo), body.weight, metabolic.rate)
abline(lm.velo)



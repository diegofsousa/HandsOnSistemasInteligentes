library(ISwR)
#Carregar o dataset
attach(rmr)
names(rmr)
#1-Gráfico de Pontos e a Reta estimada da Regressão

lm.rmr <- lm(body.weight~metabolic.rate)
summary(lm.rmr)
plot(body.weight~metabolic.rate)
abline(lm.rmr)

#2-Diferença entre os valores estimados e observados(nulo)


#3-Resíduos e valores estimados
#base de dados completa não necessitando a limpeza(nulo)
resid(lm.rmr)
options(lm.rmr)
list(rmr)
options(na.action=na.exclude)
plot(body.weight~metabolic.rate)

#4-Gráfico dos valores observados conectados a reta

lm.rmr <- lm(body.weight~metabolic.rate)
fitted(lm.rmr)
lines(metabolic.rate,fitted(lm.rmr))
segments(metabolic.rate,fitted(lm.rmr),metabolic.rate,body.weight)
abline(body.weight~metabolic.rate)


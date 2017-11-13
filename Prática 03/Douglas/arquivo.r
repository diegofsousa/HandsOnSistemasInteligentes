require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

setwd("/home/douglas/HandsOnSistemasInteligentes/Pratica 03/winequality")
dados <- read.csv("winequality-white.csv", header = TRUE, sep = ";")

# 1- questão
matrix_correlacao <- cor(dados)

corrplot(matrix_correlacao,diag=FALSE)
corrplot(matrix_correlacao, method = "circle", type = "lower", order = "hclust")

# 2- questão
trainIndex<-createDataPartition(dados$volatile.acidity, p = .75, list = FALSE)
train<-dados[trainIndex,]
test<-forestfires[-trainIndex,]

fitControl<-trainControl(method = "cv",number=10)
lm<-lm(volatile.acidity ~ fixed.acidity + citric.acid + residual.sugar + chlorides + 
         free.sulfur.dioxide + total.sulfur.dioxide + density + pH + alcohol +
         sulphates + quality, data = dados)
lm
summary(lm)

#3- questão

ggplot(lm_prediction,aes(x=pred,y=obs))+
    geom_point(alpha=0.5,position = position_jitter(width = 0.2))+
    geom_abline(colour="blue")+
    ggtitle("Previção X Observado(validação)")

#4 - questão
round(defaultSummary(lm_prediction),digits = 3)

require(dplyr)
library(reshape2)
require(ggplot2)
library(caret)
library(corrplot)
library(rpart)
library(rattle)

# O dataset escolhido apresenta dados sobre Locais de terremotos em Fiji 
# Link do dataset:
# https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/quakes.csv

setwd("~/Arquivos UFPI/PERIODOS/6º PERIODO/SISTEMAS INTELIGENTES/Codigos R/Pratica 05/")
quakes <- read.csv("quakes.data", header = TRUE, sep = ",")

names(quakes)
quakes$X <- NULL
quakes$lat <- NULL
quakes$long <- NULL

# gerar tabela do dataset
View(quakes)

#letra a

inTrain <- createDataPartition(y=quakes$stations, p=0.3, list = FALSE)
training <- quakes[inTrain,]
testing <- quakes[-inTrain,]
dim(training)
dim(testing)


qplot(mag, depth, colour = stations, data = training, main="Mortes por Magnitude do Terremoto", xlab="Magnitude", ylab="Mortes")

modFit <- train(stations ~ ., method="rpart", data = training)
plot(modFit$finalModel, uniform = TRUE, main = "Árvore de Decisão")
text(modFit$finalModel, use.n = TRUE, all=TRUE, cex=.9)


pre <- predict(modFit, newdata = testing)

confusionMatrix(pre, testing$stations)

tabela <- data.frame(testing$stations, pre)
colnames(tabela) <- c("Valor atual", "Valor anterior")
summary(tabela)

#letra b

train_control <- trainControl(method="cv", number=10)
model <- train(stations~., method="rpart", data=training, trControl=train_control)
pred <- predict(model, newdata = testing)

confusionMatrix(pred, testing$stations)

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

modFit <- train(stations ~., data = training, method = "rf", prox = TRUE)
modFit
dados <- classCenter(training[,c(1,2)], training$stations, modFit$finalModel$prox)

dados <- as.data.frame(dados)
dados$stations <-rownames(dados)



p <- qplot(mag, depth, col = stations, data = training)
p + geom_point(aes(x = mag, y = depth, col = stations), size = 5, shape = 4, data = dados)

pred <- predict(modFit, testing)
testing$predRight <- pred == testing$stations
table(pred, testing$stations)

confusionMatrix(pred, testing$stations)
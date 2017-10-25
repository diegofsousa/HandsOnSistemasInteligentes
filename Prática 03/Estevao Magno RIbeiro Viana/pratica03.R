require(dplyr)
library(reshape2)
require(ggplot2)
library(caret)
library(corrplot)

setwd("~/Arquivos UFPI/PERIODOS/6º PERIODO/SISTEMAS INTELIGENTES/Codigos R/Pratica 03/")
vinho_branco <- read.csv("winequality-white.csv", header = TRUE, sep = ";")

View(vinho_branco)

trainIndex <- createDataPartition(vinho_branco$quality, p = 0.75, list = FALSE)
train <- vinho_branco[trainIndex,]
test <- vinho_branco[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

cor(vinho_branco$density, vinho_branco$pH)
correlationMatrix <-cor(vinho_branco)
print(correlationMatrix)
corrplot(correlationMatrix)
corrplot(correlationMatrix, diag = FALSE)



corrplot(correlationMatrix, method = "circle", type = "upper", order = "hclust")
corrplot(correlationMatrix, method = "circle", type = "lower", order = "hclust")


lm <- lm(quality ~ fixed.acidity + 
           volatile.acidity + 
           citric.acid + 
           residual.sugar + 
           chlorides + 
           free.sulfur.dioxide + 
           total.sulfur.dioxide + 
           density + 
           pH + 
           sulphates + 
           alcohol, data = vinho_branco)
lm 
summary(lm)


prediction <- predict(lm, select(test, 
                                 fixed.acidity, 
                                 volatile.acidity, 
                                 citric.acid, 
                                 residual.sugar, 
                                 chlorides, 
                                 free.sulfur.dioxide, 
                                 total.sulfur.dioxide, 
                                 density, 
                                 pH, 
                                 sulphates, 
                                 alcohol)
)


# transformando o vetor de predição para a unidade original do problema (em ha)

exp.prediction <- exp(prediction)

lm_prediction <- data.frame(pred = prediction, obs = test$quality)


# plotando os dados
ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "green") + ggtitle("Previsão x Observado (validação)")

# calculando o RMSE (Root Mean Squared Error)
round(defaultSummary(lm_prediction), digits = 3)




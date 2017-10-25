require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

dados <- read.csv("winequality-red.csv", header = TRUE, sep = ";")

#(Gráfico da Matrix de Correlação)
matrixCorrelacao <- cor(dados)

corrplot(matrixCorrelacao, method = "circle", type = "lower", order = "hclust")

#Treinamento do Modelo

trainIndex <- createDataPartition(dados$alcohol, p = 0.75, list = FALSE)
train <- dados[trainIndex,]
test <- dados[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

lm <- lm(alcohol ~ fixed.acidity + 
           volatile.acidity + 
           citric.acid + 
           residual.sugar + 
           chlorides + 
           free.sulfur.dioxide + 
           total.sulfur.dioxide + 
           density + 
           pH + 
           sulphates + 
           quality, data = dados)
lm
summary(lm)

prediction <- predict(lm, select(test, fixed.acidity, 
                                 volatile.acidity, citric.acid
                                 , residual.sugar, chlorides 
                                 , free.sulfur.dioxide
                                 , total.sulfur.dioxide 
                                 , density, pH, sulphates
                                 , quality)
)

exp.prediction <- exp(prediction)

lm_prediction <- data.frame(pred = prediction, obs = test$alcohol)


# plotando os dados
ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "red") + ggtitle("Grafico de Previsão x Observado")

# calculando o RMSE (Root Mean Squared Error)
round(defaultSummary(lm_prediction), digits = 3)



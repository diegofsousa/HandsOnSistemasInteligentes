require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

dados <- read.csv("winequality-red.csv", header = TRUE, sep = ";")

# - gráfico da matrix de correlação - #
matrixCorrelacao <- cor(dados)

corrplot(matrixCorrelacao, method = "circle", type = "upper", order = "hclust")
corrplot(matrixCorrelacao, method = "circle", type = "lower", order = "hclust")

# - treinamento - #

trainIndex <- createDataPartition(dados$volatile.acidity, p = 0.75, list = FALSE)
train <- dados[trainIndex,]
test <- dados[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

lm <- lm(volatile.acidity ~ fixed.acidity + 
           citric.acid + 
           residual.sugar + 
           chlorides + 
           free.sulfur.dioxide + 
           total.sulfur.dioxide + 
           density + 
           pH + 
           alcohol +
           sulphates + 
           quality, data = dados)

lm
summary(lm)

prediction <- predict(lm, select(test, fixed.acidity
                                 , citric.acid
                                 , residual.sugar, chlorides 
                                 , free.sulfur.dioxide
                                 , total.sulfur.dioxide 
                                 , density, pH,alcohol, sulphates
                                 , quality)
)

exp.prediction <- exp(prediction)

lm_prediction <- data.frame(pred = prediction, obs = test$volatile.acidity)

# - plotando .. - #
ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "red") + ggtitle("Gráfico de Previsão x Observado")

# - calculando o RMSE - #
round(defaultSummary(lm_prediction), digits = 3)
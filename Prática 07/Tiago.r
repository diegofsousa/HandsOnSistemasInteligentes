require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

dados <- read.csv("biopsy.csv", header = TRUE, sep = ",")

# - treinamento - #
trainIndex <- createDataPartition(dados$V1, p = 0.75, list = FALSE)
train <- dados[trainIndex,]
test <- dados[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

lm <- lm(V1 ~ V2 +
           V3 +
           V4 +
           V5 + 
           V6 +
           V7 +
           V8 +
           V9 , data = dado)

lm
summary(lm)

prediction <- predict(lm, select(test, V2, V3, V4, V5, V6, V7, V8, V9))

lm_prediction <- data.frame(pred = prediction, obs = test$V1)

# - plotando .. - #

ggplot(lm_prediction, aes(x = pred, y = obs)) + 
    geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) +
  geom_abline(colour = "red") + ggtitle("Gráfico de Previsão x Observado")

# - calculando o RMSE - #
round(defaultSummary(lm_prediction), digits = 3)


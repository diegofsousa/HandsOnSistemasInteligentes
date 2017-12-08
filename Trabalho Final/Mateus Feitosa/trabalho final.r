require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

dado <- read.csv("C:/Users/gemeos/Documents/dataset final.csv", header = TRUE, sep = ",")
dados<- na.omit(dado)
View(dados)

#Treinamento do Modelo
trainIndex <- createDataPartition(dados$V1, p = 0.75, list = FALSE)
train <- dados[trainIndex,]
test <- dados[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

lm <- lm(V1 ~ V2 + 
           V3 + 
           V4+ 
           V5 + 
           V6 + 
           V7 + 
           V8 + 
           V9 , data = dados)
lm
summary(lm)

prediction <- predict(lm, select(test, V1, 
                                 V2, 
                                 V3, 
                                 V4, 
                                 V5, 
                                 V6, 
                                 V7, 
                                 V8, V9)
)

# transformando o vetor
exp.prediction <- exp(prediction)
lm_prediction <- data.frame(pred = prediction, obs = test$V1)

# plotando os dados
ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "red") + ggtitle("Grafico de Previsão x Observado")

# calculando o RMSE (Root Mean Squared Error)
round(defaultSummary(lm_prediction))



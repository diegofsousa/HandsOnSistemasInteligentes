# Packages Usadas # 

library(dplyr)
library(reshape2)
library(ggplot2)
library(caret)
library(corrplot)

# Leitura do dataset #

# Lido e armazenado em uma variavel 
cs <- read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/MASS/biopsy.csv",
               header = TRUE, sep = ",") 

Dataset <-na.omit(cs)

# Criação de partições de teste e de treinamento #

TreinoInd <- createDataPartition(Dataset$V9, p = 0.75, list = FALSE)
train <- Dataset[TreinoInd,]
test <- Dataset[-TreinoInd,]

#cross validation

fitControl <- trainControl(method = "cv", number = 10)


lm <- lm(V9 ~ V1 + V2  + V3 + V4 +V5 + V6 + V7 + V8, data = Dataset)

summary(lm)

prediction <- predict(lm, select(test, V1 ,V2 , V3 ,V4 ,V5, V6, V7, V8, V9))

exp.prediction <- exp(prediction)

lm_prediction <- data.frame(pred = prediction, obs = test$V9)

#grafico de Previsão X Observado(validação)

ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "green") + ggtitle("Previsão x Observado (validação)")

#RMSE

round(defaultSummary(lm_prediction), digits = 3)


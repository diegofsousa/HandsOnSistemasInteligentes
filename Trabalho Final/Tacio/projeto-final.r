library(ggplot2)
library(dpyr)


dados <- read.csv("D:\Documentos\UFPI\6º Periodo\Sistemas Inteligentes\Projeto finalarquivo.csv")
dados <- na.omit(dados)

dim(dados)
names(dados)

inTrain <- createDataPartition(y = dados$V9, p=0.7, list = FALSE)
training <- dados[inTrain,]
testing <- dados[-inTrain,]
dim(training)
dim(testing)

control <- trainControl(method = "cv", number=10)
model <- train(class~., method="rpart", data=train, trControl = controle)
predicao <- predict(model, newdata = test)

prediction <- data.frame(pred = predicao, obs = test$class)
ggplot(prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) +
  geom_abline(colour = "blue") + ggtitle("Previsão X Observado (validação)")

round(defaultSummary(prediction), digits = 3)


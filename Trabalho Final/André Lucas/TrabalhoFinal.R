library(caret)
require(dplyr)
library(rpart)

#Baixando e salvando o dataset
#dataurl <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/MASS/biopsy.csv" 
#download.file(url = dataurl, destfile = "biop.csv")

#Lendo o arquivo csv
dados <- read.csv("biop.csv", header = TRUE, sep = ",")

#Tratando os dados faltantes
dados <- na.omit(dados)

#Atribuindo NULL para colunas que não serão usadas
dados$X <- NULL
dados$ID <- NULL

#Dividindo o dataset em: conjunto de treino e teste
trainIndex <- createDataPartition(dados$class, p = 0.75, list = FALSE)
train <- dados[trainIndex,]
test <- dados[-trainIndex,]

#Treinamento do modelo preditivo
fitControl <- trainControl(method = "cv", number = 10)
fit <- train(class ~., data = dados, method = "rpart", trControl = fitControl)

#Predição dos dados
p <- predict(fit, newdata = test)
prediction <- data.frame(pred = p, obs = test$class)

#Gráfico de Previsão x Observado
ggplot(prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "blue") + 
  ggtitle("Previsão x Observado")

#Indíce de acurácia e o kappa 
round(defaultSummary(prediction), digits = 3)

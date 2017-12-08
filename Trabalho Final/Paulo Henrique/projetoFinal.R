require(ggplot2)
require(caret)

#data_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/MASS/biopsy.csv"

#download.file(url = data_url, destfile = "biopsia.csv")

#Leitura dos dados e tratamento do valores 'NA'
biopsia <- read.csv("biopsia.csv")
bio <- na.omit(biopsia)
View(bio)

#Divisão dos dados em dois conjutos de Treino e Teste.
trainIndex <- createDataPartition(bio$class, p = .75, list = FALSE)
train <- bio[trainIndex,]
test <- bio[-trainIndex,]

#Cross Validation
train_control <- trainControl(method = "cv", number=10)
model <- train(class~., method="rpart", data=train, trControl=train_control)
prediction <- predict(model, newdata = test)

#Gráfico de Previsão x Observado
lm_prediction <- data.frame(pred = prediction, obs = test$class)
ggplot(lm_prediction, aes(x = pred, y = obs)) + geom_point(alpha=0.5, position = position_jitter(width = 0.2)) + geom_abline(colour="blue") + ggtitle("Previsão x Observado")

#Indice Kappa e Acurácia
round(defaultSummary(lm_prediction), digits = 3)

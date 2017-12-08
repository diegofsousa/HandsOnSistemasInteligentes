require(dplyr)
require(reshape2)
library(corrplot)
require(ggplot2)
require(caret)

#Construção da base de dados
setwd("/home/tomaz/Documentos/R\ Teste/Trabalho\ Final/")
base <- read.csv("base.csv",header = TRUE)

#Limpeza de dados irrelevantes ou perdidos da base de dados
base <- base%>%select(-X,-ID)
novabase <- na.omit(base)

#Separação do dataSet em Treino e Teste
indice <- createDataPartition(novabase$class, p = 0.7, list = FALSE)
treino <- novabase[indice,]
teste <- novabase[-indice,]

#Teinamento de uma Rede Neural Com Cross Validation

ctrl <- trainControl(method = "cv", number = 10)
fit <- train(class~., data = treino ,method = "rf",trControl = ctrl)
#Foi utilizado pra treinamento o metodo de Random Forest Usando fazendo
#uso de Cross Validation.


# Predição dos valores 
predicao <- predict(fit,newdata = teste)
confusionMatrix(predicao,teste$class)
table(predicao,teste$class)
tabela <- data.frame(teste$class,predicao)

prediction <- data.frame(pred =predicao , obs = teste$class )

#grafico de Previsão X Observado(validação)
ggplot(prediction,aes(x = pred, y = obs,colour = as.factor(obs)))+geom_point(alpha = 0.5,position = position_jitter(width = 0.2))+geom_abline(colour  = "red")+ggtitle("Previsão X Observado(validação)")



#RMSE
round(defaultSummary(prediction),digits = 3)

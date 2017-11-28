library(ggplot2)
require(dplyr)
library(corrplot)




tra <- read.csv("tra.data", sep = ',')
tra = na.omit(tra)

View(tra)

summary(tra)

names(tra)



inTrain <- createDataPartition(y=tra$Recency, p=0.7, list = FALSE)
training <- tra[inTrain,]
testing <- tra[-inTrain,]
dim(training); dim(testing)

qplot(Monetary,Frequency, colour = Recency, data = training)
modFit <- train(Recency~.,method="rf", data = training, prox= TRUE)

 

  p <- predict(modFit, newdata = testing)

  confusionMatrix(p, testing$Type)

  #valor correto x valor predito
  tabela <- data.frame(testing$Recency, p)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

  +#Alternativa B
  
  fitControl <- trainControl(method="cv", number = 10)
modelo <- train(Recency ~., method="rf", data = training, trControl = fitControl)
predicao <- predict(modelo, testing)
confusionMatrix(predicao, testing$Recency)

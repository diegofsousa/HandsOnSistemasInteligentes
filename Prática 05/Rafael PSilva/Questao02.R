setwd("/home/psilva/Documents/SI/Prática 05")
library(caret)
library(ggplot2)
library(rpart)
require(dplyr)

#a)
fb <- read.csv("Facebook.csv", header = FALSE, sep='')
fb <- na.omit(fb)
dim(fb)
names(fb)

intrain = createDataPartition(y = fb$Type, p=0.7, list = FALSE)
training <- fb[intrain,]
testing <- fb[-intrain,]
dim(training); dim(testing)

qplot(Lifetime.Post.Total.Reach,like,colour=Type, data=training)

modFit <- train(Type ~., method="rf", data = training, prox= TRUE)
pre <- predict(modFit, newdata = testing)
pre
confusionMatrix(pre, testing$Type)

tab <- data.frame(testing$Type, pre)
colnames(tab) <- c("Valor atual", "Valor anterior")
View(tab)


#b)
fitControl <- trainControl(method="cv", number = 10)
modelo <- train(Type ~., method="rf", data = training, trControl = fitControl)
predicao <- predict(modelo, testing)
confusionMatrix(predicao, testing$Type)


# O Kappa da amostra é aceitavel;
# A classe "photo" teve índice especificidade baixo;
# A sensibilidade está fora do padrão;
# A acurácia chegou a 0.89;

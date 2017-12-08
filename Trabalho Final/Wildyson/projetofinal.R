library(caret)
library(ggplot2)
require(dplyr)
library(rpart)

biop <- read.csv("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/biopsy.csv", sep = ",")
biop <- na.omit(biop)
#biop <- biop[,-1]

dim(biop)
names(biop)


#Treinamento
intrain = createDataPartition(y = biop$class, p=0.7, list = FALSE)
training <- biop[intrain,]
testing <- biop[-intrain,]
dim(training); dim(testing)

#cross validation
fitControl <- trainControl(method="cv", number = 10)
modelo <- train(class ~., method="rpart", data = training, trControl = fitControl)

#Grafico
prediction <- predict(modelo, testing)
lm_prediction <- data.frame(pred = prediction, obs = testing$class)
ggplot(lm_prediction, aes(x=pred, y = obs))+
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "blue") + ggtitle("Previsao x Observado (validação)")

#RMSE

round(defaultSummary(lm_prediction), digits = 3)

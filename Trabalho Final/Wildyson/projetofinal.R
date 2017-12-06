library(caret)
library(ggplot2)
require(dplyr)


biop <- read.csv("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/biopsy.csv", sep = ",")
biop <- na.omit(biop)

dim(biop)
names(biop)


#Treinamento
intrain = createDataPartition(y = biop$V3, p=0.7, list = FALSE)
training <- biop[intrain,]
testing <- biop[-intrain,]
dim(training); dim(testing)

#cross validation
fitControl <- trainControl(method="cv", number = 10)
lm <- lm(V2 ~ V3 + V8 + V9 + V1  + V4 + V5 + V6 + V7, data = biop)
summary(lm)

#Previsao x obeservao
prediction <- predict(lm, select(testing,V1,V2,V3,V4,V5,V6,V7,V8,V9))
lm_prediction <- data.frame(pred = prediction, obs = testing$V3)
ggplot(lm_prediction, aes(x=pred, y = obs))+
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "blue") + ggtitle("Previsao x Observado (validação)")

#RMSE
round(defaultSummary(lm_prediction), digits = 3)

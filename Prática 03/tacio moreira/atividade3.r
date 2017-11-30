winequality<- read.csv("winequality-red.csv", sep = ";")
summary(winequality)

str(winequality)
require(reshape2)
require(ggplot2)
require(caret)
require(dplyr)

trainIndex <- createDataPartition(winequality$quality, p = 0.75, list = FALSE)

train <- winequality[trainIndex,]
test <- winequality[-trainIndex,]


library(corrplot)
cor(winequality$quality, winequality$alcohol)
correlationMatrix <- cor(winequality)
print(correlationMatrix)

corrplot(correlationMatrix)
fitControl  <- trainControl(method =  "cv", number = 10)
lm <- lm(quality ~ fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides 
         + free.sulfur.dioxide + total.sulfur.dioxide 
         + density + pH + sulphates + alcohol, data =  winequality)

lm

summary(lm)

prediction <- predict(lm, select(test, fixed.acidity, volatile.acidity, citric.acid,
                                 residual.sugar, chlorides, free.sulfur.dioxide,
                                 total.sulfur.dioxide, density, pH, sulphates, alcohol))
exp.prediction <- exp(prediction) - 1
lm_prediction <- data.frame(pred = exp.prediction, obs = test$quality)

ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) +
  geom_abline(colour = "blue") + ggtitle("Previsão X Observado (validação)")
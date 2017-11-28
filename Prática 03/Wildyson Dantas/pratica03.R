wine <- read.csv("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/winequality/winequality/winequality-red.csv", sep = ";")
summary(wine)
library("caret")
library(corrplot)
require(ggplot2)
require(reshape2)
require(dplyr)


intrainwine <- createDataPartition(wine$quality , p = 0.75, list = FALSE)
trainingwine <- wine[intrainwine,]
testingwine <- wine[-intrainwine,]

ncol(wine)
cor(wine$fixed.acidity, wine$alcohol)
correlationMatrix <- cor(wine)
print(correlationMatrix)

corrplot(correlationMatrix)
corrplot(correlationMatrix, diag = FALSE)
corrplot(correlationMatrix, method = "circle", type = "lower", order= "hclust")

fitControl <- trainControl(method="cv", number = 10)
lm <- lm(alcohol ~ quality + fixed.acidity + volatile.acidity + residual.sugar  + pH 
         + sulphates + citric.acid + chlorides + free.sulfur.dioxide+ total.sulfur.dioxide + density, data = wine)
lm
summary(lm)

prediction <- predict(lm, select(testingwine,density,total.sulfur.dioxide,free.sulfur.dioxide, 
                                 chlorides, alcohol, quality, fixed.acidity, volatile.acidity, 
                                 residual.sugar, pH, sulphates, citric.acid))
lm_prediction <- data.frame(pred = prediction, obs = testingwine$alcohol)
ggplot(lm_prediction, aes(x=pred, y = obs))+
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "blue") + ggtitle("Previsao x Observado (validação)")

round(defaultSummary(lm_prediction), digits = 3)

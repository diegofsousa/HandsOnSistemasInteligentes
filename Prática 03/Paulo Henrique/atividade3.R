winequality_red <- read.csv(file = "winequality-red.csv",sep=";")
summary(winequality_red)

str(winequality_red)

require(reshape2)
wine <- melt(winequality_red)
summary(wine)
require(ggplot2)
library(corrplot)
require(caret)
require(dplyr)

trainIndex <- createDataPartition(winequality_red$fixed.acidity, p = .75, list = FALSE)
train <- winequality_red[trainIndex,]
test <- winequality_red[-trainIndex,]

cor(winequality_red$fixed.acidity, winequality_red$pH)
correlationMatrix <- cor(winequality_red)
print(correlationMatrix)
corrplot(correlationMatrix)
corrplot(correlationMatrix, method = "circle", type = "lower", order = "hclust")

fitControl <- trainControl(method = "cv", number = 10)
lm <- lm(fixed.acidity~pH + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide + total.sulfur.dioxide + density + alcohol + sulphates + quality, data = winequality_red)
lm
summary(lm)

prediction <- predict(lm, select(test, volatile.acidity, citric.acid, residual.sugar, chlorides, free.sulfur.dioxide, total.sulfur.dioxide, density, alcohol, sulphates, quality, pH))

lm_prediction <- data.frame(pred = prediction, obs = test$fixed.acidity)

ggplot(lm_prediction, aes(x = pred, y = obs)) + geom_point(alpha=0.5, position = position_jitter(width = 0.2)) + geom_abline(colour="blue") + ggtitle("Previsão x Observado (validação)")

round(defaultSummary(lm_prediction), digits = 3)
require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)

vr <- read.csv("winequality-red.csv", header = TRUE, sep = ";")

trainIndex <- createDataPartition(vr$quality, p = 0.75, list = FALSE)
train <- vr[trainIndex,]
test <- vr[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

cor(vr$density, vr$pH)
correlationMatrix <-cor(vr)
print(correlationMatrix)
corrplot(correlationMatrix)
corrplot(correlationMatrix, diag = FALSE)



corrplot(correlationMatrix, method = "circle", type = "upper", order = "hclust")
corrplot(correlationMatrix, method = "circle", type = "lower", order = "hclust")


lm <- lm(quality ~ fixed.acidity +volatile.acidity + 
           citric.acid +residual.sugar + 
           chlorides +free.sulfur.dioxide + 
           total.sulfur.dioxide +density + 
           pH +sulphates + 
           alcohol, data = vr)
lm 
summary(lm)


prediction <- predict(lm, select(test,fixed.acidity,volatile.acidity,citric.acid,residual.sugar, 
                                 chlorides,free.sulfur.dioxide, 
                                 total.sulfur.dioxide,density,pH, 
                                 sulphates,alcohol)
)



exp.prediction <- exp(prediction)

lm_prediction <- data.frame(pred = prediction, obs = test$quality)

ggplot(lm_prediction, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "green") + ggtitle("Previsão x Observado (validação)")

round(defaultSummary(lm_prediction), digits = 3)


require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
require(corrplot)

vinhotinto <- read.csv("winequality-red.csv", header = TRUE, sep = ";")

# ----------------------------------- #

trainIndex <- createDataPartition(vinhotinto$quality, p = 0.75, list = FALSE)

train <- vinhotinto[trainIndex,]
test <- vinhotinto[-trainIndex,]
fitControl <- trainControl(method = "cv", number = 10)

cor(vinhotinto$density, vinhotinto$pH)
correlationMatrix <-cor(vinhotinto)
print(correlationMatrix)

# ----------------------------------- #

#Completo
corrplot(correlationMatrix)
#Sem a diagonal principal
corrplot(correlationMatrix, diag = FALSE)
#Outro modelo
corrplot(correlationMatrix, method = "circle", type = "lower", order = "hclust")

# ----------------------------------- #

lm <- lm(quality ~ fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide + total.sulfur.dioxide + density + pH + sulphates + alcohol, data = vinhotinto)

lm 

summary(lm)

# ----------------------------------- #

prediction <- predict(lm, select(test, fixed.acidity, volatile.acidity, citric.acid, residual.sugar, chlorides, free.sulfur.dioxide, total.sulfur.dioxide, density, pH, sulphates, alcohol))
exp.prediction <- exp(prediction)
lm_prediction <- data.frame(Predeteccao = prediction, Observacao = test$quality)

# ----------------------------------- #

ggplot(lm_prediction, aes(x = Predeteccao, y = Observacao)) + geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + geom_abline(colour = "red") + ggtitle("Previsão x Observação (validação)")
#=========================BIBLIOTECAS E ARQUIVO===================================

require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
require(corrplot)


red <- read.csv("winequality-red.csv", header = TRUE, sep = ";")

View(red)

#=========================TREINAMENTO DE REGREÇÃO LINEAR===================================

#*********Gráfico da matriz de correlação*********#


matriz <- cor(red)

corrplot(matriz, method = "circle", type = "lower", order = "hclust")



#*********Treinamento do Modelo*********#


trainIndex <- createDataPartition(red$quality, p = 0.75, list = FALSE)

train <- red[trainIndex,]

test <- red[-trainIndex,]

tc <- trainControl(method = "cv", number = 10)

lm <- lm(quality ~ fixed.acidity + 
         volatile.acidity + 
         citric.acid + 
         residual.sugar + 
         chlorides + 
         free.sulfur.dioxide + 
         total.sulfur.dioxide + 
         density + 
         pH + 
         sulphates + 
         alcohol, 
         data = red)

lm

summary(lm)

prediction <- predict(lm, select(test, fixed.acidity, volatile.acidity, citric.acid, 
                                 residual.sugar, chlorides, free.sulfur.dioxide, 
                                 total.sulfur.dioxide, density, pH, sulphates, alcohol))

lm_prediction <- data.frame(pred = prediction, obs = test$quality)


#========================= Previsão===================================

#*********Gráfico de Previsão x Observado*********#

ggplot(lm_prediction, aes(x = pred, y = obs)) + 
       geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
       geom_abline(colour = "red") + 
       ggtitle("Grafico de Previsão x Observado")

#*********Valor do RMSE*********#

round(defaultSummary(lm_prediction), digits = 3) 



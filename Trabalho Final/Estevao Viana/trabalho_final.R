# Biblioteca
require(dplyr)
require(reshape2)
require(ggplot2)
require(caret)
library(corrplot)
# Link do dataset:
# https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/quakes.csv
# -------------------------------------------------------------------------------
setwd("~/Forks/HandsOnSistemasInteligentes/Trabalho Final/")
biopsy <- read.csv("biopsy.csv", header = TRUE, sep = ",")

# Remoção de campos desnecessários
# -------------------------------------------------------------------------------
biopsy$ID <- NULL
biopsy$X <- NULL
biopsy <- na.omit(biopsy)
#View(biopsy)
# Divisão do dataset
# -------------------------------------------------------------------------------
intrain = createDataPartition(y = biopsy$class, p=0.7, list = FALSE)
training <- biopsy[intrain,] # dados para realizar treinamento
testing <- biopsy[-intrain,] # dados para realizar os testes
fitControl <- trainControl(method = "cv", number = 10)
fit <- train(class ~., data = biopsy, method = "rpart", trControl = fitControl)

# A acuracia foi utilizada para selecionar o modelo ideal usando o maior valor.
# O valor final utilizado para o modelo foi cp = 0,0251046.
# -------------------------------------------------------------------------------
prediction_testing <- predict(fit, newdata = testing)
prediction_testing <- data.frame(pred = prediction_testing, obs = testing$class)


# Geração do gráfico de "precisão x observado"
# -------------------------------------------------------------------------------
ggplot(prediction_testing, aes(x = pred, y = obs)) + 
                ggtitle("Gráfico de Previsão x Observado") +
                geom_point(position = position_jitter(width = 0.25)) + 
                geom_abline(colour = "darkblue")
  
# Calculo do RMSE 
# -------------------------------------------------------------------------------
round(defaultSummary(prediction_testing), digits = 3)

# Nos testes feitos foram encontrados os seguintes valores
# Acurácia (accuracy): 0.941
# Kappa: 0.869

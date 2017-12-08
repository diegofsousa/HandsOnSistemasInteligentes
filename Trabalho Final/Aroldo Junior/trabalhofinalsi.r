library(caret)
library(dplyr)
library(ggplot2)

# ----------------- Base de Dados ----------------- #

data_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/MASS/biopsy.csv"
download.file(url = data_url, destfile="biopsy.csv")

biopsia <- read.csv("biopsy.csv", sep = ',')
biopsia <- na.omit(biopsia)

# ----------------- Treino ----------------- #

intrainbiopsia <- createDataPartition(biopsia$V1, p = 0.75, list = FALSE)
trainingbiopsia <- biopsia[intrainbiopsia, ]
testing <- biopsia[-intrainbiopsia, ]

fitControl <- trainControl(method="cv", number = 10)
lm <- lm(V1 ~ V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9, data = biopsia)

lm

# ----------------- Grafico Pred X Obs ----------------- #

prediction <- predict(lm, select(testing, V1, V2, V3, V4, V5, V6, V7, V8, V9))
lm_prediction <- data.frame(pred = prediction, obs = testing$V3)

ggplot(lm_prediction, aes(x=pred, y = obs)) + geom_point(alpha = 0.5, position = position_jitter(width = 0.5)) + geom_abline(colour = "red") + ggtitle("Previsão x Observado")

# ----------------- RMSE ----------------- #

round(defaultSummary(lm_prediction), digits = 5)
require(ggplot2)
require(caret)

data_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/MASS/biopsy.csv"
download.file(url = data_url, destfile="biopsy.csv")
wine <- read.csv("biopsy.csv", sep = ',')
wine <- na.omit(wine)

#==========================================================================================

intrainwine <- createDataPartition(wine$V3 , p = 0.75, list = FALSE)
trainingwine <- wine[intrainwine,]
testingwine <- wine[-intrainwine,]

fitControl <- trainControl(method="cv", number = 10)
lm <- lm(V1 ~ V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9, data = wine)
lm

prediction <- predict(lm, select(testingwine, V1, V2, V3, V4, V5, V6, V7, V8, V9))
lm_prediction <- data.frame(pred = prediction, obs = testingwine$V3)

#==========================================================================================

ggplot(lm_prediction, aes(x=pred, y = obs)) + geom_point(alpha = 0.5, position = position_jitter(width = 0.5)) + geom_abline(colour = "blue") + ggtitle("Previsao x Observado")

round(defaultSummary(lm_prediction), digits = 3)

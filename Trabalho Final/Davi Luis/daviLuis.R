setwd("C:/Users/davil/Desktop/6 periodo/SistemasInteligentes/HandsOnSistemasInteligentes/HandsOnSistemasInteligentes/Trabalho Final/Davi Luis")

require(dplyr)
require(ggplot2)
require(caret)


teste <- read.csv("teste.csv",header = TRUE)

teste2 <- na.omit(teste)

treinamento <- createDataPartition(teste2$V3 , p = 0.76, list = FALSE)
treinamentoTeste <- teste2[treinamento,]
testeTreinamento <- teste2[-treinamento,]

control <- trainControl(method="cv", number = 10)
lm <- lm(V1 ~ V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9, data = teste2)

predicao <- predict(lm, select(testeTreinamento, V1, V2, V3, V4, V5, V6, V7, V8, V9))
lm_predicao <- data.frame(pred = predicao, obs = testeTreinamento$V2)

ggplot(lm_predicao, aes(x = pred, y = obs)) + 
       geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
              geom_abline(colour = "black") + ggtitle("Grafico de Previsão x Observado")

round(defaultSummary(lm_predicao),digits = 4)

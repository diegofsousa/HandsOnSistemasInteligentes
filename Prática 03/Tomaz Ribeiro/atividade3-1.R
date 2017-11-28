require(dplyr)
require(reshape2)
library(corrplot)
require(ggplot2)
require(caret)
#Leitura de todo o Dataset
setwd("/home/tomaz/Documentos/R\ Teste/Tomaz\ Bisneto\ /Atividade\ 3/")
whiteWine <- read.csv("winequality-white.csv",header = TRUE, sep = ";")

#Separação do dataSet em Treino e Teste
indice <- createDataPartition(whiteWine$quality, p = 0.75, list = FALSE)
treino <- whiteWine[indice,]
teste <- whiteWine[-indice,]

# Resposta 1 - Gráfico da matriz de correlação

matrix <- cor(whiteWine)
print(matrix)
corrplot(matrix)#Grafico com a amostra completa 
corrplot(matrix,diag = FALSE)# Visão eliminando Diagonal Principal 
corrplot(matrix, method = "circle", type = "lower", order = "hclust")#Grafico de Matriz de Correlação


# Resposta 2 - Treinamento de modelo (Cross Validation)

fitControl <- trainControl(method = "cv", number = 10)

lm <- lm(quality ~ fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide+ total.sulfur.dioxide + density + pH + sulphates + alcohol, data = whiteWine)
#summary(lm)
coef(lm)      # Coeficientes do modelo (intercepto e beta)
resultado <- predict(lm, select(teste, fixed.acidity,volatile.acidity, citric.acid, residual.sugar, chlorides, free.sulfur.dioxide, total.sulfur.dioxide, density, pH, sulphates, alcohol))
lm_de_resultados <- data.frame(pred = resultado, obs = teste$quality)
#print(lm_de_resultados)


# Resposta 3 - Gráfico de Previsão x Observado

ggplot(lm_de_resultados, aes(x = pred, y = obs)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "red") + 
  ggtitle("Previsão x Observado")

# Resposta 4 - Valor do RMSE

round(defaultSummary(lm_de_resultados), digits = 3)



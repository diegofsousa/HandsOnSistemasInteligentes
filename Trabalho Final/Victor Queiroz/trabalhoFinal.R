#ETAPA 1 CARREGAR BIBLIOTECAS
#Carregando Bibliotecas para atividade
library(caret)
library(rpart)
library(dplyr)

#ETAPA 2 CARREGAR ARQUIVO A SER TRABALHADO
#Carregando dataset a ser trabalhado na atividade
biopsy <-read.csv("biopsy.csv")

#Visualizando DataSet carregado
#View(biopsy)

#ETAPA 3 VERIFICAR E ELIMINAR CASO HAJA DADOS FALTANTES 
#ELiminando linhas com dados faltantes em suas colunas
y <- biopsy[complete.cases(biopsy),]

#Visualizando DataSet apos retirada as linhas faltantes
#View(y)

#ETAPA 4 PARTICIONAR DADOS
# Criando variavel para partionamento em teste e treino
trainIndex <-createDataPartition(y$class, p =.75, list = FALSE)

#Separando dados que vao ser usado para Treino dos dados que vao ser usados para testes
training <- y[trainIndex,]
testing <- y[-trainIndex,]

#ETAPA 5 SELECIONAR METODO A SER APLICADO NA ANALISE DOS DADOS(Nesse caso o método escolhido foi o Cross Validation "cv")
#Criando Variavel para aplicação do método de Cross Validation
fitCtrl <- trainControl(method = "cv", number = 10)

#ETAPA 6 ESCOLHER TECNICA/ALGORITMO PARA UTILIZAR NA ANALISE(Nesse caso a técnica escolhida foi a Regressão Linear)
#Aplicando Regressão Linear
lm <- lm(V1 ~ V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9, data = y) 

#ETAPA 7 TESTES DE PREVISÃO(Nesse caso a Base de dados(Data Set) ou parte dela(treinig) é submetida ao algoritmo/tecnica nesse em questao a Regressão Linear)
#Criando Preditor
preditor <- predict(lm, select(testing, V1, V2, V3, V4, V5, V6, V7, V8, V9))
predicao <- data.frame(predit = preditor, observador = testing$V2)

#ETAPA 8 EXIBICAO DE RESULTADOS(Nesse caso é utilizado um gráfico para representar a relação de acertos e erros do algoritmo/tecnica testado(a) sobre a base de dados(biopsy))
#Gráfico de previsão x Observado
ggplot(predicao, aes(x = predit, y = observador)) + 
  geom_point(alpha = 0.5, position = position_jitter(width = 0.2)) + 
  geom_abline(colour = "black") + ggtitle("  Grafico de Previsão     x     Observado  ")

#ETAPA 9 MARGEM DE ERROS OCORRIDOS
#Calculo RMSE
lm <- lm(V1~ V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9  ,data = y)
preditor <-predict(lm,select(testing,V1,V2,V3,V4,V5,V6,V7,V8,V9))
RMSE <- data.frame(pred = preditor, obs = testing$V2)
round(defaultSummary(RMSE), digits = 3)

summary(predicao)

#--COMENTÁRIOS A CERCA DO TESTE--#
# RMSE =  1.995
# Rsquared = 0.867
# MAE = 1.831
#--COMENTÁRIOS A CERCA DO TESTE--#


#Load library for Realize importation
library(readr)
#importanto DataSet a ser Utilizado de forma organizada
winequality_red <- read.csv("~/R/Atividades em R(SI)/winequality/winequality-red.csv", sep=";",dec = ".")
#Visualizando Data Set
View(winequality_red)
#Linear Regression Training
#Loading Required Libraries
library(corrplot)
#Create Matrix correlation
correlationMatrix <-cor(winequality_red)
#Printing the DataSet correlation Matrix
print(correlationMatrix)
#Modo gráfico de Impression
corrplot(correlationMatrix)
#Loading Package Caret
library(caret)
#Cross Validataion
#Parametros de ajustes
fitControl <- trainControl(method="cv",number=10)
lm <-lm(fixed.acidity~volatile.acidity+citric.acid+residual.sugar+chlorides+free.sulfur.dioxide+total.sulfur.dioxide+density+pH+sulphates+alcohol+quality,data = winequality_red)
lm
summary(lm)
#Realizando previsao
prediction <-predict(lm,select(test,fixed.acidity,volatile.acidity,citric.acid,residual.sugar,chlorides,free.sulfur.dioxide,total.sulfur.dioxide,density,pH,sulphates,alcohol,quality))
#Transformando o vetor de predicao para a unidade original do problema
exp.prediction <-exp(prediction) -1
lm_prediction <-data.frame(pred = exp.prediction, obs = test$fixed.acidity)
#Plotando os dados
ggplot(lm_prediction,aes(x = pred, y= obs))+geom_point(alpha = 0.5,position = position_jitter(width = 0.2))+geom_abline(colour="blue")+ggtitle("previsao x observado(Validacao)")

#Realizando previsao
#calculando RMSE(Root Mean Squared Error)
round(defaultSummary(lm_prediction),digits = 3)

















##############################################
#NOMES DAS VARIAVEIS DO DATA SET
#fixed.acidity
#volatile.acidity
#citric.acid
#residual.sugar
#chlorides
#free.sulfur.dioxide
#total.sulfur.dioxide
#density
#pH
#sulphates
#alcohol
#quality
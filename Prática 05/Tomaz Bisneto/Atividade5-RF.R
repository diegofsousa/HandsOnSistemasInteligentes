setwd("/home/tomaz/Documentos/R\ Teste/Tomaz\ Bisneto\ /Atividade\ 5/")
library(ggplot2)
library(caret)

#A)
#Consrtução da bases para treino e testes
dados <- read.csv("car.data",sep = ' ',header = FALSE)
View(dados)
inTrain <- createDataPartition(y=dados$V7, p=0.7, list = FALSE)
training <- dados[inTrain,]
testing <- dados[-inTrain,]
dim(training)
dim(testing)

#Gráfico de distribuição dos pontos (escolha duas variáveis para os eixos x e y, respectivamente);
qplot(V2,V6, colour=V7, data = training)


modFit <- train(V7~., data = training, method = "rf", prox = TRUE)
modFit
getTree(modFit$finalModel, k = 2)

#dev.off()
# Visualização gráfica da árvore montada;
plot(modFit$finalModel, uniform = TRUE,main = "Árvore de Classificação")
text(modFit$finalModel,use.n = TRUE,all  = TRUE, cex=.8)
library(rattle)
fancyRpartPlot(modFit$finalModel)

#Matriz de Confuzão
p <- predict(modFit,newdata = testing)
confusionMatrix(p,testing$V7)
table(p,testing$V7)

#Faça análises sobre a matriz de confusão, acurácia, índice Kappa, e os níveis de sensibilidade e especificidade de cada classe (pode ser em forma de comentário no código).
# - - -- -  -- -- - - -# 
#Durante os testes, os resultados obitidos para matriz de confuzão foi AB=55 corretos e 8 incorretos ja para NO=26 e 4 incorretos.O modelo teve  
#uma acuracia de 87% nos resultados, que para alguns modelos de classificação pode ser classificado como moderado os resultados. Ao analisar o 
#indice  Kappa  dessse modelo verificamos que a concordancia do mesmo é de 0.71, sujerindo, a partir de referencias estatisticas, que o modelo possui
#substancial aceitação, possibilitando um bom nivel de concordancia de resultados.Tambem podemos retirar da matriz dois iportantes valores que são os 
#valores de sensibilidade e especificidade, que nos resultados do modelo foram, respectivamente,0.8730 e 0.8667 , demostrando que esses valore
#são condisentes ao valor da acuracia, representando que o modelo tem uma qualidade de aceitação moderada. Por fim, um ultimo valor apresetado na 
#matriz que esta referindo a resultado da acuracia para dados não balanceados(Balanced Accuracy) o modelo utilisado apresenta resultado de  0.8698.
#------- - - - - -- - -#

# Monte um dataframe contendo as saidas do conjunto de teste e as saídas obtidas pelo modelo preditivo para as mesmas saídas;
tabela <- data.frame(testing$V7,p)
colnames(tabela) <- c("Valor Correto","Valor Predito")
View(tabela)


#B)
#Novo Modelo de Treinamento com Cross Validation

ctrl <- trainControl(method = "cv", number = 10)
fit <- train(V7~ ., data = training ,method = "rf",trControl = ctrl)
pedit <- predict(fit,newdata = testing)

confusionMatrix(pedit,testing$V7)
table(pedit,testing$V7)

#Faça análises sobre a matriz de confusão, acurácia, índice Kappa, e os níveis de sensibilidade e especificidade de cada classe (pode ser em forma de comentário no código).
# - - -- -  -- -- - - -# 
#Durante os testes, os resultados obitidos para matriz de confuzão foi AB=55 corretos e 8 incorretos ja para NO=26 e 4 incorretos.O modelo teve  
#uma acuracia de 87% nos resultados, que para alguns modelos de classificação pode ser classificado como moderado os resultados. Ao analisar o 
#indice  Kappa  dessse modelo verificamos que a concordancia do mesmo é de 0.71, sujerindo, a partir de referencias estatisticas, que o modelo possui
#substancial aceitação, possibilitando um bom nivel de concordancia de resultados.Tambem podemos retirar da matriz dois iportantes valores que são os 
#valores de sensibilidade e especificidade, que nos resultados do modelo foram, respectivamente,0.8730 e 0.8667 , demostrando que esses valore
#são condisentes ao valor da acuracia, representando que o modelo tem uma qualidade de aceitação moderada. Por fim, um ultimo valor apresetado na 
#matriz que esta referindo a resultado da acuracia para dados não balanceados(Balanced Accuracy) o modelo utilisado apresenta resultado de  0.8698.
#------- - - - - -- - -#


setwd("/home/andre/AndreLucas")
library(ggplot2)
library(caret)

#dataurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/ecoli/ecoli.data"
#download.file(url = dataurl, destfile = "ecoli.data")
ec <- read.csv("ecoli.data", header = FALSE, sep='')
names(ec)
ec$V1 <- NULL

inTrain <- createDataPartition(y = ec$V9, p = 0.7, list = FALSE)
training <- ec[inTrain,]
testing <- ec[-inTrain,]
dim(training)
dim(testing)

#Gráfico de distribuição dos pontos
qplot(V2, V3, colour = V9, data = training)

library(rpart)
modFit <- train(V9 ~ ., method = "rpart", data = training)
print(modFit$finalModel)

#Visualização gráfica da árvore montada
plot(modFit$finalModel, uniform = TRUE, main = "Árvore de Classificação")
text(modFit$finalModel, use.n = TRUE, all = TRUE, cex = .8)

p <- predict(modFit, newdata = testing)

#Matrix de confusão
confusionMatrix(p, testing$V9)

#Classificação
#cp DADOS = 42, PREDITOS CORRETAMENTE = 38
#im DADOS = 23, PREDITOS CORRETAMENTE = 23
#imL não foi escolhida para teste
#imS não foi escolhida para teste
#imU DADOS = 10, PREDITOS CORRETAMENTE = 0
#om DADOS = 6, PREDITOS CORRETAMENTE = 0
#omL DADOS = 1, PREDITOS CORRETAMENTE = 0
#pp DADOS = 15, PREDITOS CORRETAMENTE = 13

#Acurácia é a proporção de predições corretas. O modelo preditivo
#alcançou um valor acima de 70%, o que demonstra uma boa precisão.

#Índice Kappa avalia a precisão da classificação. O índice desse 
#modelo ficou acima de 0.61 o que, segundo a literatura, é 
#considerado muito bom.

#Nível de sensibilidade é a proporção de verdadeiros positivos.
#O modelo preditivo alcançou alto nível de sensibilidade (> 0.85)
#para as classes classificadas, exceto para as classes 'imU', 'om', 
#'omL'.

#Nível de especifidade é a proporção de verdadeiros negativos.
#O modelo preditivo alcançou alto nível de especifidade (> 0.8) para
#as classes classificadas, o que reitera a precisão do modelo.

#Data Frame 
tabela <- data.frame(testing$V9, p)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

#Novo modelo preditivo 
mp <- trainControl(method = "cv", number = 10)
fit <- train(V9 ~., data = ec, method = "rpart", trControl = mp)
p <- predict(modFit, newdata= testing)
confusionMatrix(p, testing$V9)

#O novo modelo obteve resultados semelhantes ao anterior. Por isso,
#não será realizada a análise sobre os índices e níveis obtidos.
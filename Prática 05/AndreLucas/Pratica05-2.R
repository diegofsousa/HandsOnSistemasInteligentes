setwd("/home/andre/AndreLucas")
library(ggplot2)
library(caret)

ec <- read.csv("ecoli.data", header = FALSE, sep='')
names(ec)
ec$V1 <- NULL

inTrain <- createDataPartition(y = ec$V9, p = 0.7, list = FALSE)
training <- ec[inTrain,]
testing <- ec[-inTrain,]
dim(training)
dim(testing)

modFit <- train(V9 ~., data = training, method = "rf", prox = TRUE)
modFit
e <- classCenter(training[,c(5,6)], training$V9,
                     modFit$finalModel$prox)

e <- as.data.frame(e)
e$V9 <-rownames(e)

#Gráfico de distribuição de pontos
p <- qplot(V6, V7, col = V9, data = training)
p + geom_point(aes(x = V6, y = V7, col = V9), 
               size = 5, shape = 4, data = e)

pred <- predict(modFit, testing)
testing$predRight <- pred == testing$V9
table(pred, testing$V9)

#Matrix de Confusão
confusionMatrix(pred, testing$V9)

#Classificação
#cp DADOS = 42, PREDITOS CORRETAMENTE = 41
#im DADOS = 23, PREDITOS CORRETAMENTE = 21
#imL não foi escolhida para teste
#imS não foi escolhida para teste
#imU DADOS = 10, PREDITOS CORRETAMENTE = 7
#om DADOS = 6, PREDITOS CORRETAMENTE = 6
#omL DADOS = 1, PREDITOS CORRETAMENTE = 1
#pp DADOS = 15, PREDITOS CORRETAMENTE = 15

#O modelo preditivo alcançou um valor acima de 85% para acurácia, 
#o que demonstra uma boa precisão.

#O índice kappa desse modelo ficou acima de 0.8 o que, 
#segundo a literatura, é considerado excelente.

#O modelo preditivo alcançou alto nível de sensibilidade (> 0.85)
#para as classes classificadas, exceto para classe 'imU'.

#O modelo preditivo alcançou alto nível de especifidade (> 0.9) 
#para as classes classificadas.

#Data Frame
tabela <- data.frame(testing$V9, pred)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

#Visualização gráfica da árvore montada
getTree(modFit$finalModel, k = 2)
#print(modFit$finalModel)
#library(rpart)
#plot(modFit$finalModel, uniform = TRUE, main = "Árvore de Classificação")
#text(modFit$finalModel, use.n = TRUE, all = TRUE, cex = .8)


#Novo modelo preditivo
mp <- trainControl(method = "cv", number = 10)
fit <- train(V9~ ., data = training, method = "rf", trControl = mp)
p <- predict(fit, newdata = testing)
confusionMatrix(p, testing$V9)

#O novo modelo obteve resultados semelhantes ao anterior. Por isso,
#não será realizada a análise sobre os índices e níveis obtidos.

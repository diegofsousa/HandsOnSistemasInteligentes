library(ggplot2)
library(caret)

#base, teste e treino
dataurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/vehicle/xaa.dat" 
vehicles_df <- read.csv(dataurl, header = FALSE, sep='') 
str(vehicles_df) #structure of our data frame 
set.seed(3033)
intrain <- createDataPartition(y = vehicles_df$V1, p= 0.7, list = FALSE)
training <- vehicles_df[intrain,] 
testing <- vehicles_df[-intrain,] 
dim(training)
dim(testing)

#Gráfico de distribuição dos pontos
qplot(V1,V3, colour=V2, data = training)

#Treino do modelo
library(rpart)
modelo <-train(V3~.,method="rpart",data=training)
print(modelo)

#Matriz de confusão
p <- predict(modelo, newdata = testing)
confusionMatrix(p, testing$Species)
table(p,testing$Species)

#entradas e saídas do modelo preditivo
tabela <- data.frame(testing$V7,p)
colnames(tabela) <- c("Certo","Predição")
View(tabela)

#Cross validations
ctrl <- trainControl(method = "cv", number = 10)
fit <- train(V7~ ., data = dados ,method = "rpart",trControl = ctrl)
fancyRpartPlot(fit$finalModel)
pedit <- predict(fit,newdata = testing)
confusionMatrix(pedit,testing$V7)
table(pedit,testing$V7)

#Árvore
plot(modelo$finalModel, uniform = TRUE, main = "Arvore")
text(modelo$finalModel, use.n = TRUE, all = TRUE, cex =.8)
library(rattle)
fancyRpartPlot(modFit$finalModel)


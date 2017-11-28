library(rpart)
library(caret)
library(ggplot2)
require(dplyr)
library(corrplot)
library(randomForest)


carb <- read.csv("blackmore.data", sep = ',')

summary(carb)

inTrain <- createDataPartition(y=carb$group, p=.7, list = FALSE)
training <- carb[inTrain,]
testing <- carb[-inTrain,]
dim(training); dim(testing)

modFit2 <- train(group~., data = training, method="rf", prox=TRUE)

getTree(modFit2$finalModel, k=2)
carbP <- classCenter(training[,c(3,4)], training$group, modFit2$finalModel$prox)
carbP <- as.data.frame(carbP)
carbP$group <- rownames(carbP)


p <- qplot(exercise, age, colour = group, data = training)
p + geom_point(aes(x=exercise, y = age, col=group), size=5,shape=4,date=carbP)

p <- predict(modFit2, newdata = testing)
testing$predRight <- p == testing$group
table(p, testing$group)

confusionMatrix(p, testing$group)

tabela <- data.frame(testing$group, p)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

qplot(exercise, age, colour=predRight, data = testing, main = "Classificação de novos dados")


# Observando a matriz de confusão a variável control teve 107 classificações corretas e 1 incorreta e o patient obteve 174 acertos e nenhum incorreto.
#A acurácia foi de 0.9965, ou seja, a proporções de predições corretas foi de aproximadamente 99%, os valores obtidos são justificados devido ao dataset ser pequeno, contando apenas com 945 obs. e também com apenas 2 classes de dados o que acaba facilitando a predição.
#O indice Kappa, refere-se a concordância, que observando o valor obtido de 0.9925, diz-se que o nivel de concordância obtido foi excelente.
# A taxa de sensibilidade anotada na predição foi de 1, ou seja a capacidade do sistema em predizer corretamente a condição para casos que realmente a têm foi de 100%
#Por fim a taxa de especifidade que ao contrário da taxa de sensibilidade, refere-se a capacidade do sistema em predizer corretamente a ausência da condição para casos que realmente não a têm, obteve o valor de 0,9932.

#Alternativa B

train_control <- trainControl(method="cv", number=10)
model <- train(group~., data=training, method="rf", trControl=train_control)
pred <- predict(model, newdata = testing)

confusionMatrix(pred, testing$group)

# Observando a matriz de confusão a variável control teve 106 classificações corretas e 0 incorreta e o patient obteve 175 acertos e 1 incorreto.
#A acurácia foi de 0.9965, ou seja, a proporções de predições corretas foi de aproximadamente 99%, os valores obtidos são justificados devido ao dataset ser pequeno, contando apenas com 945 obs. e também com apenas 2 classes de dados o que acaba facilitando a predição.
#O indice Kappa, refere-se a concordância, que observando o valor obtido de 0.9925, diz-se que o nivel de concordância obtido foi excelente.
# A taxa de sensibilidade anotada na predição foi de 1, ou seja a capacidade do sistema em predizer corretamente a condição para casos que realmente a têm foi de 100%
#Por fim a taxa de especifidade que ao contrário da taxa de sensibilidade, refere-se a capacidade do sistema em predizer corretamente a ausência da condição para casos que realmente não a têm, obteve o valor de 0.9943.

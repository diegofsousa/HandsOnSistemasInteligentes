library(rpart)
library(caret)
library(ggplot2)
require(dplyr)
library(corrplot)


#data_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/car/Blackmore.csv"
#download.file(url = data_url, destfile="blackmore.data")
#carb <- read.csv("blackmore.data", sep = ',')

carb <- read.csv("blackmore.data", sep = ',')

View(carb)

summary(carb)

names(carb)
View(carb)
summary(carb)

inTrain <- createDataPartition(y=carb$group, p=.7, list = FALSE)
training <- carb[inTrain,]
testing <- carb[-inTrain,]
dim(training); dim(testing)

qplot(exercise, age, colour = group, data = training)
modFit <- train(group~.,method="rpart", data = training)

print(modFit$finalModel)

plot(modFit$finalModel, uniform = TRUE, main = "Árvore de Classificação")
text(modFit$finalModel, use.n = TRUE, all=TRUE, cex=.8)

p <- predict(modFit, newdata = testing)
confusionMatrix(p, testing$group)

tabela <- data.frame(testing$group, p)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

# Observando a matriz de confusão a variável control teve 107 classificações corretas e 0 incorreta e o patient obteve 175 acertos e 0 incorreto.
#A acurácia foi de 1, ou seja, a proporções de predições corretas foi de 100%, os valores obtidos são justificados devido ao dataset ser pequeno, contando apenas com 945 obs. e também com apenas 2 classes de dados o que acaba facilitando a predição.
#O indice Kappa, refere-se a concordância, que observando o valor obtido de 1, diz-se que o nivel de concordância obtido foi excelente.
# A taxa de sensibilidade anotada na predição foi de 1, ou seja a capacidade do sistema em predizer corretamente a condição para casos que realmente a têm foi de 100%
#Por fim a taxa de especifidade que ao contrário da taxa de sensibilidade, refere-se a capacidade do sistema em predizer corretamente a ausência da condição para casos que realmente não a têm, obteve também o valor de 1.

#Alternativa B

train_control <- trainControl(method="cv", number=10)
model <- train(group~., method="rpart", data=training, trControl=train_control)
pred <- predict(model, newdata = testing)

confusionMatrix(pred, testing$group)

# Observando a matriz de confusão a variável control teve 107 classificações corretas e 0 incorreta e o patient obteve 175 acertos e 0 incorreto.
#A acurácia foi de 1, ou seja, a proporções de predições corretas foi de 100%, os valores obtidos são justificados devido ao dataset ser pequeno, contando apenas com 945 obs. e também com apenas 2 classes de dados. O que acaba facilitando a predição.
#O indice Kappa, refere-se a concordância, que observando o valor obtido de 1, diz-se que o nivel de concordância obtido foi excelente.
# A taxa de sensibilidade anotada na predição foi de 1, ou seja a capacidade do sistema em predizer corretamente a condição para casos que realmente a têm foi de 100%
#Por fim a taxa de especifidade que ao contrário da taxa de sensibilidade, refere-se a capacidade do sistema em predizer corretamente a ausência da condição para casos que realmente não a têm, obteve também o valor de 1.

library(caret)
library(ggplot2)
library(rpart)
require(dplyr)

#==========================DATASET SLID.csv===================================

data_url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/car/SLID.csv"
download.file(url = data_url, destfile="SLID.data")
c <- read.csv("SLID.data", sep = ',')
c <- na.omit(c)
dim(c)
names(c)
View(c)


intrain = createDataPartition(y = c$sex, p=0.7, list = FALSE)
training <- c[intrain,]
testing <- c[-intrain,]
dim(training); dim(testing)



qplot( education, age, colour=sex, data=training)



modFit <- train(sex ~., method="rpart", data = training)
print(modFit$finalModel)
plot(modFit$finalModel, uniform = TRUE, main =  "Arvore de Classificação")
    text(modFit$finalModel, use.n = TRUE, all = TRUE, cex=.8)

d <- predict(modFit, newdata = testing)
d


confusionMatrix(d, testing$sex)


teb <- data.frame(testing$sex, d)
colnames(teb) <- c("Valor correto", "Valor predito")
View(teb)


# Observando a matriz de confusão a variável Female teve 389 classificações corretas e 251 incorreta e a variavel Male obteve 211 acertos e 344 erros.
# A acuracia chegou a 0.6134 que é um nivel aceitavel.
# O indice Kappa obteve valor de 0.2265.
# A taxa de sensibilidade anotada na predição foi de 0.6483.
# A taxa de especifidade obteve valor proximo a sensibilidade, obteve o valor de 0.5782.

#Alternativa B

tra_control <- trainControl(method="cv", number=10)
model <- train(sex~., method="rpart", data=training, trControl=tra_control)
pred <- predict(model, newdata = testing)

confusionMatrix(pred, testing$sex)


# Observando a matriz de confusão a variável Female teve 389 classificações corretas e 251 incorreta e a variavel Male obteve 211 acertos e 344 erros.
# A acuracia chegou a 0.6134 que é um nivel aceitavel.
# O indice Kappa obteve valor de 0.2265.
# A taxa de sensibilidade anotada na predição foi de 0.6483.
# A taxa de especifidade obteve valor proximo a sensibilidade, obteve o valor de 0.5782.




library(caret)
library(ggplot2)
library(rpart)
require(dplyr)

#Alternativa A
face <- read.csv("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/dataset_Facebook.csv", sep = ";")
face <- na.omit(face)
dim(face)
names(face)


#Treinamento
intrain = createDataPartition(y = face$Type, p=0.7, list = FALSE)
training <- face[intrain,]
testing <- face[-intrain,]
dim(training); dim(testing)

#Grafico de ponto
qplot( Lifetime.Post.Total.Reach,like,colour=Type, data=training)

#arvore
modFit <- train(Type ~., method="rpart", data = training)
print(modFit$finalModel)
plot(modFit$finalModel, uniform = TRUE,
     main =  "Arvore de Classificação")
text(modFit$finalModel, use.n = TRUE, all = TRUE, cex=.8)

p <- predict(modFit, newdata = testing)
p
#matrix confusion
confusionMatrix(p, testing$Type)

#O indice Kappa da amostra analisada é aceitavel.
#Apenas a classe de photo mostrou uma indice baixo de especificidade, isso não é bom
# a sensibilidade ficou fora do padrão nas quatro classes
#a acuracia chegou a 0.8844 que é um nivel aceitavel.
#A matriz facilitou o entendimento e efeitos de previsões erradas.


#valor correto x valor predito
tabela <- data.frame(testing$Type, p)
colnames(tabela) <- c("Valor correto", "Valor predito")
View(tabela)

#Alternativa B

fitControl <- trainControl(method="cv", number = 10)
modelo <- train(Type ~., method="rpart", data = training, trControl = fitControl)
predicao <- predict(modelo, testing)
confusionMatrix(predicao, testing$Type)


#O indice Kappa da amostra analisada é aceitavel.
#Apenas a classe de photo mostrou uma indice baixo de especificidade, isso não é bom
# a sensibilidade ficou fora do padrão nas quatro classes
#a acuracia chegou a 0.8844 que é um nivel aceitavel.
#A matriz facilitou o entendimento e efeitos de previsões erradas.




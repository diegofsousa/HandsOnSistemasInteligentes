library(ggplot2)
require(dplyr)
library(corrplot)

  

  
  tra <- read.csv("tra.data", sep = ',')
  tra = na.omit(tra)
  
    View(tra)
  
    summary(tra)
  
    names(tra)


  
    inTrain <- createDataPartition(y=tra$Recency, p=0.7, list = FALSE)
    training <- tra[inTrain,]
    testing <- tra[-inTrain,]
    dim(training); dim(testing)
    
      qplot(Time,Frequency, colour = Recency, data = training)
    modFit <- train(Recency~.,method="rpart", data = training)
    
      print(modFit$finalModel)
    
      plot(modFit$finalModel, uniform = TRUE, main = "Árvore de Classificação")
    text(modFit$finalModel, use.n = TRUE, all=TRUE, cex=.8)
    
      p <- predict(modFit, newdata = testing)
      
      confusionMatrix(p, testing$Recency)
      
        tabela <- data.frame(testing$Recency, p)
        colnames(tabela) <- c("Valor correto", "Valor predito")
        View(tabela)
        
          
          
          train_control <- trainControl(method="cv", number=8)
          model <- train(Recency~., method="rpart", data=training, trControl=train_control)
          pred <- predict(model, newdata = testing)
          

                      confusionMatrix(pred, testing$Recency)
          
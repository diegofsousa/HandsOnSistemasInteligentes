library(caret) 
dataurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/vehicle/xaa.dat" 
vehicles_df <- read.csv(dataurl, header = FALSE, sep='') 
str(vehicles_df) #structure of our data frame 
set.seed(3033)
intrain <- createDataPartition(y = vehicles_df$V1, p= 0.7, list = FALSE)
training <- vehicles_df[intrain,] 
testing <- vehicles_df[-intrain,] 
cat("Dimensao do dataframe: ", dim(vehicles_df),"\n") 
cat("Dimensao do treinamento: ", dim(training),"\n") 
cat("Dimensao do teste: ", dim(testing),"\n") 
summary(vehicles_df)
trctrl <- trainControl(method = "boot")
set.seed(3033)
knn_fit <- train(V19 ~., data = training, method = "knn", 
                 trControl=trctrl, 
                 preProcess = c("center", "scale"), 
                 tuneLength = 10) 
knn_fit 
test_pred <- predict(knn_fit,newdata = testing)
test_pred

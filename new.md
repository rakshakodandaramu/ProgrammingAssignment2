### Loading Data

we have deleted thoe coloumns with NA (nothing) and few more coloumns which not related to predict split data to training and testing

```
library(caret)
set.seed(12463) 
training <- read.csv("C:/Course Work/Machine learning/Courseera/R/machine learnin course/pml-training.csv")
training$classe <- as.factor(training$classe)
training <- training[,-nearZeroVar(training)]> training <- training[,-c(1,2,3,4,5,6,7)]
inTrain <- createDataPartition(y=training$classe, p=0.75, list=FALSE)
training <- training[inTrain,]
testing <- training[-inTrain,]
```

## preprocessing data
```
preObj <- preProcess(training[,-length(training)],method=c("center", "scale", "knnImpute"), thresh=0.9)
clean_data <- predict(preObj,training[,-length(training)])
```

##Model fit
```
modelFit <- train(training$classe ~.,data=clean_data, method="knn")
test <- predict(preObj, testing[,-length(testing)])
confusionMatrix(testing$classe, predict(modelFit,test))
```

## Testing Fit
```
testing <- read.csv("pml-testing.csv", stringsAsFactors=FALSE)
testing <- testing[,names(testing) %in% names(training)]

test <- predict(preObj, testing)
predict_result <- predict(modelFit, test)
```
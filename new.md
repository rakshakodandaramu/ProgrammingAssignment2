# Project Title

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

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

preObj <- preProcess(training[,-length(training)],method=c("center", "scale", "knnImpute"), thresh=0.9)
clean_data <- predict(preObj,training[,-length(training)])

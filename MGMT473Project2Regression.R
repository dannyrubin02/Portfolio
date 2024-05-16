suppressWarnings(RNGversion("3.5.3"))
install.packages("caret",dependencies = c("Depends","Suggests"))
install.packages("rpart")
install.packages("rpart.plot")
install.packages("forecast")
library(caret)
library(rpart)
library(rpart.plot)
library(forecast)

set.seed(1)
library(readxl)
myData <- read_excel("Downloads/TechSales_with_Satisfaction_Score.xlsx", 
                     sheet = "Sheet2")
View(myData)
myIndex <- createDataPartition(myData$Salary, p=0.7, list=FALSE)
trainSet <- myData[myIndex,]
validationSet <-myData[-myIndex]
trainSet<-myData[c(myIndex),]
set.seed(1)
default_tree <-rpart(Salary ~ ., data=trainSet, method="anova")
summary(default_tree)
prp(default_tree, type=1, extra =1, under = TRUE)

set.seed(1)
full_tree <- rpart(Salary ~ .,data=trainSet, method= "anova",cp =0, minsplit = 2, minbucket = 1)
prp(full_tree, type=1, extra=1, under = TRUE)
printcp(full_tree)
pruned_tree<-prune(full_tree, cp=3.1109e-02)
prp(pruned_tree,type=1, extra=1, under=TRUE)
predicted_value<-predict(pruned_tree, validationSet) #Error starts here

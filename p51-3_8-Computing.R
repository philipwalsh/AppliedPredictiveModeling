# just testing the waters here with 
# 3.8 p 51 from the book


library(AppliedPredictiveModeling)
library(caret)
library(corrplot)
library(e1071)
library(dplyr)


apropos("confusion")
RSiteSearch("confusion" , restrict = "functions")

#create a simple variable




data(segmentationOriginal)
df<-segmentationOriginal


dim(df)

head(df, 12)

glimpse(df)


summary(df)


traindf<-subset(df, Case=="Train")
testdf<-subset(df, Case=="Test")


summary(traindf)


#remove the columns cell, case and class, store them seprately
cellID <- traindf$Cell
class <- traindf$Class
case<-traindf$Case
traindf<-testdf[,-(1:3)]

statuscolname<-grep("Status", names(traindf))
statuscolname
traindf<-traindf[,-statuscolname]

names(traindf)

# lets have a look at the skewness of the data
# usig package e1701
# for one predictor

skewness(traindf$AngleCh1)
#[1] -0.01318302

# we can also apply the skewness accross all columns - because they are all numeric
skewValue<- apply(traindf, 2 , skewness)
head(skewValue)


#ending at page 53
# i am getting tired/sleepy and transofming the data to remove the skewness
# requires a sharp non sleepy brain

## Project Assignment of the Coursera course
## Getting and Cleaning Data

#####################################################################################################
## This script will perform the steps to get and clean the data from:
 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject.

#####################################################################################################

## Environment Preparation

# free up memory for the download of the data sets
rm(list=ls())

# set the working directory where the UCI HAR Dataset was downloaded and unzipped
setwd("~/Cursos/Data Science/03 Getting and Cleaning Data/Projetos/UCI HAR Dataset")

#####################################################################################################

## 1. Merges the training and the test sets to create one data set.


## a) Training Data

# read the Training data files
features     <- read.table("features.txt",header=FALSE)
activityType <- read.table("activity_labels.txt",header=FALSE)
subjectTrain <- read.table("train/subject_train.txt",header=FALSE)
xTrain       <- read.table("train/x_train.txt",header=FALSE)
yTrain       <- read.table("train/y_train.txt",header=FALSE)

# assign column names
colnames(activityType)  <- c("activityId","activityType")
colnames(subjectTrain)  <- "subjectId"
colnames(xTrain)        <- features[,2] 
colnames(yTrain)        <- "activityId"

# create the Training Set by merging yTrain, subjectTrain, and xTrain
trainingSet <- cbind(yTrain,subjectTrain,xTrain)


## b) Test Data

# read in the Test data files
subjectTest <- read.table("test/subject_test.txt",header=FALSE)
xTest       <- read.table("test/x_test.txt",header=FALSE)
yTest       <- read.table("test/y_test.txt",header=FALSE)

# assign column names
colnames(subjectTest) <- "subjectId"
colnames(xTest)       <- features[,2] 
colnames(yTest)       <- "activityId"

# create the Test Set by merging xTest, yTest and subjectTest
testSet <- cbind(yTest,subjectTest,xTest)


## c) Final Data Set

# combine Training and Test data sets to create a final data set
finalData <- rbind(trainingSet,testSet)

# assign column names (will be used to select mean() & stddev() columns)
colNames  <- colnames(finalData)

#####################################################################################################

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# create a logical vector with TRUE for ID, mean() & stddev()and FALSE for the rest
logicalVector <- (grepl("activity..",colNames) | 
                  grepl("subject..",colNames) | 
                  grepl("-mean..",colNames) & 
                 !grepl("-meanFreq..",colNames) & 
                 !grepl("mean..-",colNames) | 
                  grepl("-std..",colNames) & 
                 !grepl("-std()..-",colNames))

# subset of Final Data Set (based on the logical vector) to keep only desired columns
finalData <- finalData[logicalVector==TRUE]

#####################################################################################################

# 3. Uses descriptive activity names to name the activities in the data set

# merge the Final Data Set with acitivityType to include descriptive names
finalData <- merge(finalData,activityType,by="activityId",all.x=TRUE)

# Updating the colNames vector to include the new column names after merge
colNames  <- colnames(finalData)

#####################################################################################################

## 4. Appropriately labels the data set with descriptive variable names. 

# redefine variable names
for (i in 1:length(colNames)) {
        colNames[i] = gsub("\\()","",colNames[i])
        colNames[i] = gsub("-std$","StdDev",colNames[i])
        colNames[i] = gsub("-mean","Mean",colNames[i])
        colNames[i] = gsub("^(t)","time",colNames[i])
        colNames[i] = gsub("^(f)","freq",colNames[i])
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
        colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
        colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
        colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
        colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
        colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
}

# reassigning the new descriptive names on the Final Data Set
colnames(finalData) <- colNames

#####################################################################################################

## 5. From the data set in step 4, creates a second, independent tidy data
##    set with the average of each variable for each activity and each subject.

# remove activityType column
cleanedData  <- finalData[,names(finalData) != "activityType"]

# define tidyData only with the mean of each variable / activity / subject
tidyData    <- aggregate(cleanedData[,names(cleanedData) != c('activityId','subjectId')],
                         by=list(activityId=cleanedData$activityId,
                         subjectId = cleanedData$subjectId),mean)

# merge tidyData with activityType to include descriptive acitvity names
tidyData    <- merge(tidyData,activityType,by="activityId",all.x=TRUE)

# write the final tidyData Set 
write.table(tidyData, "tidyData.txt",row.names=TRUE,sep='\t')


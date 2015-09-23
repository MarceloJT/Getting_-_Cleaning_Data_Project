#Coursera Getting and Cleaning Data
##Course Project
<br/>

## Intro

This repo was created to store and document all steps related to the project assignment of the Coursera Getting and Cleaning Data course.<br/>
The project assignment dewscription is in the 'Project Assignment.md' file.<br/>
The data information can be found at 'CodeBook.md'
<br/>

## Raw data

The raw data was downloaded and unzipped from the link described in course project page:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

and stored in a directory in my computer. Such directory is stated in the "source" command in the .R file.
<br/>

## Scripts and Tidy Dataset

The R script that merges and cleans the data is "run_analysis.R".  <br/>
Its premise is that the file was already properly unzipped in the directory stated in the "source" command.

After merging testing and training data, labels are added and only columns that have mean and standard deviation are kept.

At the end, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.
<br/>

## Data Managing Processes

### 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

### 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to cinlude the descriptive activity names

### 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject

#Coursera Getting and Cleaning Data
##Course Project
=========================================

Intro
-----
This repo was created to store all data related to the project assignment of the 
Coursera "Getting and Cleaning Data" course.
The project assignment is in the Project Assignment.md file
The Codebook can be found at Codebook.md

Raw data
--------

The xxx are unlabeled and can be found in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set.

Scripts and Tidy Dataset
------------------------
I created a script called run_analysis.R which will merge the test and training sets together.
Prerequisites for this script:

1. the UCI HAR Dataset must be extracted and..
2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

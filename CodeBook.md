#Coursera Getting and Cleaning Data
##Course Project


### Intro
This Code Book provides additional information about variables, data and cleaning processes used for project assignment of Coursera Getting and Cleaning Data course.

### Data Source
The information about the data used in the project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data was downloaded from [Project Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The compressed file with all data sets was unzipped in a local directory of my computer, that can be found at the 'source' command of the "run_analysis.R" file.


### Data Sets Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. <br/>
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.<br/>
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.<br/> 
The experiments have been video-recorded to label the data manually. <br/>
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). <br/>
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.<br/>
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. <br/>
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Used Files
The files used in the project are:

##### Root Ditectory:
- features.txt
- activity_labels.txt<br/>
##### Train Ditectory:
- subject_train.txt
- x_train.txt
- y_train.txt<br/>
##### Test Ditectory:
- subject_test.txt
- x_test.txt
- y_test.txt<br/>


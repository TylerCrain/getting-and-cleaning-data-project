## Course Project

###Introduction
This repository includes work for the Getting and Cleaning Data course project from Coursera. The files included are:

* README.md
* codebook.md
* tidyData.txt
* run_analysis.R


###About the raw data
The data is taken from UCI Machine Learning Repository. It contains data from an experiment carried out with a group of 30 people. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

All variables were taken from the Samsung data set from UCI Machine learning
repository. This data set only includes columns that are mean and standard deviation. The mean for each subject for each activity was taken. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. A list of the variables used in this data set can be found in the codebook. 

The original data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###About the tidy data
The transformed data takes only the columns with means and standard deviations. Once all of those columns are extracted, the average is taken from all column. The averages of these columns, along with the subject ID and activity is output in the tidy data set. 

###Data transformation
To transform the data, first you must have the original data from the source listed above. Once that data is put in your directory, run the run_analysis.R file,and a text file will be created. The script does the following:

* Raw data from training and test categories are imported
* The data sets are megred to form one large data set
* Activity label and features are imported
* The features data is edited using gsub to make the variable titles more readable
* Using a for loop, the numbers representing activities in the data is changed
  words for easier parsing
* Using the grep function, the columns that involve mean and standard deviation
  are identified and extracted from the data set.
* Using the aggregate function, we find the means for each subject doing each
  activity in the extracted columns
* Finally this new, tidy data set is saved as a text file in the working 
  directory.
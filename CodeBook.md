---
title: "CodeBook.md"
output: html_document
author: Bruno Gomes
---  
<br>
<br>  

##Helper functions  

**read_x** - this function does the pre-filtering and selects only columns inside the colinfo  
parameter from the data it will read from the file in filename.  

this function takes 2 parameters:  
- colInfo: a dataframe of 2 columns, the 1st is the row it will read from and the 2nd column has the column name.  
- filename: name of the file to open.  
  
It returns a dataframe with the filtered columns and proper column names
<br>

##Study Design  
<br>
The original data is machine learning data from the "UCI HAR Dataset", this dataset contains measurements for 30 subjects for several activities, such as sitting, walking, etc.  
This data was split into test data(data from 9 subjects) and train data(data from 21 subjects). The purpose was to capture all the mean and std column variables and apply a mean to summarize all the measurements for each of these variables. To do this, the data had to be combined.  
Bellow are the steps that describe the approach used to combine and summarize the data.  
<br>
- The X data is filtered to keep only the specified columns - columns with "mean()" and "std()" in it's name.  
- The output data *y* and the subject data are merged with the Filtered X data.
- This is done to the "train" and "test" datasets.  
- Because this is machine learning data, test and training data originate from a full set of data, that is why there are different subject numbers in test data from the ones in the train data. So the test and train data are then appended to create a full data frame: *"combined_data"*.  
- The y variable from *combined_data* is then used to create a new column *activity* with the text description of the activity, and then its dropped from the table, keeping only this descriptive variable.  
- This dataframe is then grouped by activity and subject and a mean is applied to all the variable columns to create the *tidy_data* dataset.  
- A file with this tidy set of summarized features is written(in the same directory as the script).
<br>
<br>

###The resulting data set from the analysis  
<br>
tidy_data: tidy dataset with the summarized mean variables grouped by descriptive activity and subject number.  
<br>  

##Code book
<br>

**activity**  
class: "character"
type: "categorical"
Description:activity being performed
  
**subject**  
class: "numeric"
type:"integer, ordinal, fixed range 1-30"
Description: Subject id from which the measurements were taken
  
**measurement variables**  
class: "All are numeric"  
type: "continuous, double precision"  

All variables are the means of the originally named variables grouped by activity and subject(a textual description is provided bellow the names):  

tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X  
tBodyAcc-std()-Y tBodyAcc-std()-Z, tGravityAcc-mean()-X  
tGravityAcc-mean()-Y, tGravityAcc-mean()-Z, tGravityAcc-std()-X  
tGravityAcc-std()-Y, tGravityAcc-std()-Z, tBodyAccJerk-mean()-X  
tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, tBodyAccJerk-std()-X  
tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, tBodyGyro-mean()-X  
tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X  
tBodyGyro-std()-Y, tBodyGyro-std()-Z, tBodyGyroJerk-mean()-X  
tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z, tBodyGyroJerk-std()-X  
tBodyGyroJerk-std()-Y, tBodyGyroJerk-std()-Z, tBodyAccMag-mean()  
tBodyAccMag-std(), tGravityAccMag-mean(), tGravityAccMag-std()  
tBodyAccJerkMag-mean(), tBodyAccJerkMag-std(), tBodyGyroMag-mean()  
tBodyGyroMag-std(), tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std()  
fBodyAcc-mean()-X, fBodyAcc-mean()-Y, fBodyAcc-mean()-Z  
fBodyAcc-std()-X, fBodyAcc-std()-Y, fBodyAcc-std()-Z  
fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y, fBodyAccJerk-mean()-Z  
fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y, fBodyAccJerk-std()-Z  
fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z  
fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z  
fBodyAccMag-mean(), fBodyAccMag-std(), fBodyBodyAccJerkMag-mean()  
fBodyBodyAccJerkMag-std(), fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std()  
fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std()  
  
**Textual description of the original variables used to generate the above summarized feature set**  
(taken from the *features_info.txt* file)  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

<br>  
<br>  

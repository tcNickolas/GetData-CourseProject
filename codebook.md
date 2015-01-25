## Codebook

# Variables

<table>
<tr><td>Variable #</td><td>Variable name</td><td>Type</td><td>Description</td></tr>
<tr><td>1</td><td>Subject</td><td>Int 1..30</td><td>Unique ID of the subject who carried out the experiment</td></tr>
<tr><td>2</td><td>Activity</td><td>Char</td><td>Activity performed</td></tr>
<tr><td>3..81</td><td>Measurement(-mean/-std)(-XYZ)</td><td>Double -1..1</td><td>Codename of value measured, suffix to denote whether it is mean or average, suffix to denote component of 3D signals</td></tr>
</table>

# Data

This file contains average values of mean (denoted by suffix "_mean") and standard deviation (suffix "_std") for measurements taken from file obtained as follows.
(Data and its description taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
Suffixes '-XYZ' are used to denote components of 3-axial signals in the X, Y and Z directions.

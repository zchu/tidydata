# tidydata
Project for Coursera Getting and Cleaning Data

Instructions:

This code run_analysis.R is to collect the samsung data, and generate a independent tidy data set with the average of each variable for each activity and each subject.

How to Use this Code:

1. Please install the dplyr package if you haven't done so. You can use install.packages("dplyr") to install the package.
2. Set the working directory as the folder of samsung data such as ".../UCI HAR Dataset"
3. Run the data, the output file tidydata.txt will be in your working directory.



Code Book:

The output data tidydata.txt calcualtes the average of each variable for each activity and each subject. The first 2 columns are the group based on which we did calculation:
1. subject:	Volunteer ID
2. activity:	Activities the volunteer did

The remaining columns are the average values of the selected feature as descrbing in the following:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc_XYZ, fBodyAccJerk_XYZ, fBodyGyro_XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc_XYZ
tGravityAcc_XYZ
tBodyAccJerk_XYZ
tBodyGyro_XYZ
tBodyGyroJerk_XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc_XYZ
fBodyAccJerk_XYZ
fBodyGyro_XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated and selected from these signals are: 

mean: Mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Then those values are calculated by group of subject and activities:

The complete list of 68 variables of each feature vector is available as following:
1	subject
2	activity
3	tBodyAcc_std_X  
4	tBodyAcc_std_Y
5	tBodyAcc_std_Z
6	tGravityAcc_std_X
7	tGravityAcc_std_Y   
8	tGravityAcc_std_Z  
9	tBodyAccJerk_std_X
10	tBodyAccJerk_std_Y
11	tBodyAccJerk_std_Z
12	tBodyGyro_std_X   
13	tBodyGyro_std_Y
14	tBodyGyro_std_Z
15	tBodyGyroJerk_std_X
16	tBodyGyroJerk_std_Y
17	tBodyGyroJerk_std_Z
18	tBodyAccMag_std   
19	tGravityAccMag_std
20	tBodyAccJerkMag_std
21	tBodyGyroMag_std
22	tBodyGyroJerkMag_std
23	fBodyAcc_std_X
24	fBodyAcc_std_Y   
25	fBodyAcc_std_Z
26	fBodyAccJerk_std_X
27	fBodyAccJerk_std_Y
28	fBodyAccJerk_std_Z 
29	fBodyGyro_std_X
30	fBodyGyro_std_Y   
31	fBodyGyro_std_Z
32	fBodyAccMag_std 
33	fBodyBodyAccJerkMag_std
34	fBodyBodyGyroMag_std
35	fBodyBodyGyroJerkMag_std
36	tBodyAcc_mean_X 
37	tBodyAcc_mean_Y  
38	tBodyAcc_mean_Z  
39	tGravityAcc_mean_X
40	tGravityAcc_mean_Y  
41	tGravityAcc_mean_Z  
42	tBodyAccJerk_mean_X
43	tBodyAccJerk_mean_Y 
44	tBodyAccJerk_mean_Z   
45	tBodyGyro_mean_X   
46	tBodyGyro_mean_Y  
47	tBodyGyro_mean_Z 
48	tBodyGyroJerk_mean_X 
49	tBodyGyroJerk_mean_Y 
50	tBodyGyroJerk_mean_Z 
51	tBodyAccMag_mean   
52	tGravityAccMag_mean 
53	tBodyAccJerkMag_mean 
54	tBodyGyroMag_mean 
55	tBodyGyroJerkMag_mean
56	fBodyAcc_mean_X   
57	fBodyAcc_mean_Y  
58	fBodyAcc_mean_Z  
59	fBodyAccJerk_mean_X  
60	fBodyAccJerk_mean_Y  
61	fBodyAccJerk_mean_Z  
62	fBodyGyro_mean_X   
63	fBodyGyro_mean_Y  
64	fBodyGyro_mean_Z   
65	fBodyAccMag_mean
66	fBodyBodyAccJerkMag_mean  
67	fBodyBodyGyroMag_mean  
68	fBodyBodyGyroJerkMag_mean 

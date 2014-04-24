run_analysis
========

The script is created in order to obtain a tidy data from data collected from the accelerometers from the Samsung Galaxy S smartphone. This data can be later used for further analysis

The script perform following operation:
1. Download data and save it as .zip file in folder "data"
2. Unzip data
3. Create a data frame with all features from original data from both train and test files
4. Subtract only only the measurements on the mean and standard deviation for each measurement (please see below further explanation)
5. Create a data frame with the average of each variable for each activity and each subject
6. Save dataset in a separate file *"tidy.txt"*


###Variables

The dataset contains variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag


From the set of variables that were estimated from these signals only following were chosen for further analysis: 
* mean(): Mean value
* std(): Standard deviation


###tidy dataset

The final output contains a data frame of average values for each variable each activity and each subject.

Activities are:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Subject is an integer value within range 1-30.

All means are numeric values.

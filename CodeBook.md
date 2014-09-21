Code Book
=========

Input data
----------

Input data set available by url `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.

For description of files and data sets please see `README.txt` in zip archive.

Data transformations
--------------------

Following transformations were performed by `run_analysis.R` script:

1. Training and test data were merged for activity, label and main data sets.
2. Only mean and standart deviation measurement were extracted from data set.
3. Features and activities were properly labeled in data set.
4. Another data set with the average of each variable for each activity and each subject were created.

Output data
-----------

Resulted data set is saved to `tidy_data.txt` file. It's text file with tab-separated values.

Fields in output data set:

    subject
    activity
    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X
    tBodyAccJerk-mean()-Y
    tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X
    tBodyAccJerk-std()-Y
    tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z
    fBodyAccJerk-mean()-X
    fBodyAccJerk-mean()-Y
    fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X
    fBodyAccJerk-std()-Y
    fBodyAccJerk-std()-Z
    fBodyGyro-mean()-X
    fBodyGyro-mean()-Y
    fBodyGyro-mean()-Z
    fBodyGyro-std()-X
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()

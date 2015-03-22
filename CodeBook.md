CodeBook
---------------------------------------------------------------
Data and transofrmations used by *run_analysis.R* and the definition of variables in *TidyData.txt*.

##Dataset 

This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The data set used can be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 

##Input Data Set

The input data containts the following data files:

* X_train.txt:          variables for training.
* y_train.txt:          activities of "X_train.txt".
* subject_train.txt:    information on the subjects.
* X_test.txt:           variables for testing.
* y_test.txt:           activities of "X_test.txt".
* subject_test.txt:     subjects from whom data is collected.
* activity_labels.txt:  metadata on the different types of activities.
* features.txt:         name of the features in the data sets.

##Actions and Transformations

* x1            = X_train.txt")
* x2            = X_test.txt")
* subj1         = subject_train.txt")
* subj2         = subject_test.txt")
* y1            = y_train.txt")
* y2            = y_test.txt")
* featureNames  = names from features.txt
* activityLabels= names taken from activity_labels.txt: 
                  walking, walkingupstairs, walkingdownstairs, sitting, standing, laying
  
* subject         = subj1+subj2, Subjects merged
* activity        = y1+y2, y_train and y_test merged
* features        = x1+x2, X_test and X_train merged
* mergedData      = subject, activity and features merged
* meanSTD         = mean and standard deviation
* desiredColums   = colums for meanSTD, activity and subject are taken in
* pulledData"     = created with data from columns in "desiredColumns"
* "Activity"      = Add descriptive names of activities taken from "activityLabels""

* "Activity" is factorized.

* "pulledData" names replaced with descriptive labels:
   - names(pulledData)<-gsub("Acc", "Accelerometer", names(pulledData))
   - names(pulledData)<-gsub("Gyro", "Gyroscope", names(pulledData))
   - names(pulledData)<-gsub("BodyBody", "Body", names(pulledData))
   - names(pulledData)<-gsub("Mag", "Magnitude", names(pulledData))
   - names(pulledData)<-gsub("^t", "Time", names(pulledData))
   - names(pulledData)<-gsub("^f", "Frequency", names(pulledData))
   - names(pulledData)<-gsub("tBody", "TimeBody", names(pulledData))
   - names(pulledData)<-gsub("-mean()", "Mean", names(pulledData), ignore.case = TRUE)
   - names(pulledData)<-gsub("-std()", "STD", names(pulledData), ignore.case = TRUE)
   - names(pulledData)<-gsub("-freq()", "Frequency", names(pulledData), ignore.case = TRUE)
   - names(pulledData)<-gsub("angle", "Angle", names(pulledData))
   - names(pulledData)<-gsub("gravity", "Gravity", names(pulledData))

* Load library(plyr) and library(data.table)
* "tidy1" is created as a set with average for each activity and subject of "mergedData" 
* "tidy1" Entries are ordered based on activity and subject.
* The data in "tidy1"" is written into "TidyData.txt".

##Read and View Data Set

At the end of the script run-analysis.R it was included the fuction to read the text file "TidyData.txt" that is data <- read.table("TidyData.txt"), in addition to that the script also includes View(data) to open an R-Studio window to show the table in a more appealing way.

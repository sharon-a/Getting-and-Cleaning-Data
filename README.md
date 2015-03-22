 Getting-and-Cleaning-Data Course Project
==========================================

##Objective:
Prepare a tidy data set that can be used for later analysis.

## Course Project Instructions
Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* One should create one R script called run_analysis.R that does the following. 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Get ready
* Download and Unzip Data

  if(!file.exists("./project")){dir.create("./project")}
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl,destfile="./project/Dataset.zip")

  unzip(zipfile="./project/Dataset.zip",exdir="./project")

* In RStudio: set your working directory where your project file is located and proceed to run the script run_analysis.R which is located in this repository

## Additional Notes

* Libraries used are included as part of the script run-analysis.R, no need to load them separately, these are Library(plyr) and Library(data.table). 

* Please note that at the end of the script run-analysis.R it was included the fuction to read the text file "TidyData.txt" that is data <- read.table("TidyData.txt"), in addition to that the script also includes View(data) to open an R-Studio window to show the table in a more appealing way.

* In regards to "TidyData.txt", the table in this file contains 180 rows because there are 30 subjects and 6 activities.

* For further reference, the course data was downloaded in folder "project", this folder is located in C:\Users\yourname\Documents, same where the working directory was set.

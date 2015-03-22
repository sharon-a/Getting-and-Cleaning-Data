##1. Merges the training and the test sets to create one data set.

x1 <- read.table("project/UCI HAR Dataset/train/X_train.txt")
x2 <- read.table("project/UCI HAR Dataset/test/X_test.txt")
features <- rbind(x1, x2)

featuresNames <- read.table("project/UCI HAR Dataset/features.txt", head=FALSE)
colnames(features) <- featuresNames$V2

subj1 <- read.table("project/UCI HAR Dataset/train/subject_train.txt")
subj2 <- read.table("project/UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subj1, subj2)
colnames(subject) <- "Subject"

y1 <- read.table("project/UCI HAR Dataset/train/y_train.txt")
y2 <- read.table("project/UCI HAR Dataset/test/y_test.txt")
activity <- rbind(y1, y2)
colnames(activity) <- "Activity"

mergedData <- cbind(activity, subject, features)

##2. Extracts only the measurements on the mean and standard deviation for each measurement. 

meanSTD <- grep("mean\\(\\)|std\\(\\)", featuresNames[, 2])
desiredColumns <- c(meanSTD, subject, activity)
pulledData <- mergedData[,meanSTD]

##3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table("project/UCI HAR Dataset/activity_labels.txt", header = FALSE)

pulledData$Activity <- as.character(pulledData$Activity)
for (i in 1:6){
pulledData$Activity[pulledData$Activity == i] <- as.character(activityLabels[i,2])}



##4. Appropriately labels the data set with descriptive variable names. 

names(pulledData)<-gsub("Acc", "Accelerometer", names(pulledData))
names(pulledData)<-gsub("Gyro", "Gyroscope", names(pulledData))
names(pulledData)<-gsub("BodyBody", "Body", names(pulledData))
names(pulledData)<-gsub("Mag", "Magnitude", names(pulledData))
names(pulledData)<-gsub("^t", "Time", names(pulledData))
names(pulledData)<-gsub("^f", "Frequency", names(pulledData))
names(pulledData)<-gsub("tBody", "TimeBody", names(pulledData))
names(pulledData)<-gsub("-mean()", "Mean", names(pulledData), ignore.case = TRUE)
names(pulledData)<-gsub("-std()", "STD", names(pulledData), ignore.case = TRUE)
names(pulledData)<-gsub("-freq()", "Frequency", names(pulledData), ignore.case = TRUE)
names(pulledData)<-gsub("angle", "Angle", names(pulledData))
names(pulledData)<-gsub("gravity", "Gravity", names(pulledData))

##5. From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.

library(data.table)
pulledData$Subject <- as.factor(pulledData$Subject)
pulledData <- data.table(pulledData)
library(plyr)
tidy1 <- aggregate(. ~Subject + Activity, pulledData, mean)
tidy1 <- tidy1[order(tidy1$Subject,tidy1$Activity),]

#Write a Text file from step 5

write.table(tidy1, file="TidyData.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=TRUE)

#Read and View TidyData.txt

data <- read.table("./TidyData.txt")
View(data)


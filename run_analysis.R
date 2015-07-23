## Getting and Cleaning Data - Course Project

## Prep - Get Data
fileUrl<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "Dataset.zip", mode="wb")
unzip("Dataset.zip")

## Prep - Load Data
traindata<- read.table("UCI HAR Dataset/train/x_train.txt")
testdata<- read.table("UCI HAR Dataset/test/x_test.txt")
subjecttrain<- read.table("UCI HAR Dataset/train/subject_train.txt")
subjecttest<- read.table("UCI HAR Dataset/test/subject_test.txt")
trainlabels<- read.table("UCI HAR Dataset/train/y_train.txt")
testlabels<- read.table("UCI HAR Dataset/test/y_test.txt")
features<- read.table("UCI HAR Dataset/features.txt")
activities<- read.table("UCI HAR Dataset/activity_labels.txt")

## 1. Merge the data into 1 dataset

data_info<- rbind(traindata, testdata)
subject_info<- rbind(subjecttrain, subjecttest)
label_info<- rbind(trainlabels, testlabels)
total_info<- cbind(label_info, subject_info, data_info)

## 2.1.  Name the columns

feature_names<- as.character(features[,2])
new_names<- c("subject", "activity", feature_names)
colnames(total_info)<- new_names

## 2.2.  Extract only the means and standard deviations for each measurement

mean_measure<- grep("mean()", colnames(total_info))
std_measure<- grep("std()", colnames(total_info))
only_mean_std<- c(mean_measure, std_measure)
sorted_only<- sort(only_mean_std)
newdf<- total_info[, c(1, 2, sorted_only)]

## 3. Use descriptive activity names

library(reshape2)
newdf$activity<- factor(newdf$activity, levels = activities[,1], labels = activities[,2])
newdf$subject<- as.factor(newdf$subject)

## 4. Use descriptive variable names

colNames<- colnames(newdf)
for (i in 1:length(colNames))   {
  colNames[i] = gsub("subject", "Subject", colNames[i])
  colNames[i] = gsub("activity", "Activity", colNames[i])
  colNames[i] = gsub("-mean", "Mean", colNames[i])
  colNames[i] = gsub("-std", "StdDev", colNames[i])
  colNames[i] = gsub("\\()", " ", colNames[i])
  colNames[i] = gsub("^t()", "time", colNames[i])
  colNames[i] = gsub("^f()", "freq", colNames[i])
  colNames[i] = gsub("([Gg]ravity)", "Gravity", colNames[i])
  colNames[i] = gsub("([Bb]ody)", "Body", colNames[i])
  colNames[i] = gsub("([Gg]yro)", "Gyro", colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)", "BodyAccJerkMag", colNames[i])
}
colnames(newdf) = colNames

## 4.1 Remove Mean Freq columns

newdf2<- newdf[, !grepl("Freq", colnames(newdf))]

## 5 Create a summary file of the averages of each variable for each activity and each subject

library(reshape2)
newdf2.melted<- melt(newdf2, id = c("Subject", "Activity"))
newdf2.mean<- dcast(newdf2.melted, Subject + Activity ~ variable, mean)

## 5.1 Write a file entitled "tidy.txt" using the write.table() and row.names=FALSE

write.table(newdf2.mean, "tidy.txt", row.names = FALSE, quote = FALSE)


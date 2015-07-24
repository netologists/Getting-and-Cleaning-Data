## Getting and Cleaning Data - Course Project

## Prep - Get Data
fileUrl<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "Dataset.zip", mode="wb")
unzip("Dataset.zip")

## Prep - Load Data

library(plyr)

traindata<- read.table("UCI HAR Dataset/train/x_train.txt", header=FALSE, stringsAsFactors=FALSE)
testdata<- read.table("UCI HAR Dataset/test/x_test.txt", header=FALSE, stringsAsFactors=FALSE)
subjecttrain<- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("SubjectID"))
subjecttest<- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("SubjectID"))
trainlabels<- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("Activity"))
testlabels<- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("Activity"))
features<- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
activities<- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)

## 1. Merge the data into 1 dataset

train_info<- cbind(trainlabels, subjecttrain, traindata)
test_info<- cbind(testlabels, subjecttest, testdata)
total_info<- rbind(train_info, test_info)


## 2.  Extract only the means and standard deviations for each measurement

measure<- total_info[, c(c(1:2), grep(".*mean|std.*", features$V2)+2)]
names<- grep(".*mean|std.*", features$V2, value=TRUE)

## 3. Use descriptive activity names


measure$Activity<- as.factor(measure$Activity)
levels(measure$Activity)<- activities$V2

## 4. Use descriptive variable names

names(measure)<- c("Activity", "SubjectID", names)

colNames<- colnames(measure)

for (i in 1:length(colNames))   {
  colNames[i] = gsub("-mean", "Mean", colNames[i])
  colNames[i] = gsub("-std", "StdDev", colNames[i])
  colNames[i] = gsub("\\()", " ", colNames[i])
  colNames[i] = gsub("^t()", "time", colNames[i])
  colNames[i] = gsub("^f()", "freq", colNames[i])
  colNames[i] = gsub("([Gg]ravity)", "Gravity", colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", colNames[i])
  colNames[i] = gsub("([Gg]yro)", "Gyro", colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)", "BodyAccJerkMag", colNames[i])
}
colnames(measure) = colNames

## 4.1 Remove Mean Freq columns

newdf<- measure[, !grepl("Freq", colnames(measure))]

## 5 Create a summary file of the averages of each variable for each activity and each subject

library(reshape2)
newdf.melted<- melt(newdf, id = c("Activity", "SubjectID"))
newdf.mean<- dcast(newdf.melted, Activity + SubjectID ~ variable, mean)

## 5.1 Write a file entitled "tidy.txt" using the write.table() and row.names=FALSE

write.table(newdf.mean, "tidy.txt", row.names = FALSE)



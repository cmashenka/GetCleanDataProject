
##################################################################################
#This R script is designed to do the following:
# upoads data from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
#
# Please refer to readme.md and codebook.md for additional details
###################################################################################
###################################################################################
##   prepare the environment
###################################################################################
rm(list=ls())
###################################################################################
##   load required libraries
###################################################################################
library(plyr)
###################################################################################
##   step0. download and unzip the file into a Data folder in the wokring directory
###################################################################################
if(!file.exists("./data")){dir.create("./data")}
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip", method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
###################################################################################
##   step1. Merge the training and the test sets to create one data set
##          and use descriptive activity names to name the activities in the data set
###################################################################################
# Read data from Activity, Subject, Feature Activity Labels files into variables
file_path<-file.path("./data", "UCI HAR Dataset")
# a)Activity Tables
dataActivityTest<-read.table(file.path(file_path,"test","y_test.txt"), header=FALSE)
dataActivityTrain<-read.table(file.path(file_path,"train", "y_train.txt"), header=FALSE)
# b)Subject Tables
dataSubjectTest<-read.table(file.path(file_path,"test","subject_test.txt"), header=FALSE)
dataSubjectTrain<-read.table(file.path(file_path,"train","subject_train.txt"),header=FALSE)
# c)Feature Tables
dataFeatureTest<-read.table(file.path(file_path,"test", "x_test.txt"),header=FALSE)
dataFeatureTrain<-read.table(file.path(file_path,"train","x_train.txt"), header=FALSE)
# d)get Activity Names
activityNames<-read.table(file.path(file_path,"activity_labels.txt"), header=FALSE)
# Merge training and test data for all datasets
dataSubject<-rbind(dataSubjectTest, dataSubjectTrain)
dataActivity<-rbind(dataActivityTest, dataActivityTrain)
dataFeature<-rbind(dataFeatureTest, dataFeatureTrain)
# Merge Activity and Activity Labels to get activity names
dataActivity<-merge(dataActivity, activityNames, by="V1")
# Assign names to the variables
names(dataActivity)<-c("id","activity")
names(dataSubject)<-c("subject")
dataFeatureNames<-read.table(file.path(file_path,"features.txt"), header=FALSE)
names(dataFeature)<-dataFeatureNames$V2
# Merge all data to create a data frame
dataAC<-cbind(dataSubject,dataActivity)
df<-cbind(dataFeature, dataAC)
##############################################################################################
#        step2.Extract only the measurements of the mean and standard deviation
##############################################################################################
mean_std_feature_names<-dataFeatureNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeatureNames$V2)]
mynames<-c(as.character(mean_std_feature_names), "subject", "activity")
df<-subset(df,select=mynames)
##############################################################################################
#        step3. Appropriately label column names
##############################################################################################
names(df)<-gsub("^t", "time", names(df))
names(df)<-gsub("^f", "frequency", names(df))
names(df)<-gsub("Acc", "Accelerometer", names(df))
names(df)<-gsub("Gyro", "Gyroscope", names(df))
names(df)<-gsub("Mag", "Magnitude", names(df))
names(df)<-gsub("BodyBody", "Body", names(df))
##############################################################################################
#        step4. Create a tidy data set
##############################################################################################
tidydf = ddply(df, c("subject","activity"), numcolwise(mean))
##############################################################################################
#    Optional step (need to uncomment the code below if you want to create a .txt file)
# Save a tidy dataset into a tab dilimited .txt file 
##############################################################################################
#write.table(tidydf, file = "tidydata.txt",row.name=FALSE, sep='\t')

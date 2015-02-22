---
title: "CodeBook.md" 
---
##For Getting and Cleaning Data Course Project

###Description
This document provides information about run_analysis.R script.
It describes the variables, the data, and any transformations or work that was performed to 
clean up the data.

### Source Data Information
The Raw data used for this course project was obtained at UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The "run_analysis.R" script intergrates logic for uploading raw data into the wroking directory into a "Data"" folder. The source data can also be found on UCI site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

####Attribute Information:

For each record in the dataset it is provided: 
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.

#### Data Transformations

#####Step1. Merge the training and the test sets to create one data set and use descriptive activity names to name the activities in the data set.
In this step test and training data (x_train.txt", "x_test.txt"), actvity dataa ("y_test.txt", "y_train.txt"), subject IDs (subject_train.txt, subject_text.txt) were merged to obtain a combined data frame. data file activity_labels.txt is used to name activities, and 
features.txt is used to name each measure in the data frame.

#####Step2.Extract only the measurements of the mean and standard deviation
in this step we extract only measures that are capturing mean and std from the merged data set

#####Step3. Appropriately label column names
In this step, measure lables are cleaned up and updated to more meaningful names.

#####Step4. Create a tidy data set
In this step we aggregate the data set to contain averages for each variable by activity and subject. 

##### Optional step in the script allows to save tidy data set into a .txt tab delimited file.

The tidy data set is saved in the variable tidydf. After running the script you can see sample data by running the following comand
head(tidydf, 3)

####Tidy Data Set information
after data was merged, the data frame contained 10299 observations for 66 variables organized by subject and activity
the final tidy data set, after agregation for measurement of averages contains 35 observations for 66 variables. 
 

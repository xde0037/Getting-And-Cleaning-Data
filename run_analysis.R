########################################################################################################## 

## Coursera Getting and Cleaning Data Course Project 
## C.Bhatt
## February,2016
 
# run_analysis.R File Description: 
 
# This script will perform the following steps on the UCI HAR Dataset downloaded from  
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 1. Merge the training and the test sets to create one data set. 
# 2. Extract only the measurements on the mean and standard deviation for each measurement.  
# 3. Use descriptive activity names to name the activities in the data set 
# 4. Appropriately label the data set with descriptive activity names.  
# 5. Creates a second, independent tidy data set with the average of each variable for each 
#     activity and each subject.  

# Note : The input data file as downloaded from above web link will be in ZIP format, and so it must be
#        unzipped in appropriate folder and use that folder as a working directory in order to 
#        run this analysis.
##########################################################################################################
 
# Clear the workspace 
rm(list=ls()) 
# Note : Change following paths as per the directory set up on your computer.
# Please note that when you unzip the input data file, it would create its own
# folder called "UCI HAR Dataset" in your working directory.
setwd('C:\\Users\\Chetan\\datasciencecoursera\\UCI HAR Dataset')

path_tree <-file.path("C:\\Users\\Chetan\\datasciencecoursera" , "UCI HAR Dataset")

files<-list.files(path_tree, recursive=TRUE)

#Read the Activity files
dataActivityTest  <- read.table(file.path(path_tree, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_tree, "train", "Y_train.txt"),header = FALSE)

#Read the Subject files
dataSubjectTrain <- read.table(file.path(path_tree, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_tree, "test" , "subject_test.txt"),header = FALSE)

#Read Fearures files
dataFeaturesTest  <- read.table(file.path(path_tree, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_tree, "train", "X_train.txt"),header = FALSE)

# [1] : Merges the training and the test sets to create one data set

#1.1 : Concatenate the data tables by rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

#1.2 : Set names for variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_tree, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

#1.3 : Merge columns to get the data frame Data for all data
dataCombine <- cbind(dataSubject, dataActivity)
#1.4 : this is our combined/merged dataset
Data <- cbind(dataFeatures, dataCombine)

# [2] : Extracts only the measurements on the mean and standard deviation for each measurement:
# 2.1 : Subset Name of Features by measurements on the mean and standard deviation
#       i.e. take the Names of Features with "mean()" or "std()"

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# 2.2 : Subset the data frame Data by seleted names of Features

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

# [3] : Uses descriptive activity names to name the activities in the data set

# 3.1 : Read descriptive activity names from "activity_labels.txt"

activityLabels <- read.table(file.path(path_tree, "activity_labels.txt"),header = FALSE)

# 3.2 : Facorize Variale activity in the data frame Data using descriptive activity names

# [4] :  Appropriately labels the data set with descriptive variable names

# Above, variables activity and subject and names of the activities have 
# been labelled using descriptive names. In following part, Names of Feteatures will labelled 
# using descriptive variable names.

#-- prefix t is replaced by time
#-- Acc is replaced by Accelerometer
#-- Gyro is replaced by Gyroscope
#-- prefix f is replaced by frequency
#-- Mag is replaced by Magnitude
#-- BodyBody is replaced by Body

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

# [5] : Creates a second,independent tidy data set and ouput it :

# In this part,a second, independent tidy data set will be created with the average 
# of each variable for each activity and each subject based on the data set in step 4.

library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "Tidy_Dataset_Output.txt",row.name=FALSE)

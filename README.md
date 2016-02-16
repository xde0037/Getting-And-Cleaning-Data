Getting and Cleaning Data Course Project

Project of Getting and Cleaning Data course on Coursera by John Hopkins University - 2016

Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean 
the data set. The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project.

You will be required to submit:

1.a tidy data set as described below
2.a link to a Github repository with your script for performing the analysis, and
3.a code book that describes the variables, the data, and any transformations or work 
  that you performed to clean up the data called CodeBook.md. You should also 
  include a README.md in the repo with your scripts. This file explains how all of the 
  scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
algorithms to attract new users. The data linked to from the course website represent 
data collected from the accelerometers from the Samsung Galaxy S smartphone. A full 
description is available at the site where the data was 
obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones     [1]

The data for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  [2]

You should create one R script called run_analysis.R that does the following. :

�Merges the training and the test sets to create one data set.
�Extracts only the measurements on the mean and standard deviation for each measurement. 
�Uses descriptive activity names to name the activities in the data set
�Appropriately labels the data set with descriptive activity names. 
�Creates a second, independent tidy data set with the average of each variable for each 
 activity and each subject. 

The Project Repository Contains following:

�codebook.md: information about raw and tidy data set and elaboration made to transform them.
�LICENSE: license terms for text and code.
�README.md: this file.
�run_analysis.R: R script to transform raw data set in a tidy one.

How to create the tidy data set:

1.clone this repository: git clone https://github.com/xde0037/Getting-And-Cleaning-Data
2.download compressed raw data from the link [2] above.
3.unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory
4.open a R console and set the working directory to the repository root (use setwd())
5.source run_analisys.R script (it requires the plyr package): source('run_analysis.R')

In the repository root directory you find the 
file sensor_avg_by_act_sub.txt with the tidy data set.
====================================================================================================

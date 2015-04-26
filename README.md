# Getting_and_cleaning_data
Getting and cleaning data course project

This document explains how the script run_analysis.R works. In general the script creates a tidy data text file that meets the principles of "tidy data" from given data at (1):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The tidy data contains average values of the mean and standard deviation measurement for each activity and each subject. 

The CodeBook.md file defines the variables in the tidy data file created by run_analysis.R.

In detail, the script run_analysis.R does the following:
- Line 3 to 19: Read the data from the files which is downloaded from the above link (1).
- Line 21 to 23: Merge the train and test data sets into one data named "mergedData".
- Line 25 to 26: Create a new data "extractedData" that has the subject and label columns and columns that contain the measurements on the mean and standard devidation for each measurement from the data "mergedData".
- Line 28 to 31: Give the label column the detailed names of the activities.
- Line 33 to 34: Create tidy data with the average of each variable for each activity and each subject
- Line 36 to 37: Write the tidy data set to a txt file


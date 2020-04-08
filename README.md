# getting-cleaning
Getting and Cleaning data course project

The objective of the script that comes with this repo is to perform the following steps on a public data set.

The data used for this course project was collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script called run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The repo includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Shows information about the variables used on the tidy set.

- 'run_analysis.R': Shows the script to get and clean the raw data so that you get a tidy data set where all mean and standard deviation features are averaged per activity and subject. 

Notes: 
======
- Features are normalized and bounded within [-1,1].


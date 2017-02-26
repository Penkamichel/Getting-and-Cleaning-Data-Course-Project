# Getting-and-Cleaning-Data-Course-Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This R script (run_analysis.R) does the followings;

1. Preparation
  - Read the nessesary library: data.table and dplyr
  - Check if the working directory is on the "UCI HAR Dataset". (This folder is automatically created when you download the data from the link above.)
  - Read the every txt file. Each data table name is same name of the txt file, but the "/" become "-" and remove ".txt".
  - Labeing the dataset with descriptive variable names.
2. Merges the training and the test sets to create one data set.
  - 
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Create the txt file called "EachMean.txt" from the data set created in step 5.

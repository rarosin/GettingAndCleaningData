## README

This file explain how to download, process and treat the data in order to have the tidy data.

###Downloading resquested data

1. Download the zip file from the web: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the content of the file to your desired folder.
3. The unzip process will generate the folder "UCI HAR Dataset"
4. In the same folder that you have now the folder "UCI HAR Dataset", download the script R code run_analysis.R


###Script run_analyses.R

1. This script load the requested data from the folder "UCI HAR Dataset".
1. Union the tables through the comand rbind. For example, X_data is created with the union of X_test and X_train.
2. Keep only the mean and standard deviation for each measurement in the table X_data
3. Update Y data with activity_labels joining the tables
4. Rename the label of the data tables: X_data labels received features names
5. Generate tidy_data through the union of the colums (cbind)
6. Generate tidy_data_2 with the average of each variable for each activity and each subject


### Generated file

This code also creates the file tidy_data_2.txt with the average of each variable for each activity and each subject.

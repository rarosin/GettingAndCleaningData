## Code Book

Code book that describes the variables, the data, and transformations or work that were performed to clean up the data.

### Initial data

The initial data used in this project (that represent data collected from the accelerometers from the Samsung Galaxy S smartphone) can be downloaded through the link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Transformation

The following steps were permormed during the cleaning process of the data:

1. union the tables
2. keep only the mean and standard deviation for each measurement
3. update Y data with activity_labels joining the tables
#renaming the label of the data tables
#generation of tidy_data through the union of the colums


### Resulting variables


### Generated file

As a result, this code creates the file tidy_data_2.txt with the average of each variable for each activity and each subject

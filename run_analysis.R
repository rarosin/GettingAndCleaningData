
##########################################################################
# 1. Merges the training and the test sets to create one data set.       #
##########################################################################

#first read the tables
#read data related to test from txt files
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("UCI HAR Dataset/test/Y_test.txt")

#read data related to train from txt files
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("UCI HAR Dataset/train/Y_train.txt")

#union the tables
subject_data <- rbind(subject_test, subject_train)
X_data <- rbind(X_test, X_train)
Y_data <- rbind(Y_test, Y_train)

#read the feature list and than read the second coloum
features <- read.table("UCI HAR Dataset/features.txt")


##########################################################################
# 2. Extracts only the measurements on the mean and standard deviation   #
#    for each measurement.                                               #
##########################################################################

#keep only the measurements on the mean and standard deviation for each measurement
features_names <- features$V2
features_mean_std <- grepl("(mean|std)\\(\\)", features_names)
X_data_mean_std <- X_data[,features_mean_std]


###############################################################################
# 3. Uses descriptive activity names to name the activities in the data set   #
###############################################################################

#read the activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#update Y data with activity_labels joining the tables
Y_data[,1] <- activity_labels[Y_data[,1],2]


##########################################################################
# 4. Appropriately labels the data set with descriptive variable names   #
##########################################################################

#renaming the label of the data tables
names(X_data_mean_std) <- features[features_mean_std,2]
names(Y_data)<-"Activity"
names(subject_data)<-"Subject"

#union the colums
tidy_data <- cbind(subject_data, Y_data, X_data_mean_std)


################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data      #
#    set with the average of each variable for each activity and each subject. #
################################################################################

tidy_data_2 <- aggregate(. ~Subject + Activity, tidy_data, mean)
write.table(tidy_data_2, file = "tidy_data_2.txt",row.name=FALSE)


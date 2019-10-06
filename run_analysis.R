#Assignment for Data Cleaning
#Purpose:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step1: Reading the training data
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/train/X_train.txt"
data_training=read.csv(file,header=FALSE,sep="")
#Step2: Reading the test data
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/test/X_test.txt"
data_test=read.csv(file,header=FALSE,sep="")
#Step3: Merging the training and test data
data_set=rbind(data_training,data_test)
#Step4: Reading the features and name the header
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/features.txt"
features=read.csv(file,header=FALSE,sep="")[2]
names(data_set)=features[ ,1]

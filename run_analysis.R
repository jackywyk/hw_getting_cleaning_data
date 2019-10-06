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
#Step5: Extract only std or mean measurement column
data_set=data_set[grepl("std|mean",names(data_set),ignore.case = TRUE)]
#Step6: Correspoding person subject (training)
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/train/subject_train.txt"
person_training=read.csv(file,header=FALSE,sep="")
#Step7: Correspoding person subject (training)
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/test/subject_test.txt"
person_test=read.csv(file,header=FALSE,sep="")
#Step8: Merging training and test person data
person=rbind(person_training,person_test)
#Step9: Merging PersonID to data_set
names(person)="PersonID"
data_set=cbind(person,data_set)
#Step10: Reading training activities
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/train/Y_train.txt"
activities_training=read.csv(file,header=FALSE,sep="")
#Step11: Reading test activities
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/test/Y_test.txt"
activities_test=read.csv(file,header=FALSE,sep="")
#Step12: Merging training and test activities data
activities=rbind(activities_training,activities_test)
names(activities)='activities_id'
#Step13:Connect activities ID to activities.txt
file="C:/Users/jacky/Documents/Course/Data Cleaning/Data/UCI HAR Dataset/activity_labels.txt"
label_activities=read.csv(file,header=FALSE,sep="")
names(label_activities)[1:2]=c('activities_id','Activity')
data_activities=merge(activities,label_activities)
#Step14: Merging activities data to dataset
data_set=cbind(data_activities[2],data_set)
#Step15: Export to create codebook
write.csv(data_set,'./result.csv')
#Step16: Summarized the result group by personal and activity
library(dplyr)
data_summary=group_by(data_set,Activity,PersonID)
data_summary=summarise_each(data_summary,funs=mean)
write.table(data_summary,'./summary.txt',row.names=FALSE)
nrow(data_summary)
#data_training
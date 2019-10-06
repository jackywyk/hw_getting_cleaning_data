#Assignment for Data Cleaning
#Purpose:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step1: Reading the training data
file="./X_train.txt"
data_training=read.csv(file,header=FALSE,sep="")
#Step2: Reading the test data
file="./X_test.txt"
data_test=read.csv(file,header=FALSE,sep="")
#Step3: Merging the training and test data
data_set=rbind(data_training,data_test)
#Step4: Reading the features and name the header
file="./features.txt"
features=read.csv(file,header=FALSE,sep="")[2]
names(data_set)=features[ ,1]
#Step5: Extract only std or mean measurement column
data_set=data_set[grepl("std|mean",names(data_set),ignore.case = TRUE)]
#Step6: Correspoding person subject (training)
file="./subject_train.txt"
person_training=read.csv(file,header=FALSE,sep="")
#Step7: Correspoding person subject (training)
file="./subject_test.txt"
person_test=read.csv(file,header=FALSE,sep="")
#Step8: Merging training and test person data
person=rbind(person_training,person_test)
#Step9: Merging PersonID to data_set
names(person)="PersonID"
data_set=cbind(person,data_set)
#Step10: Reading training activities
file="./Y_train.txt"
activities_training=read.csv(file,header=FALSE,sep="")
#Step11: Reading test activities
file="./Y_test.txt"
activities_test=read.csv(file,header=FALSE,sep="")
#Step12: Merging training and test activities data
activities=rbind(activities_training,activities_test)
names(activities)='activities_id'
#Step13: Merging activities data to dataset
data_set=cbind(activities,data_set)
#Step14:Connect activities ID to activities.txt
file="./activity_labels.txt"
label_activities=read.csv(file,header=FALSE,sep="")
names(label_activities)[1:2]=c('activities_id','Activity')
data_activities=merge(data_set,label_activities,by.x = "activities_id", by.y = "activities_id",sort=TRUE)
#Step15: Export to create codebook
library(dplyr)
data_set=select(data_activities,-c(activities_id))
write.csv(data_set,'./result.csv')
#Step16: Summarized the result group by personal and activity
data_summary=group_by(data_set,Activity,PersonID)
data_summary=summarise_each(data_summary,funs=mean)
write.table(data_summary,'./summary.txt',row.names=FALSE)
data_summary
#data_training
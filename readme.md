run_analysis.R - the script to perform analysis
#Assignment for Data Cleaning
#Purpose:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step1: Reading the training data
#Step2: Reading the test data
#Step3: Merging the training and test data
#Step4: Reading the features and name the header
#Step5: Extract only std or mean measurement column
#Step6: Correspoding person subject (training)
#Step7: Correspoding person subject (training)
#Step8: Merging training and test person data
#Step9: Merging PersonID to data_set
#Step10: Reading training activities
#Step11: Reading test activities
#Step12: Merging training and test activities data
#Step13:Connect activities ID to activities.txt
#Step14: Merging activities data to dataset
#Step15: Export to create codebook
#Step16: Summarized the result group by personal and activity


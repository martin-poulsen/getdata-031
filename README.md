# Getting and Cleaning Data - course project

The run_analysis.R script combines the test and training datasets from the Samsung Galaxy S dataset.
All columns containing mean or std. deviation calculations are selected and then summarized by calculating the average by subject and activity.

The process is as follows:
 
The feature and activity labels, which are common to both datasets (test and train) are read from "UCI HAR Dataset/features.txt" and "UCI HAR Dataset/activity_labels.txt".
The columns with names containing the text "mean()" or "std()" are selected into a small dataframe (meanAndStdColumns), in order to be able to select the appropriate columns from the test and train datasets.

The test dataset is read from "UCI HAR Dataset/test/X_test.txt". The subjects are read from "UCI HAR Dataset/test/subject_test.txt"
Activities are read from "UCI HAR Dataset/test/y_test.txt". The resulting data frame is merged with the activity_labels dataset in order to get the labels rather than numerical codes.

Activity labels and subjects are added as two columns to the test dataset, using the cbind function

The process is repeated with the train datasets, now read from "UCI HAR Dataset/train/X_train.txt", "UCI HAR Dataset/train/Y_train.txt" and "UCI HAR Dataset/train/subject_train.txt"

Then the two datasets are combined with rbind

The summary by subject and activity is calculated using the summaryBy function

Finally the correct column names are copied from the meanAndStdColumns data frame to the summary data frame

The summary data frame is saved to a file with the write.table function
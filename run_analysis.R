library(doBy)
# Read feature and activity labels - common to both datasets
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Select only columns containing mean() and std() values
meanAndStdColumns <- features[grepl("mean\\(\\)|std\\(\\)", features$V2),]

# Read the test dataset
x <- read.table("UCI HAR Dataset/test/X_test.txt")
x <- x[, meanAndStdColumns$V1]
y <- read.table("UCI HAR Dataset/test/y_test.txt")
subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Insert subject and activity column
activity <- merge(y, activity_labels, by = "V1")$V2
subject <- subject$V1
test <- cbind(subject, activity, x)

# Read the train dataset
x <- read.table("UCI HAR Dataset/train/X_train.txt")
x <- x[, meanAndStdColumns$V1]
y <- read.table("UCI HAR Dataset/train/y_train.txt")
subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Insert subject and activity column
activity <- merge(y, activity_labels, by = "V1")$V2
subject <- subject$V1
train <- cbind(subject, activity, x)

# Combine the two datasets
complete <- rbind(train, test)

# Calculate summary
summary <- summaryBy(.~subject+activity,data=complete,FUN=mean)

# Assign feature names to columns
colnames(summary) <- c("subject", "activity", as.vector(meanAndStdColumns$V2))

write.table(summary, file="tidy_dataset.txt", row.names = FALSE)
#read in all six tables necessary for project
X_train <- read.table(".//UCI_HAR_Dataset//train/X_train.txt")
y_train <- read.table(".//UCI_HAR_Dataset//train/y_train.txt")
subject_train <- read.table(".//UCI_HAR_Dataset//train/subject_train.txt")
X_test <- read.table(".//UCI_HAR_Dataset//test/X_test.txt")
y_test <- read.table(".//UCI_HAR_Dataset//test/y_test.txt")
subject_test <- read.table(".//UCI_HAR_Dataset//test/subject_test.txt")
activity_labels <- read.table(".//UCI_HAR_Dataset//activity_labels.txt")
features_table <- read.table(".//UCI_HAR_Dataset//features.txt")
features <- as.character(features_table$V2)

#merge activity name with the associated class labels
merged_train <- merge(y_train, activity_labels, sort = F)
merged_test <- merge(y_test, activity_labels, sort = F)

#combine the activity names with the X_datasets, and assign column names
train_combine <- cbind(subject_train, merged_train$V2, X_train)
colnames(train_combine) <- c("Subject", "Activity", features)
test_combine <- cbind(subject_test, merged_test$V2, X_test)
colnames(test_combine) <- c("Subject", "Activity", features)

#combine the training and test datasets
all_readings <- rbind(train_combine, test_combine)

#extract means and standard devs
msd_readings <- data.frame(all_readings[,1:2])
all_cols <- colnames(all_readings)
for(i in 1:length(colnames(all_readings))){
    if (grepl("mean", all_cols[i]) | grepl("std", all_cols[i])){
        msd_readings <- cbind(msd_readings, all_readings[i])
    }
}

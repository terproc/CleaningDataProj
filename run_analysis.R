library(data.table)

#read in all eight tables necessary for project, and make features suitable for column names
X_train <- read.table(".//UCI_HAR_Dataset//train/X_train.txt")
y_train <- read.table(".//UCI_HAR_Dataset//train/y_train.txt")
subject_train <- read.table(".//UCI_HAR_Dataset//train/subject_train.txt")
X_test <- read.table(".//UCI_HAR_Dataset//test/X_test.txt")
y_test <- read.table(".//UCI_HAR_Dataset//test/y_test.txt")
subject_test <- read.table(".//UCI_HAR_Dataset//test/subject_test.txt")
activity_labels <- read.table(".//UCI_HAR_Dataset//activity_labels.txt", col.names = c("acty_num", "Activity"))
features_table <- read.table(".//UCI_HAR_Dataset//features.txt")
features <- gsub("[-() ]","",as.character(features_table$V2))

#merge activity name with the associated class labels
y_train$id <- 1:nrow(y_train)
merged_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "acty_num", all.x = T, sort = F)
merged_train <- merged_train[order(merged_train$id),]
y_test$id <- 1:nrow(y_test)
merged_test <- merge(y_test, activity_labels, by.x = "V1", by.y = "acty_num", all.x = T, sort = F)
merged_test <- merged_test[order(merged_test$id),]

#combine the activity names with the X_datasets, and assign column names
train_combine <- cbind(subject_train, merged_train$Activity, X_train)
colnames(train_combine) <- c("Subject", "Activity", features)
test_combine <- cbind(subject_test, merged_test$Activity, X_test)
colnames(test_combine) <- c("Subject", "Activity", features)

#combine the training and test datasets
all_readings <- rbind(train_combine, test_combine)

#extract means and standard devs
msd_readings <- data.frame(all_readings[,1:2])
colsNames <- colnames(all_readings)
for(i in 1:length(colsNames)){
    if (grepl("mean", colsNames[i]) | grepl("std", colsNames[i])){
        msd_readings <- cbind(msd_readings, all_readings[i])
    }
}

#calculate means for each column by Subject and Activity combined
msdBySubjAndActy <- unique(msd_readings[,1:2])
colsNames <- colnames(msd_readings)[c(-1,-2)]
msd_readings <- data.table(msd_readings)
for (i in colsNames){
    msdBySubjAndActy[i] <- msd_readings[,mean(eval(as.name(i))),by="Subject,Activity"][,V1]
}

#output msdBySubjAndActy to a table per instructions
write.table(msdBySubjAndActy, ".//means_and_standard_devs_by_subject_and_activity.txt", row.names = F)
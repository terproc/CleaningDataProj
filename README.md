# CleaningDataProj
Repo for Getting and Cleaning Data course project
=================================================

This repo contains a single R script, run_analysis.R, that combines multiple tables from the UCI HAR Dataset, simplfies it into a tidy dataset, takes the means of the data columns of that tidy dataset, and exports that as a .txt file.

The files from the UCI HAR Dataset it reads from are:

* train/X_train.txt: training dataset readings assigned to X_train
* train/y_train.txt: training dataset activity labels assigned to y_train
* train/subject_train.txt: which subject was measured in the training dataset assigned to subject_train
* test/X_test.txt: testing dataset readings assigned to X_test
* test/y_test.txt: testing dataset activity labels assigned to y_test
* test/subject_test.txt: which subject was measured in the testing dataset assigned to subject_test
* activity_labels.txt: activity names by their activity label number assigned to activity_labels
* features.txt: the variable contained in each column of the training and testing datasets assigned to features_table

It accomplishes this by the following steps:

1. Read in all eight files and assign them their respective names
2. Remove the characters -,(,), and a blank space, from features_table, and assign the result to features
3. Merge the activity table y_train to activity_labels, in order to match the activity number to its activity name. Ensure the row order remains the same by creating a temporary, sequential id variable before merging, and then reordering the resulting table by that id after the merge.  Do the same steps to y_test as well.
4. Use cbind to combine the subject number column (subject_train), the table of activity names (results of the last step), and the readings datasets (X_train). Do the same step for subject_test and X_test as well.
5. Combine with cbind the two tables created in the last step, the train table and test table, into a single data frame containing all of the readings.
6. Create a new data frame, msd_readings, containing only the data columns which contain to a mean or standard deviation, as well of course as the descriptive Subject and Activity columns. This is accomplished using the "grepl" function.
7. Create another new data frame, msdBySubjAndActy, containing the mean of each data column of msd_readings, by both Subject and Activity. This is accomplished by converting msd_readings into a data.table and iterating over its 79 data columns. The resulting msdBySubjAndActy data frame has 180 observations of 81 variables, of which two columns are the Subject and the Activity, with the rest the corresponding means of those columns by Subject and Activity.
8. Writes msdBySubjAndActy to a text file in the working directory titled "means_of_means_and_standard_devs_by_subject_and_activity.txt". The row names are not included in the file.
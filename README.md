# CleaningDataProj
Repo for Getting and Cleaning Data course project
=================================================

This repo contains a single R script, run_analysis.R, that combines multiple tables from the UCI HAR Dataset, simplfies it into a tidy dataset, takes the means of the data columns of that tidy dataset, and exports that as a .txt file.

It accomplishes this by the following steps:
    1. Read in the training and test datasets, subject column, activity column (assigned a number), activity name (assigning an activity name to each number), and names for each data column.
    2. Remove the characters -,(,), and a blank space, from the data column names
    3. 
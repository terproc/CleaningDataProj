Codebook for Getting and Cleaning Data course project
=====================================================

This codebook seeks to explain the various data columns that are contained within the output text file written the by run_analysis.R script. The script manipulates the data from the Human Activity Recognition Using Smartphones Dataset.

The output file contains a tidy dataset consisting of 180 observations of 81 variables. The first two variables are the subject performing the experiment (by number, 1 to 30) and the activity they performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The following 79 variables are the means of either the mean or standard deviation of various measurements conducted on the subjects as they conducted one of the six activities while wearing a smartphone. By leaving them in their abbreviated form, the dataset's column names do not become unnecessarily large. Furthermore, by keeping the column names similar to the original dataset, it is easier for users of the output to reference the original data if they so wish. While the variable names may initially be confusing looking, breaking them down into chunks makes them more understandable and descriptive:

* Each variable contains either "mean" or "std" referring to whether it is a measurement of the mean of the mean or standard deviation.
* Each variable also begins with either "t" or "f", referring to whether it is measuring time domain signals or frequency domain signals.
* Many variables end with either "X", "Y", or "Z", referring to which axis the signals were collected along.
* "Acc" and "Gyro" reference the part of the smartphone collecting the data, either the accelerometer or the gyroscope.
* The acceleration signals were then separated into body and gravity acceleration, annotated "Body" and "Gravity".
* The authors of the study also conducted further calculations to produce the "Jerk" signals, and find the magnitude of the three dimensional signals, "Mag".

Putting it all together:
For example, for "tBodyAccmeanX", the column contains the mean by subject and activity of:  
the mean of time domain body acceleration signals in the x-axis.

Note:
- Features are normalized and bounded within [-1,1].

Many thanks to the authors of the original study, for their informative notes and the datasets themselves:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
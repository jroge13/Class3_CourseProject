# Class3_CourseProject
This is a README file for the Class 3 Course Project.

Reference for Data
Before continuing on, I would like to acknowledge where this data is coming from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Location for the Data
The data can be downloaded via this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files of Importance
The relevant files for this project are as follows:
“test/X_test.txt”
“train/X_train.txt”
“test/Y_test.txt”
“train/Y_train.txt”
“test/subject_test.txt”
“train/subject_train.txt”
“features.txt”
“activity_labels.txt”

Good reference files:
“features_info.txt”
“README.txt”

Protocol
Before proceeding, please note that this protocol uses R Studio, version 3.2.1 on Windows. Please edit commands as necessary to fit your particular program.

1) The “test/subject_test.txt” and “train/subject_train.txt” files contain the subject identifiers, the “test/Y_test.txt” and “train/Y_train.txt” files contain activities each subject performed, and the “test/X_test.txt” and “train/X_train.txt” files contain measure variable information. Name the variables in the subject files as “subject” and the variables in the activity files as “activity”. For the measure variables, use the “features.txt” file to name those variables.

2) When reading and combining these data, there should be a total of 563 variables, 10299 observations, and no missing values in any variables. There should never be any missing values throughout this entire program.

3) The final dataset of interest is of variables that look at means and standard deviations of the measures. So, extract only those variables that contain “mean”, “Mean”, “Std”, or “std” as part of their name, as well as the “activity” and “subject” variables to have identifiers. This gives a dataset of 87 variables and 10299 observations.

4) After extraction, use the values found in the “activity_labels.txt” to rename the labels in the “activity” variable. 

5) To clean up the names, take out the miscellaneous information (in this case, the “X###” portion and any text that wasn’t properly read in from the text files). These keep the set variable names as they are specific to measure type, how they are measured, and if they refer to mean or std.

6) Because means will need to be calculated by subject and activity, combine “subject” and newly relabeled “activity” to create the “id” variable.

7) Find the means of each of these variables. This should produce a dataset of 180 observations and 87 variables.  


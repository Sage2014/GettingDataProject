#Hello
This run_analysis.R script does the following:
###STEP 1 - DOWNLOAD THIS DATASET from UCI -
	### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###STEP 2 - UNZIP AND READS SEVERAL DETAILED DATA TABLES, including
	###/test/X_test.txt
	###/train/X_train.txt
	###activity_labels.txt"
	###/test/y_test.txt"
	###/train/y_train.txt"
	###test/subject_test.txt"
	###/train/subject_train.txt"
	###features.txt
###STEP 3 - Add labels 
###STEP 4 - Merge the train and test data into a single table
###STEP 5 - Create a smaller table with only the variables we need
###STEP 6 - Use Aggregate to calculate means by subject and activity, and export to a text file


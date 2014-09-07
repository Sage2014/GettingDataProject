#Hello
If you are looking at this file, you are probably entrolled in Jeff Leek's Getting Data Class from Coursera, and you're
reviewing my project assignment. 

In this Repository you will find 4 files:

	#####(1) Run_Analysis.R - This script downloads a dataset from UCI, unzips it, reads several interrelated datatables, combines them into a single tidy dataset, and writes a summary file in text format. More on exactly what it does below.
	#####(2) CodeBook.md - This file describes each variable in the file and how it was coded.
	#####(3) TidyData.txt - This is what the script produces when you run it. Per our discussion forums, it is supposed to have 180 rows because all subjects completed all activities (6 activities per subject x 30 subjects = 180). 
	#####(4) This ReadMe.md file - Trying to make it as helpful as possible.

Please provide any helpful hints and tips you can in your feedback - my best learnings in this class come from fellow students!

Thank you for having a look!

Kristen
 
####The Run_Analysis.R script does the following:

STEP 1 - DOWNLOAD THIS DATASET from UCI -
	### https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

STEP 2 - UNZIP AND READS SEVERAL DETAILED DATA TABLES, including:

	###/test/X_test.txt
	###/train/X_train.txt
	###activity_labels.txt"
	###/test/y_test.txt"
	###/train/y_train.txt"
	###test/subject_test.txt"
	###/train/subject_train.txt"
	###features.txt

STEP 3 - Add labels 

STEP 4 - Merge the train and test data into a single table

STEP 5 - Create a smaller table with only the variables we need

STEP 6 - Use Aggregate to calculate means by subject and activity, and export to a text file


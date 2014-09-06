#Hello
If you are looking at this file, you are probably entrolled in Jeff Leek's Getting Data Class from Coursera, and you're
reviewing my project assignment. Thank you for having a look!

In this Repository you will find 4 files:

	#####(1) Run_Analysis.R - This script downloads a dataset from UCI, unzips it, reads several interrelated datatables, combines them into a single tidy dataset, and writes a summary file in text format. More on exactly what it does below.
	#####(2) CodeBook.md - This file describes each variable in the file and how it was coded, at least to my best ability since I was not the primary researcher, just a student looking at someone else's dataset just like you.
	#####(3) TidyData.txt - This is what the script produces when you run it. Apparently, it is supposed to have 6 rows per subject, and there are 30 subjects in the experiment (total of 180 rows): In our forums they said all subjects completed all activities, and I did confirm this looking at the original raw data file.
	#####(4) This ReadMe.md file - Trying to make it as helpful as possible.

I'm brand new to R, and Github, and all this - so any helpful hints and tips you can provide in your feedback are very much appreciated!

Happy Grading!

Kristen
 
###The Run_Analysis.R script does the following:

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


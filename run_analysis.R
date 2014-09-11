#STEP 1 - DOWNLOAD THE DATASET
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/project.zip")

#STEP 2 - UNZIP AND READ THE DATA TABLES
#Note that the dowloaded file will not be stored on your PC - it is unlinked after the data are extracted into R
tests = read.table(unz("./data/project.zip","UCI HAR Dataset/test/X_test.txt"))
trains = read.table(unz("./data/project.zip","UCI HAR Dataset/train/X_train.txt"))
activity_labels = read.table(unz("./data/project.zip","UCI HAR Dataset/activity_labels.txt"))
tests_labels = read.table(unz("./data/project.zip","UCI HAR Dataset/test/y_test.txt"))
train_labels = read.table(unz("./data/project.zip","UCI HAR Dataset/train/y_train.txt"))
tests_subjects = read.table(unz("./data/project.zip","UCI HAR Dataset/test/subject_test.txt"))
train_subjects = read.table(unz("./data/project.zip","UCI HAR Dataset/train/subject_train.txt"))
features = read.table(unz("./data/project.zip","UCI HAR Dataset/features.txt"),colClasses="character")
unlink("./data/project.zip")

# STEP 3 - COMBINE DATA AND ADD LABELS 
#3a - add subject ID
#Note that both Subject ID variables have the same name so that rbind works
tests2 = cbind <- cbind(tests,V562=tests_subjects[,1])
trains2 = cbind <- cbind(trains,V562=train_subjects[,1])

#3b - add the activityIDs  to each
tests3 = cbind(tests2,V563=tests_labels[,1])
trains3 = cbind(trains2,V563=train_labels[,1])

#STEP 4 -  MERGE THE TRAINING AND TEST DATA
# The rbind command below should make tests be the first 2947 rows.
combo <- rbind(tests3,trains3)
# Trains should be the last 7352 rows of the combo table
# Verify by comparing the heads and tails:
head(tests3[,560:563],n=3)
head(combo[,560:563], n=3)
tail(trains3[,560:563],n=3)
tail(combo[,560:563], n=3)

#STEP 5 - Create a table with only the variables we need (562,563,564, means, and stds)
#5a. first need to identify the features that are means or stds, put this list of variable names into a table called mysubset
mysubset <- rbind(subset(features, grepl("mean....$",V2)),subset(features, grepl("std....$",V2)))
mysubset <- rbind(mysubset, subset(features, grepl("mean..$",V2)),subset(features, grepl("std..$",V2)))    
mysubset[,1] <- paste("V",mysubset[,1],sep="")
#5b. next add rows to hold the names of the 2 new variables created above    
mysubset <- rbind(mysubset,as.vector(c("V562","SubjectID")))
mysubset <- rbind(mysubset,as.vector(c("V563","ActivityID")))

#5c use mysubset to select  the colums we need from the combo table
combo2 = combo[, mysubset[,1]]
#5d rename the columns to something we can read
names(combo2) <- mysubset[,2]

#5e merge the activity labels into the combined table.
#this will reorder the combined table, but that's okay because all the rbinds and cbinds are done.
#note that ActivityID is moved into column 1 in the combo3
names(activity_labels) <- c("ActivityID","Activity")
combo3 = merge(combo2,activity_labels)

#STEP 6 - Create Summary and export to a text file
summarytable <- aggregate(combo3[,2:67], by=list(SubjectID=combo3$SubjectID,Activity = combo3$Activity), FUN=mean, DATA = combo3[,2:67])
write.table(summarytable, file = "./summarytable.txt", row.name=FALSE)

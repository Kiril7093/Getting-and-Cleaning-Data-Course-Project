#1.Merges the training and the test sets to create one data set.

#Creating a working directory:
if(!file.exists("./data")){dir.create("./data")}

#Downloading files into working directory:
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip", exdir="./data")

#Reading files:

X_trainFile <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_trainFile <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Subject_trainFile <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")


X_testFile <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_testFile <- read.table ("./data/UCI HAR Dataset/test/y_test.txt")
Subject_testFile <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")



FeaturesFile <- read.table('./data/UCI HAR Dataset/features.txt')
ActivityFile = read.table('./data/UCI HAR Dataset/activity_labels.txt')


colnames(X_trainFile) <- FeaturesFile[,2] 
colnames(Y_trainFile) <-"activityId"
colnames(Subject_trainFile) <- "subjectId"

colnames(X_testFile) <- FeaturesFile[,2] 
colnames(Y_testFile) <- "activityId"
colnames(Subject_testFile) <- "subjectId"

colnames(ActivityFile) <- c("activityId","activityType")


# Merge data:
trainMerge <- cbind(Y_trainFile, Subject_trainFile, X_trainFile)
testMerge <- cbind(Y_testFile, Subject_testFile, X_testFile)
testtrainMerge<-rbind(trainMerge, testMerge)

#2.Extracts only the measurements on the mean and standard deviation for 
#each measurement.
colNames<- colnames(testtrainMerge)

mean_and_std <- (grepl("activityId", colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames)) 

MeanSDdataset <- testtrainMerge[ , mean_and_std == TRUE]


#3.Uses descriptive activity names to name the activities in the data set
ActivityNames <- merge(MeanSDdataset, ActivityFile,
                              by="activityId",
                              all.x=TRUE)      

#4.Appropriately labels the data set with descriptive variable names.
names(ActivityNames)<-gsub("^t", "time", names(ActivityNames))
names(ActivityNames)<-gsub("^f", "frequency", names(ActivityNames))
names(ActivityNames)<-gsub("Acc", "Accelerometer", names(ActivityNames))
names(ActivityNames)<-gsub("Gyro", "Gyroscope", names(ActivityNames))
names(ActivityNames)<-gsub("Mag", "Magnitude", names(ActivityNames))
names(ActivityNames)<-gsub("BodyBody", "Body", names(ActivityNames))

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidyData3 <- aggregate(. ~subjectId + activityId, ActivityNames, mean)
tidyData3 <- tidyData3[order(tidyData3$subjectId, tidyData3$activityId),]
write.table(tidyData3, "tidyData3.txt", row.name=FALSE)






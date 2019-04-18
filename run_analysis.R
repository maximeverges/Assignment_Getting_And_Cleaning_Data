
##################################
#PACKAGE                         #
##################################

#I loaded the require package
library(dplyr)

##################################
#DATASET                         #
##################################

#I download the datatest
zipname <- "Assignement_week4.zip"

#I verify if it exists
if (!file.exists(zipname)){
  zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zipURL,zipname,method="curl")
}

#I verify if the folder exists
if (!file.exists("UCI HAAR Dataset")){
  unzip(zipname)
}

##################################
#ASSIGNING DATA FRAMES           #
##################################

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##################################
#STEP 1 : MERGING                #
##################################

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

##################################
#STEP 2 : EXTRACTION             #
##################################

tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


##################################
#STEP 3 : NAMING                 #
##################################

tidy_data$code <- activities[tidy_data$code, 2]

##################################
#STEP 4 : LABELS                 #
##################################

names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data))
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data))
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))

##################################
#STEP 5 : TIDY LABEL 2           #
##################################

tidy_data_2 <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(tidy_data_2, "tidy_data_2.txt", row.name=FALSE)



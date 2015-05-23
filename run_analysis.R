# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 



#Step 1 - Merges the training and the test sets to create one data set
library(dplyr)
setwd("~/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset")
feature <- read.csv("features.txt", sep = "", header = FALSE, col.names= c("id", "feature"), skip = 0)
tmp1 <- grep(pattern="-std()",x=feature$feature, fixed = TRUE)
tmp2 <- grep(pattern="-mean()",x=feature$feature, fixed = TRUE)

feature <- data.frame(lapply(feature, as.character), stringsAsFactors=FALSE)
feature$feature <- gsub("\\()","\\", feature$feature)
feature$feature <- gsub("\\-","\\_", feature$feature)
feature$feature <- gsub("\\(","\\_", feature$feature)
feature$feature <- gsub("\\)","\\", feature$feature)
feature$feature <- gsub("\\,","\\_", feature$feature)


activity_labels <- read.csv("activity_labels.txt", header = FALSE, sep = "", col.names = c("label", "activity"), skip = 0)



X_train <- read.csv("./train/X_train.txt", sep = "", header = FALSE,col.names = c(feature$feature))
y_train <- read.csv("./train/y_train.txt", header = FALSE,col.names = "label")
subject_train <- read.csv("./train/subject_train.txt", header = FALSE, col.names = "subject")

body_acc_x_train <- read.csv("./train/Inertial Signals/body_acc_x_train.txt", header = FALSE, sep = "")
body_acc_y_train <- read.csv("./train/Inertial Signals/body_acc_y_train.txt", header = FALSE,sep = "")
body_acc_z_train <- read.csv("./train/Inertial Signals/body_acc_z_train.txt", header = FALSE,sep = "")
body_gyro_x_train <- read.csv("./train/Inertial Signals/body_gyro_x_train.txt", header = FALSE,sep = "")
body_gyro_y_train <- read.csv("./train/Inertial Signals/body_gyro_y_train.txt", header = FALSE,sep = "")
body_gyro_z_train <- read.csv("./train/Inertial Signals/body_gyro_z_train.txt", header = FALSE,sep = "")
total_acc_x_train <- read.csv("./train/Inertial Signals/total_acc_x_train.txt", header = FALSE,sep = "")
total_acc_y_train <- read.csv("./train/Inertial Signals/total_acc_y_train.txt", header = FALSE,sep = "")
total_acc_z_train <- read.csv("./train/Inertial Signals/total_acc_z_train.txt", header = FALSE,sep = "")

train <- do.call(cbind, list(subject_train, y_train))
train$set = "train"
train <- merge(train, activity_labels, by.x = "label", by.y = "label", all.x = TRUE)
train <- do.call(cbind, list(train, X_train))




X_test <- read.csv("./test/X_test.txt", sep = "", header = FALSE, col.names = c(feature$feature))
y_test <- read.csv("./test/y_test.txt", header = FALSE, col.names = "label")
subject_test <- read.csv("./test/subject_test.txt", header = FALSE, col.names = "subject")

body_acc_x_test <- read.csv("./test/Inertial Signals/body_acc_x_test.txt", header = FALSE, sep = "")
body_acc_y_test <- read.csv("./test/Inertial Signals/body_acc_y_test.txt", header = FALSE,sep = "")
body_acc_z_test <- read.csv("./test/Inertial Signals/body_acc_z_test.txt", header = FALSE,sep = "")
body_gyro_x_test <- read.csv("./test/Inertial Signals/body_gyro_x_test.txt", header = FALSE,sep = "")
body_gyro_y_test <- read.csv("./test/Inertial Signals/body_gyro_y_test.txt", header = FALSE,sep = "")
body_gyro_z_test <- read.csv("./test/Inertial Signals/body_gyro_z_test.txt", header = FALSE,sep = "")
total_acc_x_test <- read.csv("./test/Inertial Signals/total_acc_x_test.txt", header = FALSE,sep = "")
total_acc_y_test <- read.csv("./test/Inertial Signals/total_acc_y_test.txt", header = FALSE,sep = "")
total_acc_z_test <- read.csv("./test/Inertial Signals/total_acc_z_test.txt", header = FALSE,sep = "")

test <- do.call(cbind, list(subject_test, y_test))
test$set = "test"
test <- merge(test, activity_labels, by.x = "label", by.y = "label", all.x = TRUE)
test <- do.call(cbind, list(test, X_test))

dataall <- rbind(train, test)


# Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
data_selected_measure <- dataall[,c(1:4, tmp1 + 4, tmp2 + 4)]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


data_selected_measure <- subset(data_selected_measure, select = -c(1,3) )
subject_activity <- group_by(data_selected_measure, subject, activity)
tidydata <- summarise_each(subject_activity, funs(mean))

write.table(tidydata, file = "./tidydata.txt",  row.name = FALSE)



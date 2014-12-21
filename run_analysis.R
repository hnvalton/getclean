#y_data sisältää aktivitettien numeron datan järjestyksessä
#subject_train sisältää koehenkilön numeron
#X-data sisältää datan, jossa laskettu features mukaiset tunnarit

#********************READ IN DATA *** START ************************************

#read in test data
test_activities     <- read.table("test/y_test.txt")
test_variables       <- read.table("test/x_test.txt")
test_subjects       <- read.table("test/subject_test.txt")

#read in train data
train_activities    <- read.table("train/y_train.txt")
train_variables      <- read.table("train/x_train.txt")
train_subjects      <- read.table("train/subject_train.txt")

#read features (variable names)
features <- read.table("features.txt")

#read_activity lablels
activity_labels <- read.table("activity_labels.txt")

#********************READ IN DATA *** END **************************************

#********************PROCESS VARIABLE DATA *** START ***************************
#give variables data column names from the feature names
#process feature list to create clean and unique variable names
features <- make.names(features[,2], unique = TRUE)
features <- gsub("\\.{2}", ".", features)   #remove multiple sequential dots
features <- gsub("\\.{2}", ".", features)   #remove multiple sequential dots
features <- gsub("BodyBody", "Body", features)    #BodyBody --> Body
features <- tolower(features)                     #all lower case chars
features <- make.names(features, unique = TRUE)  #uniques names

#set column names for variables data
colnames(train_variables) <- features
colnames(test_variables) <- features

#get a list of "mean() and std()" column names
mean_features <- as.matrix(grep("\\.mean\\.", features))
std_features <- as.matrix(grep("\\.std\\.", features))
mean_and_std <- sort(rbind(mean_features, std_features)) #list of columns to keep
#subset mean and std columns from variables data
train_variables <- train_variables[,mean_and_std]
test_variables <- test_variables[,mean_and_std]

#********************PROCESS VARIABLE DATA *** END *****************************

#********************PROCESS ACTIVITY DATA *** START ***************************
#transform activity data with activity labels and give column a name
colnames(test_activities) <- "activity"
colnames(train_activities) <- "activity"
test_activities <- transform(test_activities, activity = activity_labels[activity,2])
train_activities <- transform(train_activities, activity = activity_labels[activity,2])

#********************PROCESS ACTIVITY DATA *** END *****************************

#********************PROCESS SUBJECT DATA *** START ****************************
#give subject data column names and transform to factor
colnames(test_subjects) <- "subject"
colnames(train_subjects) <- "subject"
test_subjects <- transform(test_subjects, subject = as.factor(subject))
train_subjects <- transform(train_subjects, subject = as.factor(subject))

#********************PROCESS SUBJECT DATA *** END ******************************

#********************COMBINE COLUMNS AND DATA SETS *** START *******************

#Bind activities, subjects and variables into one data frame 
#here we assume that data is in same order for all data
test_data <- cbind(test_activities, test_subjects, test_variables)
train_data <- cbind(train_activities, train_subjects, train_variables)
all_data <- rbind(test_data, train_data)

#********************COMBINE COLUMNS AND DATA SETS *** END *******************


#********************CALCULATE MEANS BY SUBJECT AND ACTIVITY *** START *********

library(plyr)
#create new variable names "mean.of.<old variable name>
col_names <- colnames(all_data)
col_names <- paste("mean.of.", col_names, sep = "")
#set activity and subejct back
col_names[1] <- "activity" 
col_names[2] <- "subject"
#calculate the means of all variables (numcols)
all_data_means <- ddply(all_data, .(activity, subject), numcolwise(mean))
#set new column names
colnames(all_data_means) <- col_names

#********************CALCULATE MEANS BY SUBJECT AND ACTIVITY *** END ***********

#********************WRITE MEANS DATA SET TO FILE *** START ********************
#write tidy data 1 to a file (all mean and std variables)
write.table(all_data, file = "all_data.txt", row.names = FALSE)
#write tidy data 2 to a file (means of variables by subject and activity)
write.table(all_data_means, file = "means_data.txt", row.names = FALSE)

#********************WRITE MEANS DATA SET TO FILE *** END **********************

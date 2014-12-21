---
title: "CodeBook"
output: html_document
---

##Introduction
This codebook explains the what action were done to data and contents of variables
in the two tidy data sets that run_analysis.R will create from the raw data set.
First set is written into R variable "all_data" and to file "all_data.txt"
Secon set is written into R variable "all_data_means" and to file "means_data.txt"

##Raw data
The raw data is Human Activity Recognition Using Smartphones Data set from file
(getdata-projectfiles-UCI HAR Dataset.zip)
The raw data set contains two semantically similar data sets. They are called
train and test.  
Key components (files) in raw data are:

* features.txt: contains the raw data variable names
* activity_labels.txt: constains names of the activities
* subject_test.txt and subject_train.txt: subject numbers in test and train data sets
* y_test.txt and y_train.txt: activity numbers in train and test data sets
* x_test.txt and train.txt: variable data for train and test data sets

to be noted here that subject-, y-, and x-data are ordered. I.e. 1st row in 
each subject- matches 1st row in y- and 1st row in x- etc.   

##Tidy data set 1
### Data cleaning and processing operations
* Variable names for the variable data set are taken from features.txt. The variable names are converted
to unique names in lower case. Variable names contain only characters, numbers and dots. 
* Only mean and standard deviation variables are extracted from the original
variable data (x_test.txt and x_train.txt). From unique variables names (point above) this is 
done by including only variable names that contain string .mean. or .std.
* Raw activity data which consists only values between 1 and 6 is replaced by activity labels from 
activity_labels.txt
* activity, subject and variable data are combined together (separately for test and train data sets). After this we have train and test data sets where activity in 1st column, subject in second column and variables in columns 3-68.
* Train and test data sets are combined

###Variable descriptions

####Subject (factor)
Subject is a unique number given for each subject (person) in the data set.
Subject ranges from 1 to 30.

####Activity (factor)
In the test data subjects performed six activities described by this factor. Values are:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

####Variables
Variable names are intepreted with following keys:
prefix 't' to denote time domain signals
prefix 'f' to denote frequency domain signals
acc = accelerometer signal
gyro = gyroscope signal
body = body acceleration
gravity = gravity acceleration
Jerk = is the time rate of change of acceleration.
mag = magnitude of 3-d signals
mean = mean measure
stdf = standard deviation measure.

Variables in this data set are:

* tbodyacc.mean.x
* tbodyacc.mean.y
* tbodyacc.mean.z
* tbodyacc.std.x
* tbodyacc.std.y
* tbodyacc.std.z
* tgravityacc.mean.x
* tgravityacc.mean.y
* tgravityacc.mean.z
* tgravityacc.std.x
* tgravityacc.std.y
* tgravityacc.std.z
* tbodyaccjerk.mean.x
* tbodyaccjerk.mean.y
* tbodyaccjerk.mean.z
* tbodyaccjerk.std.x
* tbodyaccjerk.std.y
* tbodyaccjerk.std.z
* tbodygyro.mean.x
* tbodygyro.mean.y
* tbodygyro.mean.z
* tbodygyro.std.x
* tbodygyro.std.y
* tbodygyro.std.z
* tbodygyrojerk.mean.x
* tbodygyrojerk.mean.y
* tbodygyrojerk.mean.z
* tbodygyrojerk.std.x
* tbodygyrojerk.std.y
* tbodygyrojerk.std.z
* tbodyaccmag.mean.
* tbodyaccmag.std.
* tgravityaccmag.mean.
* tgravityaccmag.std.
* tbodyaccjerkmag.mean.
* tbodyaccjerkmag.std.
* tbodygyromag.mean.
* tbodygyromag.std.
* tbodygyrojerkmag.mean.
* tbodygyrojerkmag.std.
* fbodyacc.mean.x
* fbodyacc.mean.y
* fbodyacc.mean.z
* fbodyacc.std.x
* fbodyacc.std.y
* fbodyacc.std.z
* fbodyaccjerk.mean.x
* fbodyaccjerk.mean.y
* fbodyaccjerk.mean.z
* fbodyaccjerk.std.x
* fbodyaccjerk.std.y
* fbodyaccjerk.std.z
* fbodygyro.mean.x
* fbodygyro.mean.y
* fbodygyro.mean.z
* fbodygyro.std.x
* fbodygyro.std.y
* fbodygyro.std.z
* fbodyaccmag.mean.
* fbodyaccmag.std.
* fbodyaccjerkmag.mean.
* fbodyaccjerkmag.std.
* fbodygyromag.mean.
* fbodygyromag.std.
* fbodygyrojerkmag.mean.
* fbodygyrojerkmag.std.


##Tidy data set 2
### Data cleaning and processing operations
Tidy data set 1 is taken as a starting point here.
A new data set is create by calculating a mean of tidy data set 1 by factors
(activity and subject). Hence, this data set has only one row for each activity-
subject combination.

###Variable descriptions

####Subject (factor)
Same as tidy data set 1

####Activity (factor)
Same as tidy data set 1

####Variables
Same as tidy data set 1 except variable names have a "mean.of." prefix to identify
that these are means of the data.
Variable names are:

* mean.of.tbodyacc.mean.x
* mean.of.tbodyacc.mean.y
* mean.of.tbodyacc.mean.z
* mean.of.tbodyacc.std.x
* mean.of.tbodyacc.std.y
* mean.of.tbodyacc.std.z
* mean.of.tgravityacc.mean.x
* mean.of.tgravityacc.mean.y
* mean.of.tgravityacc.mean.z
* mean.of.tgravityacc.std.x
* mean.of.tgravityacc.std.y
* mean.of.tgravityacc.std.z
* mean.of.tbodyaccjerk.mean.x
* mean.of.tbodyaccjerk.mean.y
* mean.of.tbodyaccjerk.mean.z
* mean.of.tbodyaccjerk.std.x
* mean.of.tbodyaccjerk.std.y
* mean.of.tbodyaccjerk.std.z
* mean.of.tbodygyro.mean.x
* mean.of.tbodygyro.mean.y
* mean.of.tbodygyro.mean.z
* mean.of.tbodygyro.std.x
* mean.of.tbodygyro.std.y
* mean.of.tbodygyro.std.z
* mean.of.tbodygyrojerk.mean.x
* mean.of.tbodygyrojerk.mean.y
* mean.of.tbodygyrojerk.mean.z
* mean.of.tbodygyrojerk.std.x
* mean.of.tbodygyrojerk.std.y
* mean.of.tbodygyrojerk.std.z
* mean.of.tbodyaccmag.mean.
* mean.of.tbodyaccmag.std.
* mean.of.tgravityaccmag.mean.
* mean.of.tgravityaccmag.std.
* mean.of.tbodyaccjerkmag.mean.
* mean.of.tbodyaccjerkmag.std.
* mean.of.tbodygyromag.mean.
* mean.of.tbodygyromag.std.
* mean.of.tbodygyrojerkmag.mean.
* mean.of.tbodygyrojerkmag.std.
* mean.of.fbodyacc.mean.x
* mean.of.fbodyacc.mean.y
* mean.of.fbodyacc.mean.z
* mean.of.fbodyacc.std.x
* mean.of.fbodyacc.std.y
* mean.of.fbodyacc.std.z
* mean.of.fbodyaccjerk.mean.x
* mean.of.fbodyaccjerk.mean.y
* mean.of.fbodyaccjerk.mean.z
* mean.of.fbodyaccjerk.std.x
* mean.of.fbodyaccjerk.std.y
* mean.of.fbodyaccjerk.std.z
* mean.of.fbodygyro.mean.x
* mean.of.fbodygyro.mean.y
* mean.of.fbodygyro.mean.z
* mean.of.fbodygyro.std.x
* mean.of.fbodygyro.std.y
* mean.of.fbodygyro.std.z
* mean.of.fbodyaccmag.mean.
* mean.of.fbodyaccmag.std.
* mean.of.fbodyaccjerkmag.mean.
* mean.of.fbodyaccjerkmag.std.
* mean.of.fbodygyromag.mean.
* mean.of.fbodygyromag.std.
* mean.of.fbodygyrojerkmag.mean.
* mean.of.fbodygyrojerkmag.std.

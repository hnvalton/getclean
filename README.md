---
title: "Readme"
output: html_document
---

##Introduction
This readme explains procedures to process Human Activity Recognition Using Smartphones Data set
into a two tidy datasets. 
The first dataset contains mean and std variables of measurement data from the original dataset.
In the r script this set is written into R variable "all_data" and to file "all_data.txt"

The second dataset calculates means of variables in the first data set by subject and activity.
In the r script this set is written into R variable "all_data_means" and to file "means_data.txt"

This readme should be read together with codebook.rm. Codebook explains in more detail the processing activities while 
this readme provides information how to process the scripts.

##Pre-requisites
You need the following items in place before processing can start

* R for processing
* plyr package installed in R
* Raw data (getdata-projectfiles-UCI HAR Dataset.zip)
* run_analysis.R script
* Extract the raw data package into a folder of your choosing
* Set your R working dir so that you can see "test" and "train" directories of the raw data
directly from you working directory

##processing steps
Raw data is processed using R code in run_analysis.R R script.
The Script is divided into 7 sections separated from each other by START and END tags per section.
You can run the whole script at once or by section. If you run the code sections independently 
they need to be run in certain order. Pupose of each section and required running order is described below. 

* READ IN DATA: R code in this section reads into R the raw data required for processing and creating the tidy datasets
* PROCESS VARIABLE DATA: R code in this section processes the actual measure (variable) data to include column names and extracts only mean and standard deviation columns in the remaining dataset.- (Requires READ IN DATA to be run)
* PROCESS ACTIVITY DATA: R code in this section transforms the activity data with meaningful activity names and gives a proper column name. - (Requires READ IN DATA to be run)
* PROCESS SUBJECT DATA: R code in this section converts subject data to factors and give a proper column name. - (Requires READ IN DATA to be run)
* COMBINE COLUMNS AND DATA SETS: R code in this section combines factor and variable data together and combines test and training data into one dataset (first tidy data set) - (Requires all processing section to be run)
* CALCULATE MEANS BY SUBJECT AND ACTIVITY: R code in this section creates the second tidy data set. It calculates mean from all variables in the first tidy data set by subject and activity. - (Requires COMBINE COLUMNS AND DATA SETS to be run)
* WRITE MEANS DATA SET TO FILE: R code in this section write the tidy data sets into .txt files. (Requires all previous sections to be run)



Getdata_Courseproject
=====================



#This section describes the working of the script: run_analises.R


The datasets have to be downloaded in the subdirectory: ./UCI HAR Dataset/

Data can be found in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the data can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description of the resulting tidy data set can be found in the codebook.md

The R-code requires the package dplyr and tidyr. Install the packages dplyr and tidyr before running this script

The script first loads the packages

##Step 0  reads in the data with read.table() function Data are read into 8 tables.

The downloaded file features.txt contains the names of the measurements.

The downloaded file actvitylabels.txt contains the activitys.

The downloaded file subject_train and subject_test contain the subjectcodes for the trainingdata and the testdata.

The downloaded files x_train and x_test contain the values of the measurements for the trainingdata and the testdata.

The downloaded files y_train and y_test contain the activitycodes for the trainingdata and the testdata.


##Step 1  merges the training and the test sets to create one data set
step 1a merges subjectcode, activitycode and measurementdata in trainingdata set and testdata set

step 1b 
merges the trainingdata set and testdata set and reads it into one tbl_df calles: alldata_tbl_df

##Step 2  extracts only the measurements on the mean and standard deviation for each measurement

step 2a filters out the right variable names in de features table and remove the meanfreq variablenames 
        using the select() and the grpl() functions. 
        
Meanfreq is a measurement on the mean frequency and not of the mean and sd values of the movements, and is removed from the dataset.

step 2b extracts the right columns in features_mean_std based om the filtered column names.

to features_mean-std 2 is added because the first 2 columns are the subject and activity columns 

##Step 3  Uses descriptive activity names to name the activities in the data set 
step 3a Actvitiecodes are in the second column of the selecteddata. The activitycodes are assigned to the first column of activitydata

step 3b The activitynames in activitylabels are changed from upper- to lowercase with tolower() and the _ are removed with gsub() function.

step 3b The activitynames are matched with the activitycodes. The result is assigned to the second column of selecteddata

##Step 4  Appropriately labels the data set with descriptive variable names
step 4a Columnnames are extracted from the features table and are changed to characterstrings using as.matrix.

step 4b makes descriptive names with gsub() function, names are described in codebook.

step 4c the names for the columns subject and activity are added to columnnames then columnames is assigned to the column names of selecteddata                  

##Step 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject

A long skinny dataset was chosen to make the dataset more readable because of the long descriptive names created in step 4

step 5a creates a tidy dataset samsungmeandata

step 5b grouping the data by subject and activity

step 5c taking the mean for each group measurement by summarize_each() function

step 5d making a long skinny dataset by means of the gather() function

step 5e aranging the data by subject and activity 

##Step 6  writes the tidy dataset to a textfile for easy upload

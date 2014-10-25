## this R-code requires the package dplyr and tidyr
## the datasets have to be downloaded in the subdirectory: ./UCI HAR Dataset/
## data can be found in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## description of the data can be found in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## description og the resulting tidy data set can be found in the codebook


##install the packages dplyr and tidyr before rumming this script
##loading the packages

library(dplyr)
library(tidyr)

## Step 0  reads in the data with read.table() function
##         data are read into 8 tables

##         features.txt contains the names of the measurements
##         actvitylabels.txt contains the activitys
##         subject_train and subject_test contain the subjectcodes for the trainingdata and the testdata
##         x_train and x_test contain the values of the measurements for the trainingdata and the testdata
##         y_train and y_test conatain the activitycodes for the trainingdata and the testdata

features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")

subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")

 
## Step 1  merges the training and the test sets to create one data se
## step 1a merging of subjectcode, activitycode and measurementdata 
##         in trainingdata set and testdata set

trainingdata <- cbind(subjecttrain, ytrain, xtrain)
testdata <- cbind(subjecttest, ytest, xtest)


## step 1b merging of trainingdata set and testdata set 
##         and reading into one tbl_df calles: alldata_tbl_df

alldata_df <-rbind(trainingdata,testdata)
alldata_tbl_df <- tbl_df(alldata_df)


## Step 2  extracts only the measurements on the mean and standard deviation for each measurement

## Step 2a filters out the right variable names in de features table and remove the meanfreq variablesnames 
##         using the select() and the grpl() functions. Meanfreq is a measurement on the mean frequency and not
##         of the mean and sd values of the movements, and is removend from the dataset
        
features_mean_std <-filter(features,grepl("mean()|std()",V2))
features_mean_std <-filter(features_mean_std,!grepl("meanFreq()",V2))

## Step 2b extracts the right columns in features_mean_std based om the filtered column names 
##         2 is added to features_mean-std because the first 2 columns are the subject and activity columns 

selecteddata_tbl_df<- alldata_tbl_df[,c(1,2,(features_mean_std[,1]+2))]

## step 3  Uses descriptive activity names to name the activities in the data set 
## step 3a actvitiecodes are in the second column of the selecteddata
##         the activitycodes are assigned to the first column of activitydata

activitydata <- selecteddata_tbl_df[2]

## step 3b the activitynames are in activitylabels
##         names in actvitylabels are changed from upper- to lowercase with tolower() 
##         and the _ are removed with gsub() function

activitylabels$V2<-tolower(activitylabels$V2)
activitylabels$V2<-gsub("_","", activitylabels$V2)

## step 3b the activitynames are matched with the activitycodes 
##         the result is assigned to the second column of selecteddata

activitydata$V1<-activitylabels$V2[match(activitydata$V1,activitylabels$V1)]
selecteddata_tbl_df[2]<-activitydata

## step 4  appropriately labels the data set with descriptive variable names
## step 4a columnnames are extracted from the features table
## and are changed to characterstrings using as.matrix


columnnames<-features_mean_std[2]
columnnames<-as.matrix(columnnames)[,]

## step 4b makes descriptive names with gsub() function, names are described in codebook

columnnames<-gsub("tB","timesignalofb",columnnames)
columnnames<-gsub("tG","timesignalofg",columnnames)
columnnames<-gsub("fB","frequencysignalofb",columnnames)
columnnames<-gsub("fG","frequencysignalofg",columnnames)
columnnames<-gsub("Acc","linearacceleration",columnnames)
columnnames<-gsub("Gyro","angularvelocity",columnnames)
columnnames<-gsub("Mag","magnetude",columnnames)
columnnames<-gsub("Body","body",columnnames)
columnnames<-gsub("Jerk","jerk",columnnames)
columnnames<-gsub("-mean()","mean",columnnames)
columnnames<-gsub("-std()","standarddeviation",columnnames)
columnnames<-gsub("-X","inxdirection",columnnames)
columnnames<-gsub("-Y","inydirection",columnnames)
columnnames<-gsub("-Z","inzdirection",columnnames)
columnnames<-gsub("\\()","",columnnames)

## step 4c the names for the columns subject and activity are added to columnnames 
##         then columnames is assigned to the column names of selecteddata                  

columnnames<- (c("subject","activity",columnnames))
colnames(selecteddata_tbl_df)<- columnnames

## step 5  creates a second, independent tidy data set with the average of each variable 
##         for each activity and each subject
##         a long skinny dataset was chosen to make the dataset more readable
##         because of the long descriptive names created in step 4

## step 5a creates a tidy dataset calles samsungmeandata by
## step 5b grouping the data by subject and activity
## step 5c taking the mean for each group measurement by summarize_each() function
## step 5d making a long skinny dataset by means of the gather() function
## step 5e arranging the data by subject and activity 



samsungmeandata<-
selecteddata_tbl_df %>%
  group_by(subject,activity) %>%
  summarise_each(funs(mean)) %>%
  gather(measurement, meanvalue, -subject,-activity) %>%
  arrange(subject,activity)

## Step 6  the tidy dataset is written to a textfile for easy upload

write.table(samsungmeandata,"samsungmeandata.txt",row.name=FALSE)

#Codebook Samsungmeandata

This is the codebook for the file samsungmeandata. The file contains a tidy subset of measurements collected from the accelerometers from the Samsung Galaxy S smartphone

The orininal data are contained in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of the project and the original data can be found in:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


This codebook.md describes the variables, the data, and any transformations or work that is performed to clean up the data.

##Original data 

The orinal data contain measurements from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record was provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
The complete list of variables of each feature vector is available in 'features.txt' on the website described above.

##Work on the original data
The following modifications have been made to the raw data file to create the samsungmeandata file, the exact steps are described in the readme.md:
-	the training and the test sets ware mergede to create one data set
-	only the measurements on the mean and standard deviation for each measurement were extracted. The meanfrequency measurements were not extracted. Of a total of 561 features, 66 mean and standard deviation features were selected  
-	the activities in the data set were factorised to descriptive activity names 
-	appropriately labels with descriptive variable names were used to relabel the data set
-	an independent tidy data set was created with the average of each variable for each activity and each subject. For this tidy data set a “long form” was chosen to make the samsungmeandata set better readable.

## Descriptive variable names

In the original dataset variablenames were abriviated. These abreviated names were written out to get descriptive variable names by substituting:
-	t = timesignalof
-	f = frequencysignalof
-	Body = body
-	BodyBody = body (BodyBody is obviously a typo)
-	Gravity = gravity
-	Acc = linearacceleration
-	Gyro = angularvelocity
-	Mag = magnetude
-	Jerk = jerk
-	mean = mean
-	std = standarddeviation
-	X = inxdirection
-	Y = inydirection
-	Z = inzdirection
-	()  was omitted
-	_   was omitted

In the last step to create a "long form" tidy dataset the 66 descriptive variablenames were transformed into 66 levels of the factor variable "measurements"

##Variables

The file Samsungmeandata contains 4 variables: 

**Subject** 
	Subjectcode (factor with 30 levels of subjects)
	
	1	subject 1 
	2	subject 2
	3	subject 3
	4	subject 4
	5 	subject 5
	6	subject 6 
	7	subject 7
	8	subject 8
	9	subject 9
	10 	subject 10
	11	subject 11 
	12	subject 12
	13	subject 13
	14	subject 14
	15 	subject 15
	16	subject 16
	17	subject 17
	18	subject 18
	19	subject 19
	20 	subject 20
	21	subject 21 
	22	subject 22
	23	subject 23
	24	subject 24
	25 	subject 25
	26	subject 26
	27	subject 27
	28	subject 28
	29	subject 29
	30 	subject 30
	
**Activity**
	Description of activity (factor with 6 levels of activities)
	
	laying
	sitting
	standing
	walking
	walkingdownstairs
	walkingupstairs
	
	

**Measurement** 
       Description of measurement (factor with 66 levels of measurements)
       
       timesignalofbodylinearaccelerationmeaninxdirection
       timesignalofbodylinearaccelerationmeaninydirection
       timesignalofbodylinearaccelerationmeaninzdirection
       timesignalofbodylinearaccelerationstandarddeviationinxdirection
       timesignalofbodylinearaccelerationstandarddeviationinydirection
       timesignalofbodylinearaccelerationstandarddeviationinzdirection
       timesignalofgravitylinearaccelerationmeaninxdirection
       timesignalofgravitylinearaccelerationmeaninydirection
       timesignalofgravitylinearaccelerationmeaninzdirection
       timesignalofgravitylinearaccelerationstandarddeviationinxdirection
       timesignalofgravitylinearaccelerationstandarddeviationinydirection
       timesignalofgravitylinearaccelerationstandarddeviationinzdirection
       timesignalofbodylinearaccelerationjerkmeaninxdirection
       timesignalofbodylinearaccelerationjerkmeaninydirection
       timesignalofbodylinearaccelerationjerkmeaninzdirection
       timesignalofbodylinearaccelerationjerkstandarddeviationinxdirection
       timesignalofbodylinearaccelerationjerkstandarddeviationinydirection
       timesignalofbodylinearaccelerationjerkstandarddeviationinzdirection
       timesignalofbodyangularvelocitymeaninxdirection
       timesignalofbodyangularvelocitymeaninydirection
       timesignalofbodyangularvelocitymeaninzdirection
       timesignalofbodyangularvelocitystandarddeviationinxdirection
       timesignalofbodyangularvelocitystandarddeviationinydirection
       timesignalofbodyangularvelocitystandarddeviationinzdirection
       timesignalofbodyangularvelocityjerkmeaninxdirection
       timesignalofbodyangularvelocityjerkmeaninydirection
       timesignalofbodyangularvelocityjerkmeaninzdirection
       timesignalofbodyangularvelocityjerkstandarddeviationinxdirection
       timesignalofbodyangularvelocityjerkstandarddeviationinydirection
       timesignalofbodyangularvelocityjerkstandarddeviationinzdirection
       timesignalofbodylinearaccelerationmagnetudemean
       timesignalofbodylinearaccelerationmagnetudestandarddeviation
       timesignalofgravitylinearaccelerationmagnetudemean
       timesignalofgravitylinearaccelerationmagnetudestandarddeviation
       timesignalofbodylinearaccelerationjerkmagnetudemean
       timesignalofbodylinearaccelerationjerkmagnetudestandarddeviation
       timesignalofbodyangularvelocitymagnetudemean
       timesignalofbodyangularvelocitymagnetudestandarddeviation
       timesignalofbodyangularvelocityjerkmagnetudemean
       timesignalofbodyangularvelocityjerkmagnetudestandarddeviation
       frequencysignalofbodylinearaccelerationmeaninxdirection
       frequencysignalofbodylinearaccelerationmeaninydirection
       frequencysignalofbodylinearaccelerationmeaninzdirection
       frequencysignalofbodylinearaccelerationstandarddeviationinxdirection
       frequencysignalofbodylinearaccelerationstandarddeviationinydirection
       frequencysignalofbodylinearaccelerationstandarddeviationinzdirection
       frequencysignalofbodylinearaccelerationjerkmeaninxdirection
       frequencysignalofbodylinearaccelerationjerkmeaninydirection
       frequencysignalofbodylinearaccelerationjerkmeaninzdirection
       frequencysignalofbodylinearaccelerationjerkstandarddeviationinxdirection
       frequencysignalofbodylinearaccelerationjerkstandarddeviationinydirection
       frequencysignalofbodylinearaccelerationjerkstandarddeviationinzdirection
       frequencysignalofbodyangularvelocitymeaninxdirection
       frequencysignalofbodyangularvelocitymeaninydirection
       frequencysignalofbodyangularvelocitymeaninzdirection
       frequencysignalofbodyangularvelocitystandarddeviationinxdirection
       frequencysignalofbodyangularvelocitystandarddeviationinydirection
       frequencysignalofbodyangularvelocitystandarddeviationinzdirection
       frequencysignalofbodylinearaccelerationmagnetudemean
       frequencysignalofbodylinearaccelerationmagnetudestandarddeviation
       frequencysignalofbodylinearaccelerationjerkmagnetudemean
       frequencysignalofbodylinearaccelerationjerkmagnetudestandarddeviation
       frequencysignalofbodyangularvelocitymagnetudemean
       frequencysignalofbodyangularvelocitymagnetudestandarddeviation
       frequencysignalofbodyangularvelocityjerkmagnetudemean
       frequencysignalofbodybangularvelocityjerkmagnetudestandarddeviation

**Meanvalue**
	Average value of measurement, values are normalized and bounded within [-1,1]	

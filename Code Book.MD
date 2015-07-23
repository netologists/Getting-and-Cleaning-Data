#Code Book

#Description

This code book is to include descriptions of the data, the variables, and any transformations of work that was performed to clean up the data used for the course project.

#Data

The dataset used for this project was the UCI Human Activity Recognition Using Smartphones Dataset.  The link can be found on the assignment page.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial (X, Y, Z) acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  Measured in standing units 'g.'
- Triaxial (X, Y, Z) Angular velocity from the gyroscope.   The units are radians/second.
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Variables

For this project, the variables of interest were only the mean and standard deviation measures, as well as the subject and activity variables.  The merged dataset consists of 10299 observations of 68 variables.

Here is a list of the variables in the merged dataset.

"Subject"                        
"Activity" - 6 levels:  WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING                      
"timeBodyAccMean -X"          
"timeBodyAccMean -Y"            
"timeBodyAccMean -Z"             
"timeBodyAccStdDev -X"          
"timeBodyAccStdDev -Y"           
"timeBodyAccStdDev -Z"          
"timeGravityAccMean -X"          
"timeGravityAccMean -Y"         
"timeGravityAccMean -Z"          
"timeGravityAccStdDev -X"       
"timeGravityAccStdDev -Y"        
"timeGravityAccStdDev -Z"       
"timeBodyAccJerkMean -X"         
"timeBodyAccJerkMean -Y"        
"timeBodyAccJerkMean -Z"         
"timeBodyAccJerkStdDev -X"      
"timeBodyAccJerkStdDev -Y"       
"timeBodyAccJerkStdDev -Z"      
"timeBodyGyroMean -X"            
"timeBodyGyroMean -Y"           
"timeBodyGyroMean -Z"            
"timeBodyGyroStdDev -X"         
"timeBodyGyroStdDev -Y"          
"timeBodyGyroStdDev -Z"         
"timeBodyGyroJerkMean -X"        
"timeBodyGyroJerkMean -Y"       
"timeBodyGyroJerkMean -Z"        
"timeBodyGyroJerkStdDev -X"     
"timeBodyGyroJerkStdDev -Y"      
"timeBodyGyroJerkStdDev -Z"     
"timeBodyAccMagMean "            
"timeBodyAccMagStdDev "         
"timeGravityAccMagMean "         
"timeGravityAccMagStdDev "      
"timeBodyAccJerkMagMean "        
"timeBodyAccJerkMagStdDev "     
"timeBodyGyroMagMean "           
"timeBodyGyroMagStdDev "        
"timeBodyGyroJerkMagMean "       
"timeBodyGyroJerkMagStdDev "    
"freqBodyAccMean -X"             
"freqBodyAccMean -Y"            
"freqBodyAccMean -Z"             
"freqBodyAccStdDev -X"          
"freqBodyAccStdDev -Y"           
"freqBodyAccStdDev -Z"          
"freqBodyAccJerkMean -X"         
"freqBodyAccJerkMean -Y"        
"freqBodyAccJerkMean -Z"         
"freqBodyAccJerkStdDev -X"      
"freqBodyAccJerkStdDev -Y"       
"freqBodyAccJerkStdDev -Z"      
"freqBodyGyroMean -X"            
"freqBodyGyroMean -Y"           
"freqBodyGyroMean -Z"           
"freqBodyGyroStdDev -X"         
"freqBodyGyroStdDev -Y"          
"freqBodyGyroStdDev -Z"         
"freqBodyAccMagMean "            
"freqBodyAccMagStdDev "         
"freqBodyBodyAccJerkMagMean "    
"freqBodyBodyAccJerkMagStdDev " 
"freqBodyBodyGyroMagMean "       
"freqBodyBodyGyroMagStdDev "    
"freqBodyBodyGyroJerkMagMean "   
"freqBodyBodyGyroJerkMagStdDev "

# Data Manipulation

Merging the training and testing files using the subject as the matching variable.

Selecting only the mean and standard deviation variables for inclusion.

Changing the column titles to make them more readable.

Changing the activity level codes to the descriptive text identifiers.

Creating a summary file of the averages of each measurement for each activity and each subject.

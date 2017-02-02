CodeBook for Getting and Cleaning Data Project

Data acquisition: 
Human activity was recorded using smartphones dataset. Specifically, the data was collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz has been recorded. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. For each record it is provided: (1) Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. (2) Triaxial Angular velocity from the gyroscope. (3) A 561-feature vector with time and frequency domain variables. (4) Its activity label. (5)An identifier of the subject who carried out the experiment. For detailed information on particular dataset see README.txt, and features.txt files. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Descriptions of the variables:
Accelerometer and gyroscope was used to generate 3-axial raw signals: tAcc-XYZ and tGyro-XYZ. The time domain signals (‘t’ ) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. The total of 33 measurements including the 3 dimensions - the X,Y, and Z axes was used to denote 3-axial signals in the X, Y and Z directions. For detailed information on variables see README.txt, and features.txt files.

Data transformation:
The data sets were analyzed with run_analysis.R script to generate tidy data set “tidyData3.txt”
There are 8 steps in data analysis process:
1.	Creating a working directory. 
2.	Download data files into working directory. 
3.	Reading data files.
4.	Merging data files into a single data set. 
5.	Extracting and calculating mean and standard deviation for each measurement. 
6.	Uses descriptive activity names to name the activities in the data set. 
7.	Labels the data set with descriptive variable names. 
8.	Generating a second, independent tidy data set ("tidyData3.txt") with the average of each variable for each activity and each subject.
List of abbreviations of the measurements:
1.	Body = body movement.
2.	Gravity = acceleration of gravity
3.	Acc = accelerometer measurement
4.	Gyro = gyroscopic measurements
5.	Jerk = sudden movement acceleration
6.	Mag = magnitude of movement
7.	Mean and SD are calculated for each subject for each activity for each mean and SD measurements. mean(): Mean value; std(): Standard deviation
8.	“t” or “f” is based on time or frequency measurements.


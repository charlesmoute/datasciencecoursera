
The script was run on version R 3.4.0 (2017-04-21) for Sierra macOS. RStudio is the IDE used. The file "rawData.csv" represent in the one data set the raw data of the Human Activity Recognition Using Smartphones. The file "tidyData.csv" represent the average of of each variable for each activity and each subject.

The variables
====================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables in tidy data undermentioned

1. subject : volunteer indentifiant (subject)
2. activity : the activities in the data set (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3. strata : data source, test data or training data
4. tBodyAcc.mean.X
5. tBodyAcc.mean.Y
6. tBodyAcc.mean.Z
7. tGravityAcc.mean.X
8. tGravityAcc.mean.Y
9. tGravityAcc.mean.Z
10. tBodyAccJerk.mean.X
11. tBodyAccJerk.mean.Y
12. tBodyAccJerk.mean.Z
13. tBodyGyro.mean.X
14. tBodyGyro.mean.Y
15. tBodyGyro.mean.Z
16. tBodyGyroJerk.mean.X
17. tBodyGyroJerk.mean.Y
18. tBodyGyroJerk.mean.Z
19. tBodyAccMag.mean
20. tGravityAccMag.mean
21. tBodyAccJerkMag.mean
22. tBodyGyroMag.mean
23. tBodyGyroJerkMag.mean
24. fBodyAcc.mean.X
25. fBodyAcc.mean.Y
26. fBodyAcc.mean.Z
27. fBodyAccJerk.mean.X
28. fBodyAccJerk.mean.Y
29. fBodyAccJerk.mean.Z
30. fBodyGyro.mean.X
31. fBodyGyro.mean.Y
32. fBodyGyro.mean.Z
33. fBodyAccMag.mean
34. fBodyBodyAccJerkMag.mean
35. fBodyBodyGyroMag.mean
36. fBodyBodyGyroJerkMag.mean
37. tBodyAcc.std.X
38. tBodyAcc.std.Y
39. tBodyAcc.std.Z
40. tGravityAcc.std.X
41. tGravityAcc.std.Y
42. tGravityAcc.std.Z
43. tBodyAccJerk.std.X
44. tBodyAccJerk.std.Y
45. tBodyAccJerk.std.Z
46. tBodyGyro.std.X
47. tBodyGyro.std.Y
48. tBodyGyro.std.Z
49. tBodyGyroJerk.std.X
50. tBodyGyroJerk.std.Y
51. tBodyGyroJerk.std.Z
52. tBodyAccMag.std
53. tGravityAccMag.std
54. tBodyAccJerkMag.std
55. tBodyGyroMag.std
56. tBodyGyroJerkMag.std
57. fBodyAcc.std.X
58. fBodyAcc.std.Y
59. fBodyAcc.std.Z
60. fBodyAccJerk.std.X
61. fBodyAccJerk.std.Y
62. fBodyAccJerk.std.Z
63. fBodyGyro.std.X
64. fBodyGyro.std.Y
65. fBodyGyro.std.Z
66. fBodyAccMag.std
67. fBodyBodyAccJerkMag.std
68. fBodyBodyGyroMag.std
69. fBodyBodyGyroJerkMag.std

The instruction list/script
===============================

1. Configuration of the workspace : loading packages, loading and cleaning activity labels and 561-feature vector.

2. Merges the training and the test sets to create one data set call 'dbase' and save in the file 'rawData.csv'. Appropriately labels the data set with descriptive variable names is Simultaneously do at this step.

3. Extracts of the measurements on the mean and standard deviation for each 
measurement. Only measurements with the both data are retained. The variable 'dbase02' save the dataset of this step.

4. Uses descriptive activity names to name the activities in the data set 'dbase02'

5. From the data set in step 4,  a second independent tidy data set, nammed 'tidyData', is created with the average of each variable for each activity and each subject. The tidy data set save un the file "tidyData.csv"

See 'run_analysis.R' for more details.

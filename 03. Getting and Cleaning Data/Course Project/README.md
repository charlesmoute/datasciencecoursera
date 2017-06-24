Getting and Cleaning Data Course Project
========================================

The purpose of this project is to prepare tidy data that can be used for later analysis. For that, The Human Activity Recognition Using Smartphones Dataset has been used. This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


This project includes the following files:

1. The README.md :  explains how all of the scripts work and how they are connected
2. The raw data : the raw data of the Human Activity Recognition Using Smartphones.
3. A tidy data set : data set with the average of each variable for each activity and each subject (tidyData.csv).
4. A code book  that describes each variable and its values in the tidy data set, the data, and any transformations or work that you performed to clean up the data describing  (CodeBook.md).  
5. An explicit and exact recipe I used to go from 2 -> 3,4 (run_analysis.R)

The raw data includes the following files:
==========================================

- '[rawData] README' : Explains the Human Activity Recognition Using Smartphones Dataset

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


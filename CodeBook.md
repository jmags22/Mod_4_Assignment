# Code Book

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Variable Descriptions

- `subject`: The ID of the subject
- `activity`: The activity performed by the subject
- `TimeBodyAccelerometerMeanX`: The mean of the time-domain body accelerometer signal in the X direction
- `TimeBodyAccelerometerMeanY`: The mean of the time-domain body accelerometer signal in the Y direction
- `TimeBodyAccelerometerMeanZ`: The mean of the time-domain body accelerometer signal in the Z direction
- `TimeBodyAccelerometerSTDX`: The standard deviation of the time-domain body accelerometer signal in the X direction
- `TimeBodyAccelerometerSTDY`: The standard deviation of the time-domain body accelerometer signal in the Y direction
- `TimeBodyAccelerometerSTDZ`: The standard deviation of the time-domain body accelerometer signal in the Z direction
- `TimeGravityAccelerometerMeanX`: The mean of the time-domain gravity accelerometer signal in the X direction
- `TimeGravityAccelerometerMeanY`: The mean of the time-domain gravity accelerometer signal in the Y direction
- `TimeGravityAccelerometerMeanZ`: The mean of the time-domain gravity accelerometer signal in the Z direction
- ... and so on for each measurement.

## Transformations

1. Merged the training and test datasets.
2. Extracted the measurements on the mean and standard deviation for each measurement.
3. Replaced activity codes with descriptive activity names.
4. Labeled the dataset with descriptive variable names.
5. Created a second, independent tidy data set with the average of each variable for each activity and each subject.

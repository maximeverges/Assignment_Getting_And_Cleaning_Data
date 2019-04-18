The _run_analysis.R_ script has be created in order to perform the data preparation but also to satisfy the 5 steps that are required for this assignment.
        
1. **Download the dataset**
* The dataset has been downloaded and extracted properly and you can find it under the folder which is called UCI HAR Dataset.

2. **Assigning each data from the dataset is needed to make it more understandable**
* _features <- features.txt_
* _activities <- activity_labels.txt_ 
* _subject_test <- test/subject_test.txt_
* _x_test <- test/x_test.txt_
* _y_test <- test/y_test.txt_
* _subject_train <- test/subject_train.txt_ 
* _x_train <- test/x_train.txt_
* _y_train <- test/y_train.txt_

    Now we are able to satisfy the 5 steps.

3. **Step 1 : merging the training and the test sets to create one data set**
* _x_ has been created by merging _x_train_ and _x_test_ using the _rbind()_ function.
* _y_ has been created by merging _y_train_ and _y_test_ using the _rbind()_ function.
* _subject_ has been created by merging _subject_train_ and _subject_test_ using the _rbind()_ function.
* _merged_data_ has been created by merging _x_, _y_ and _subject_ using the _cbind()_ function.

4. **Step 2 : extracting only the measurements on the mean and standard deviation for each measurement**
* _tidy_data_ has been created by subsetting _merged_data_ by selecting only the subject, the code and the measurements on the mean (_mean_) and standard deviation (_std_) for each measurement.

5. **Step 3 : using descriptive activity names to name the activities in the data set**
* Activities were described by entire numbers in _code_ column in _tidy_data_ which is not suitable. Hence, the entire numbers have been replaced by the corresponding activity from the second column of the _activities_ variable.

6. **Step 4 : appropriately labels the data set with descriptive variable names**
* The _code_ column in _tidy_data_ has been renamed into _activities_.
* _Acc_ in every column’s name has been renamed into _Accelerometer_.
* _Gyro_ in every column’s name has been renamed into _Gyroscope_.
* _BodyBody_ in every column’s name has been renamed into _Body_.
* _Mag_ in every column’s name has been renamed into _Magnitude_.
* _^f_ in every column’s name has been renamed into _Frequency_.
* _^t_ in every column’s name has been renamed into _Time_.

    I renamed also other column's names even if it was not necessary as it was already understandable.

7. **Step 5 : from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
* _tidy_data_2_ has been created regarding the requirements and has been exported as _tidy_data_2.txt_ file. 

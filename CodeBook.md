# CodeBook
This document describes the variables, the data, and any transformations or work that performed to clean up the data. 

## Assumptions
It is assumed that the Samsung data is unzipped into the working directory whose name is by default UCI HAR Dataset. The file `run_analysis.R` resides in same folder.

The directory structure is as follows
```
 ---
  |
  |---UCI HAR Dataset/
      |---run_analysis.R
      |---README.txt	
      |---train/      
      |---test/      
      |---activity_labels.txt	      
      |---features_info.txt	
      |---features.txt
```

## Variables
Following two are major global variables:

 - `merged_data`
 - 'finalData`
 
## merged_data
### Data of merged_data
Inside the function `merge_data`, we take data from the following text files:

 - `test/X_test.txt` will give us the local variable, `xtest` containing all the 541 columns of raw data in the test set
 - `train/X_train.txt` will give us the local variable, `xtrain` containing all the 541 columns of raw data in the training set
 - `activities.txt` will give us the local variable, `act_labels` containing all the different types of activities: `WALKING`, `WALKING_UPSTAIRS`, `SITTING`, etc
 - `train/subject_train.txt` will give us the local variable, `sbj_train` containing all the possible subject data inside the training set.
 - `test/subject_test.txt` will give us the local variable, `sbj_test` containing all the possible subject data inside the test set.
 - `train/y_train.txt` will give us the local variable, `ytrain` containing all the possible label data inside the training set.
 - `test/y_test.txt` will give us the local variable, `ytest` containing all the possible label data inside the test set. 
 
### Transformations inside merged_data

 - `x` is the merged data table of `xtest` and `xtrain`
 - `y` is the merged data table of `ytest` and `ytrain`
 - `sbj` is the merged data table of `sbj_test` and `sbj_train`
 - `merged_data` is the merged data table of `x`, `y` and `sbj`
 
## finalData
### Data of finalData
`finalData` is a small subset of `merged_data` and hence it contains same variables as `merged_data` 

### Transformations inside finalData
`finalData` contains independent tidy data set with the average of each variable for each activity and each subject. 

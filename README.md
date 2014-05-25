run_analysis.R
==========
Following steps explain how this script works:

1. **Lines 1-2:** Load the required libraries
2. **Line 4:** Set the wokring directory. It should be set where Samsung data exists
3. **Lines 17-24:** Load all the required files
4. **Line 26:** Change the features to character vector for easier processing
5. **Lines 28-30:** Use `rbind` functions to row wise bind the `xtest` and `xtrain`, `ytest` and `ytrain` and `sbjtest` and `sbjtrain`
6. **Line 32:** Gives labels to features in `x` data.frame
7. **Lines 37-40:** Using `grepl` it finds all the features with `mean()` and `std()`. And line 40 subsets the `x` considering only these features
8. **Line 43:** Converts activity labels for easy comparison
9. **Lines 46-48:** Using `for` loop, it replaces the correspoding activity numbers with activity names so that descriptive activity names to name the activities in the data set are used. 
10. **Line 50:** Using `cbind` it merges the training and the test sets to create one data set.
11. **Lines 52-53:** Uses proper column names
12. **Lines 56-61:** Replaces "-mean()" by "Mean" and "-std()" by "Std" in column name for more readability
13. **Line 66:** Produces the final independent tidy data set with the average of each variable for each activity and each subject. 
14. **Lines 67-70:** Does the same work as Lines 56-61
15. **Line 71:** Writes the tidy data to a file

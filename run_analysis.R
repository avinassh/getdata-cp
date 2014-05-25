library(plyr)
library(reshape2)

setwd('/Users/avi/Documents/code/coursera/getdata/cp/UCI HAR Dataset')

# if (!file.exists('UCI HAR Dataset')){
#     fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
#     dir.create('course-project')
#     download.file(dataFile, "course-project/UCI-HAR-dataset.zip", method="curl")
#     unzip("course-project/UCI-HAR-dataset.zip")
#     setwd('UCI HAR Dataset')
# }

# delete the irrelevant files. 

# read all the files
xtest <- read.table('test/X_test.txt', header=F)
xtrain <- read.table('train/X_train.txt', header=F)
ytest <- read.table('test/y_test.txt', header=F)
ytrain <- read.table('train/y_train.txt', header=F)
sbjtrain <- read.table('train/subject_train.txt', header=F)
sbjtest <- read.table('test/subject_test.txt', header=F)
features <- read.table('features.txt', header=F)
act_labels <- read.table('activity_labels.txt', header=F)

features$V2 <- as.character(features$V2)

x <- rbind(xtest, xtrain)
y <- rbind(ytest, ytrain)
sbj <- rbind(sbjtest, sbjtrain)

names(x) <- features$V2


# find all the colnames which have mean() and std() in their names. And then create a logic vector
# x[, (colnames(x) %in% c("mean", "std"))]
tfs <- grepl( 'mean()', colnames(x), fixed=T) | grepl('std()', colnames(x), fixed=T)
# subset which contains only mean and std variables, subsetting done with logic vector created earlier
# so following will extract only the measurements on the mean and standard deviation for each measurement.
x <- x[, tfs]


act_labels$V2 <- as.character(act_labels$V2)

# to use descriptive activity names to name the activities in the data set
for (i in 1:6) {
    y$V1[which(y$V1==i)] = act_labels$V2[i]
}

# Following merges the training and the test sets to create one data set.
merged_data <- cbind(x, sbj, y)
names(merged_data)[67] = 'subject'
names(merged_data)[68] = 'activity_name'

# to appropriately label the data set with descriptive activity names.
colNamesVector <- colnames(merged_data)
colNamesVector <- gsub("-mean()","Mean", colNamesVector, fixed=TRUE)
colNamesVector <- gsub("-std()","Std", colNamesVector, fixed=TRUE)

# put back in the tidy column names
colnames(merged_data) <- colNamesVector 

# by(merged_data, merged_data$subject, FUN=function(data){tapply(data, as.factor(data$activity_name), mean)})

# produce a tidy data set with the average of each variable for each activity and each subject. 
finalData <- aggregate(x, by = list(activity = y$V1, subject = sbj$V1), mean)
write.table(finalData, 'result.txt')

#by(merged_data, merged_data$subject, FUN=function(data){
#    
#    by(data, as.factor(data$activity_name), FUN=function(deta){
#        
#        sapply(deta, mean)
#    }
#    )})

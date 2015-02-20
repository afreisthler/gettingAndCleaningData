# set working directory
# Expect to find unzipped data in ./data
setwd("/opt/coursera/gettingAndCleaningData/project")

# Import requried libaries
library(dplyr)

##
## Step 1: Merges the training and the test sets to create one data set.
##

# Read in test feature data set.  Add in variables for Subject and Activity.
testFeatureData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testActivities <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
colnames(testSubjects) <- c('Subject')
colnames(testActivities) <- c('ActivityIndex')
testFeatureDataComplete <- cbind(testSubjects, testActivities, testFeatureData)
str(testFeatureDataComplete)

# Read in training feature data set.  Add in variables for Subject and Activity.
trainFeatureData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainSubjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
colnames(trainSubjects) <- c('Subject')
colnames(trainActivities) <- c('ActivityIndex')
trainFeatureDataComplete <- cbind(trainSubjects, trainActivities, trainFeatureData)
str(trainFeatureDataComplete)

# Combine test and training sets together
featureDataComplete <- rbind(testFeatureDataComplete, trainFeatureDataComplete)
str(featureDataComplete)

##
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
##

# We will look at feature names to determine if the variable represents a mean or standard deviation.  Since
#  the data set is not descriptive, I will be interpreting any variable that has mean or std, in any case, at any
#  place in its name to mean it is a mean or standard deviation.

# Read in variable names from features.txt
varNames <- read.table("./data/UCI HAR Dataset/features.txt", sep=" ")

# Create a logical vector using rules from above
meanVarsLogicalVector <- grepl('mean', varNames$V2, ignore.case = TRUE)
stdVarsLogicalVector <- grepl('std', varNames$V2, ignore.case = TRUE)
meanOrStdLogicalVector <- meanVarsLogicalVector | stdVarsLogicalVector

# Need to be sure and keep our Subject and Activity columns we added.  They are at begining.
meanOrStdLogicalVector <- c(c(TRUE, TRUE), meanOrStdLogicalVector)

# Apply vector to only keep desired columns
featureDataCompleteMeanStdExtracted <- featureDataComplete[,meanOrStdLogicalVector]
str(featureDataCompleteMeanStdExtracted)

##
## Step 3: Uses descriptive activity names to name the activities in the data set
##

# Read in activity names from activity_labels.txt
activityNames <- read.table("./data/UCI HAR Dataset/activity_labels.txt", sep=" ")

# Add a new variable with the Activity name using the Index added earlier to lookup correct value
featureDataCompleteMeanStdExtracted <- mutate(featureDataCompleteMeanStdExtracted, Activity=activityNames[,2][featureDataCompleteMeanStdExtracted$ActivityIndex])
str(featureDataCompleteMeanStdExtracted)

##
## Step 4: Appropriately label the data set with descriptive variable names. 
##

# We will replace the V* names with those in the features file

# Read in feature names from features.txt
featureNames <- read.table("./data/UCI HAR Dataset/features.txt", sep=" ")
str(featureNames)

# Get current columns.  Take off the Subject and activity columns we've added.  Use substring to remove the V.
cols <- colnames(featureDataCompleteMeanStdExtracted)
cols <- cols[-(1:2)]
cols <- cols[-length(cols)]
cols <- substring(cols, 2)

# Apend our custom var names back in and assign these values into our data frame
colFeatureNames <- make.names(featureNames[,2][as.integer(cols)])
colsForFullSet <- c(c('Subject', 'ActivityIndex'), as.vector(colFeatureNames), c('ActivityName'))
colnames(featureDataCompleteMeanStdExtracted) <- colsForFullSet
str(featureDataCompleteMeanStdExtracted)

##
## While answer is complete, some minor cleanup before moving on to step 5 to make things pretty.
##

# Rearraning columns slightly, removing Activity Index.  Result will be Subject, Activity, Then all mean/std Feature Values
finalInternalFeatureset <- cbind(featureDataCompleteMeanStdExtracted[1], featureDataCompleteMeanStdExtracted[length(featureDataCompleteMeanStdExtracted)], featureDataCompleteMeanStdExtracted[-(1:2)])
colsForFullSet <- c(c('Subject', 'Activity'), as.vector(colFeatureNames), c('ActivityName'))
colnames(finalInternalFeatureset) <- colsForFullSet
finalInternalFeatureset$ActivityName <- NULL
str(finalInternalFeatureset)

##
## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##

groupedSet <- group_by(finalInternalFeatureset, Subject, Activity)
groupedSetSummarized <- summarise_each(groupedSet, funs(mean))
str(groupedSetSummarized)

write.table(groupedSetSummarized, file="groupedSetSummarized.txt", row.name=FALSE)
# before running the script: extract data in the working folder, subfolder "UCI HAR Dataset"

# prepare column names from features table (to detect mean and std features)
featureNames <- read.table('UCI HAR Dataset/features.txt')$V2
# with cleanup (remove and replace illegal characters)
cleanFeatureNames <- gsub("-", "_", gsub("[\\(\\)]", "", featureNames))

# limit measurements to _mean and _std features
neededFeatureNames <- grep("_mean|_std", cleanFeatureNames, value = TRUE)
nFeatures <- length(neededFeatureNames)

# function to read and process data set (test or train) to prepare it for merge
getDataSet <- function(dataSetName) {
    X <- read.table(sprintf('UCI HAR Dataset/%s/X_%s.txt', dataSetName, dataSetName))
    colnames(X) <- cleanFeatureNames

    # extract necessary features only
    filteredX <- subset(X, select = neededFeatureNames)

    Y <- read.table(sprintf('UCI HAR Dataset/%s/y_%s.txt', dataSetName, dataSetName))
    colnames(Y) <- "Activity"

    Subject <- read.table(sprintf('UCI HAR Dataset/%s/subject_%s.txt', dataSetName, dataSetName))
    colnames(Subject) <- "Subject"

    data <- cbind(Subject, Y, filteredX)
    return(data)
}

# read test and train data and concatenate them
# subjects are unique in each data set, so don't need to distinguish records from test and train data
testData <- getDataSet("test")
trainData <- getDataSet("train")
data <- rbind(testData, trainData)

# add descriptive activity names instead of IDs
activityNames <- read.table('UCI HAR Dataset/activity_labels.txt')
colnames(activityNames) <- c("ID", "Activity")
allData <- merge(activityNames, data, by.x = "ID", by.y = "Activity")
allData$ID <- NULL

# create second data set with averages of each variable
avgData <- aggregate(allData[, 1:nFeatures + 2], by = list(allData$Subject, allData$Activity), FUN = mean)
colnames(avgData)[1] <- "Subject"
colnames(avgData)[2] <- "Activity"
avgData <- avgData[order(avgData$Subject, avgData$Activity), ]

write.table(avgData, file = "averagedData.txt", row.names = FALSE)

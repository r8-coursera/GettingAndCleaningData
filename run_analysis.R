datasetPath <- 'UCI HAR Dataset'

#####
## Download and unzip dataset archive
downloadDataset <- function() {
  url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url, 'Dataset.zip')
  
  unzip('Dataset.zip')
}

#####
## Read and merge test and training data files
readMergedData <- function(file, name=FALSE) {
  data <- data.frame()

  for (folder in c('test', 'train')) {
    filename <- sprintf('%s/%s/%s_%s.txt', datasetPath, folder, file, folder)
    data <- rbind(data, read.table(filename))
  }
  
  if (name != FALSE) {
    colnames(data) <- name
  }
  
  data
}

# Download dataset
#downloadDataset()

# Read features
dataFeatures <- read.table(sprintf('%s/features.txt', datasetPath))
setColumnNames <- dataFeatures$V2

# Read merged set and labels data files
dataLabels <- readMergedData('y', 'activity')
dataSubjects <- readMergedData('subject', 'subject')
dataSet <- readMergedData('X', setColumnNames)

# Read activity labels
activityLabels <- read.table(sprintf('%s/activity_labels.txt', datasetPath))

# Use only mean and standart deviation
dataSet <- dataSet[grepl("mean\\(\\)|std\\(\\)", setColumnNames)]

# Merge data sets
dataSet <- cbind(dataSubjects, dataLabels, dataSet)
# Set activity labels
dataSet$activity <- activityLabels[dataSet$activity, 2]

# Write merged data set
write.table(dataSet, "data.txt")


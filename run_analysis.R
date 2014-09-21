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
downloadDataset()

# Read features
dataFeatures <- read.table(sprintf('%s/features.txt', datasetPath))
setColumnNames <- dataFeatures$V2

# Read merged set and labels data files
dataLabels <- readMergedData('y', 'activity')
dataSubjects <- readMergedData('subject', 'subject')
dataset <- readMergedData('X', setColumnNames)

# Read activity labels
activityLabels <- read.table(sprintf('%s/activity_labels.txt', datasetPath))

# Use only mean and standart deviation
dataset <- dataset[grepl("mean\\(\\)|std\\(\\)", setColumnNames)]

# Merge data sets
dataset <- cbind(dataSubjects, dataLabels, dataset)
# Set activity labels
dataset$activity <- activityLabels[dataset$activity, 2]

# Write merged data set
write.table(dataset, "data.txt", sep="\t", row.names = FALSE)

# Generate tidy data set
tidyDataset <- aggregate(dataset, by=list(dataset$subject, dataset$activity), FUN=mean)

# Remove activity and subject columns and rename aggregated columns
tidyDataset$activity <- NULL
tidyDataset$subject <- NULL
names(tidyDataset)[names(tidyDataset) == 'Group.1'] <- 'subject'
names(tidyDataset)[names(tidyDataset) == 'Group.2'] <- 'activity'

# Write tidy data set
write.table(tidyDataset, "tidy_data.txt", sep="\t", row.names = FALSE)
